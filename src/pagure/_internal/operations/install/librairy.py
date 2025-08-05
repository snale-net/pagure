"""Support for installing and building the "wheel" binary package format."""

from __future__ import annotations

import collections
import compileall
import contextlib
import csv
import importlib
import logging
import os.path
import re
import shutil
import sys
import warnings
from base64 import urlsafe_b64encode
from collections.abc import Generator, Iterable, Iterator, Sequence
from email.message import Message
from itertools import chain, filterfalse, starmap
from typing import (
    IO,
    Any,
    BinaryIO,
    Callable,
    NewType,
    Protocol,
    Union,
    cast,
)
from zipfile import ZipFile, ZipInfo

from pagure._vendor.distlib.scripts import ScriptMaker
from pagure._vendor.distlib.util import get_export_entry
from pagure._vendor.packaging.utils import canonicalize_name

from pagure._internal.exceptions import InstallationError
from pagure._internal.locations import get_major_minor_version
from pagure._internal.metadata import (
    BaseDistribution,
    FilesystemWheel,
    get_wheel_distribution,
)
from pagure._internal.models.direct_url import DIRECT_URL_METADATA_NAME, DirectUrl
from pagure._internal.models.scheme import SCHEME_KEYS, Scheme
from pagure._internal.utils.filesystem import adjacent_tmp_file, replace
from pagure._internal.utils.misc import StreamWrapper, ensure_dir, hash_file, partition
from pagure._internal.utils.unpacking import (
    current_umask,
    is_within_directory,
    set_extracted_file_to_default_mode_plus_executable,
    zip_item_is_executable,
)
from pagure._internal.utils.wheel import parse_wheel

from src.pagure._internal.utils.unpacking import unzip_file, unpack_file


class File(Protocol):
    src_record_path: RecordPath
    dest_path: str
    changed: bool

    def save(self) -> None:
        pass


logger = logging.getLogger(__name__)

RecordPath = NewType("RecordPath", str)
InstalledCSVRow = tuple[RecordPath, str, Union[int, str]]


def rehash(path: str, blocksize: int = 1 << 20) -> tuple[str, str]:
    """Return (encoded_digest, length) for path using hashlib.sha256()"""
    h, length = hash_file(path, blocksize)
    digest = "sha256=" + urlsafe_b64encode(h.digest()).decode("latin1").rstrip("=")
    return (digest, str(length))


def csv_io_kwargs(mode: str) -> dict[str, Any]:
    """Return keyword arguments to properly open a CSV file
    in the given mode.
    """
    return {"mode": mode, "newline": "", "encoding": "utf-8"}


def fix_script(path: str) -> bool:
    """Replace #!python with #!/path/to/python
    Return True if file was changed.
    """
    # XXX RECORD hashes will need to be updated
    assert os.path.isfile(path)

    with open(path, "rb") as script:
        firstline = script.readline()
        if not firstline.startswith(b"#!python"):
            return False
        exename = sys.executable.encode(sys.getfilesystemencoding())
        firstline = b"#!" + exename + os.linesep.encode("ascii")
        rest = script.read()
    with open(path, "wb") as script:
        script.write(firstline)
        script.write(rest)
    return True


def wheel_root_is_purelib(metadata: Message) -> bool:
    return metadata.get("Root-Is-Purelib", "").lower() == "true"


def get_entrypoints(dist: BaseDistribution) -> tuple[dict[str, str], dict[str, str]]:
    console_scripts = {}
    gui_scripts = {}
    for entry_point in dist.iter_entry_points():
        if entry_point.group == "console_scripts":
            console_scripts[entry_point.name] = entry_point.value
        elif entry_point.group == "gui_scripts":
            gui_scripts[entry_point.name] = entry_point.value
    return console_scripts, gui_scripts


def message_about_scripts_not_on_PATH(scripts: Sequence[str]) -> str | None:
    """Determine if any scripts are not on PATH and format a warning.
    Returns a warning message if one or more scripts are not on PATH,
    otherwise None.
    """
    if not scripts:
        return None

    # Group scripts by the path they were installed in
    grouped_by_dir: dict[str, set[str]] = collections.defaultdict(set)
    for destfile in scripts:
        parent_dir = os.path.dirname(destfile)
        script_name = os.path.basename(destfile)
        grouped_by_dir[parent_dir].add(script_name)

    # We don't want to warn for directories that are on PATH.
    not_warn_dirs = [
        os.path.normcase(os.path.normpath(i)).rstrip(os.sep)
        for i in os.environ.get("PATH", "").split(os.pathsep)
    ]
    # If an executable sits with sys.executable, we don't warn for it.
    #     This covers the case of venv invocations without activating the venv.
    not_warn_dirs.append(
        os.path.normcase(os.path.normpath(os.path.dirname(sys.executable)))
    )
    warn_for: dict[str, set[str]] = {
        parent_dir: scripts
        for parent_dir, scripts in grouped_by_dir.items()
        if os.path.normcase(os.path.normpath(parent_dir)) not in not_warn_dirs
    }
    if not warn_for:
        return None

    # Format a message
    msg_lines = []
    for parent_dir, dir_scripts in warn_for.items():
        sorted_scripts: list[str] = sorted(dir_scripts)
        if len(sorted_scripts) == 1:
            start_text = f"script {sorted_scripts[0]} is"
        else:
            start_text = "scripts {} are".format(
                ", ".join(sorted_scripts[:-1]) + " and " + sorted_scripts[-1]
            )

        msg_lines.append(
            f"The {start_text} installed in '{parent_dir}' which is not on PATH."
        )

    last_line_fmt = (
        "Consider adding {} to PATH or, if you prefer "
        "to suppress this warning, use --no-warn-script-location."
    )
    if len(msg_lines) == 1:
        msg_lines.append(last_line_fmt.format("this directory"))
    else:
        msg_lines.append(last_line_fmt.format("these directories"))

    # Add a note if any directory starts with ~
    warn_for_tilde = any(
        i[0] == "~" for i in os.environ.get("PATH", "").split(os.pathsep) if i
    )
    if warn_for_tilde:
        tilde_warning_msg = (
            "NOTE: The current PATH contains path(s) starting with `~`, "
            "which may not be expanded by all applications."
        )
        msg_lines.append(tilde_warning_msg)

    # Returns the formatted multiline message
    return "\n".join(msg_lines)


def _normalized_outrows(
    outrows: Iterable[InstalledCSVRow],
) -> list[tuple[str, str, str]]:
    """Normalize the given rows of a RECORD file.

    Items in each row are converted into str. Rows are then sorted to make
    the value more predictable for tests.

    Each row is a 3-tuple (path, hash, size) and corresponds to a record of
    a RECORD file (see PEP 376 and PEP 427 for details).  For the rows
    passed to this function, the size can be an integer as an int or string,
    or the empty string.
    """
    # Normally, there should only be one row per path, in which case the
    # second and third elements don't come into play when sorting.
    # However, in cases in the wild where a path might happen to occur twice,
    # we don't want the sort operation to trigger an error (but still want
    # determinism).  Since the third element can be an int or string, we
    # coerce each element to a string to avoid a TypeError in this case.
    # For additional background, see--
    # https://github.com/pypa/pip/issues/5868
    return sorted(
        (record_path, hash_, str(size)) for record_path, hash_, size in outrows
    )


def _record_to_fs_path(record_path: RecordPath, lib_dir: str) -> str:
    return os.path.join(lib_dir, record_path)


def _fs_to_record_path(path: str, lib_dir: str) -> RecordPath:
    # On Windows, do not handle relative paths if they belong to different
    # logical disks
    if os.path.splitdrive(path)[0].lower() == os.path.splitdrive(lib_dir)[0].lower():
        path = os.path.relpath(path, lib_dir)

    path = path.replace(os.path.sep, "/")
    return cast("RecordPath", path)


def get_csv_rows_for_installed(
    old_csv_rows: list[list[str]],
    installed: dict[RecordPath, RecordPath],
    changed: set[RecordPath],
    generated: list[str],
    lib_dir: str,
) -> list[InstalledCSVRow]:
    """
    :param installed: A map from archive RECORD path to installation RECORD
        path.
    """
    installed_rows: list[InstalledCSVRow] = []
    for row in old_csv_rows:
        if len(row) > 3:
            logger.warning("RECORD line has more than three elements: %s", row)
        old_record_path = cast("RecordPath", row[0])
        new_record_path = installed.pop(old_record_path, old_record_path)
        if new_record_path in changed:
            digest, length = rehash(_record_to_fs_path(new_record_path, lib_dir))
        else:
            digest = row[1] if len(row) > 1 else ""
            length = row[2] if len(row) > 2 else ""
        installed_rows.append((new_record_path, digest, length))
    for f in generated:
        path = _fs_to_record_path(f, lib_dir)
        digest, length = rehash(f)
        installed_rows.append((path, digest, length))
    return installed_rows + [
        (installed_record_path, "", "") for installed_record_path in installed.values()
    ]


def get_console_script_specs(console: dict[str, str]) -> list[str]:
    """
    Given the mapping from entrypoint name to callable, return the relevant
    console script specs.
    """
    # Don't mutate caller's version
    console = console.copy()

    scripts_to_generate = []

    # Special case pip and setuptools to generate versioned wrappers
    #
    # The issue is that some projects (specifically, pip and setuptools) use
    # code in setup.py to create "versioned" entry points - pip2.7 on Python
    # 2.7, pip3.3 on Python 3.3, etc. But these entry points are baked into
    # the wheel metadata at build time, and so if the wheel is installed with
    # a *different* version of Python the entry points will be wrong. The
    # correct fix for this is to enhance the metadata to be able to describe
    # such versioned entry points.
    # Currently, projects using versioned entry points will either have
    # incorrect versioned entry points, or they will not be able to distribute
    # "universal" wheels (i.e., they will need a wheel per Python version).
    #
    # Because setuptools and pip are bundled with _ensurepip and virtualenv,
    # we need to use universal wheels. As a workaround, we
    # override the versioned entry points in the wheel and generate the
    # correct ones.
    #
    # To add the level of hack in this section of code, in order to support
    # ensurepip this code will look for an ``ENSUREPIP_OPTIONS`` environment
    # variable which will control which version scripts get installed.
    #
    # ENSUREPIP_OPTIONS=altinstall
    #   - Only pipX.Y and easy_install-X.Y will be generated and installed
    # ENSUREPIP_OPTIONS=install
    #   - pipX.Y, pipX, easy_install-X.Y will be generated and installed. Note
    #     that this option is technically if ENSUREPIP_OPTIONS is set and is
    #     not altinstall
    # DEFAULT
    #   - The default behavior is to install pip, pipX, pipX.Y, easy_install
    #     and easy_install-X.Y.
    pip_script = console.pop("pip", None)
    if pip_script:
        if "ENSUREPIP_OPTIONS" not in os.environ:
            scripts_to_generate.append("pip = " + pip_script)

        if os.environ.get("ENSUREPIP_OPTIONS", "") != "altinstall":
            scripts_to_generate.append(f"pip{sys.version_info[0]} = {pip_script}")

        scripts_to_generate.append(f"pip{get_major_minor_version()} = {pip_script}")
        # Delete any other versioned pip entry points
        pip_ep = [k for k in console if re.match(r"pip(\d+(\.\d+)?)?$", k)]
        for k in pip_ep:
            del console[k]
    easy_install_script = console.pop("easy_install", None)
    if easy_install_script:
        if "ENSUREPIP_OPTIONS" not in os.environ:
            scripts_to_generate.append("easy_install = " + easy_install_script)

        scripts_to_generate.append(
            f"easy_install-{get_major_minor_version()} = {easy_install_script}"
        )
        # Delete any other versioned easy_install entry points
        easy_install_ep = [
            k for k in console if re.match(r"easy_install(-\d+\.\d+)?$", k)
        ]
        for k in easy_install_ep:
            del console[k]

    # Generate the console entry points specified in the wheel
    scripts_to_generate.extend(starmap("{} = {}".format, console.items()))

    return scripts_to_generate


class ZipBackedFile:
    def __init__(
        self, src_record_path: RecordPath, dest_path: str, zip_file: ZipFile
    ) -> None:
        self.src_record_path = src_record_path
        self.dest_path = dest_path
        self._zip_file = zip_file
        self.changed = False

    def _getinfo(self) -> ZipInfo:
        return self._zip_file.getinfo(self.src_record_path)

    def save(self) -> None:
        # When we open the output file below, any existing file is truncated
        # before we start writing the new contents. This is fine in most
        # cases, but can cause a segfault if pip has loaded a shared
        # object (e.g. from pyopenssl through its vendored urllib3)
        # Since the shared object is mmap'd an attempt to call a
        # symbol in it will then cause a segfault. Unlinking the file
        # allows writing of new contents while allowing the process to
        # continue to use the old copy.
        if os.path.exists(self.dest_path):
            os.unlink(self.dest_path)

        zipinfo = self._getinfo()

        # optimization: the file is created by open(),
        # skip the decompression when there is 0 bytes to decompress.
        with open(self.dest_path, "wb") as dest:
            if zipinfo.file_size > 0:
                with self._zip_file.open(zipinfo) as f:
                    blocksize = min(zipinfo.file_size, 1024 * 1024)
                    shutil.copyfileobj(f, dest, blocksize)

        if zip_item_is_executable(zipinfo):
            set_extracted_file_to_default_mode_plus_executable(self.dest_path)


class ScriptFile:
    def __init__(self, file: File) -> None:
        self._file = file
        self.src_record_path = self._file.src_record_path
        self.dest_path = self._file.dest_path
        self.changed = False

    def save(self) -> None:
        self._file.save()
        self.changed = fix_script(self.dest_path)


class MissingCallableSuffix(InstallationError):
    def __init__(self, entry_point: str) -> None:
        super().__init__(
            f"Invalid script entry point: {entry_point} - A callable "
            "suffix is required. Cf https://packaging.python.org/"
            "specifications/entry-points/#use-for-scripts for more "
            "information."
        )


def _raise_for_invalid_entrypoint(specification: str) -> None:
    entry = get_export_entry(specification)
    if entry is not None and entry.suffix is None:
        raise MissingCallableSuffix(str(entry))


class PipScriptMaker(ScriptMaker):
    def make(
        self, specification: str, options: dict[str, Any] | None = None
    ) -> list[str]:
        _raise_for_invalid_entrypoint(specification)
        return super().make(specification, options)


def _install_librairy(
    name: str,
    local_file_path: str,
    warn_script_location: bool = True,
    direct_url: DirectUrl | None = None,
    requested: bool = False,
) -> None:
    """Install a wheel.

    :param name: Name of the project to install
    :param wheel_zip: open ZipFile for wheel being installed
    :param scheme: Distutils scheme dictating the install directories
    :param req_description: String used in place of the requirement, for
        logging
    :param pycompile: Whether to byte-compile installed Python files
    :param warn_script_location: Whether to check that scripts are installed
        into a directory on PATH
    :raises UnsupportedWheel:
        * when the directory holds an unpacked wheel with incompatible
          Wheel-Version
        * when the .dist-info dir does not match the wheel
    """
    logger.info(f"Building {name}...")
    #unpack_file(local_file_path,"/work/tmp")
    #logger.info(lib_path)

@contextlib.contextmanager
def req_error_context(req_description: str) -> Generator[None, None, None]:
    try:
        yield
    except InstallationError as e:
        message = f"For req: {req_description}. {e.args[0]}"
        raise InstallationError(message) from e


def install_librairy(
    global_options: Sequence[str],
    prefix: str | None,
    home: str | None,
    use_user_site: bool,
    name: str,
    local_file_path: str,
    unpacked_source_directory: str,
    req_description: str,
    warn_script_location: bool = True,
    direct_url: DirectUrl | None = None,
    requested: bool = False,
) -> None:
    with req_error_context(req_description):
        _install_librairy(
            name=name,
            local_file_path=local_file_path,
            warn_script_location=warn_script_location,
            direct_url=direct_url,
            requested=requested,
        )

from __future__ import annotations

import errno
import logging
import os
import stat
import sys
import urllib
from functools import partial
from pathlib import Path
from types import FunctionType, TracebackType
from typing import (
    Any,
    Callable,
    Optional,
    TypeVar,
    cast,
)

from pagure import __version__
from pagure.utils.retry import retry
from utils.locations import get_major_minor_version

logger = logging.getLogger(__name__)

T = TypeVar("T")
ExcInfo = tuple[type[BaseException], BaseException, TracebackType]
VersionInfo = tuple[int, int, int]
NetlocTuple = tuple[str, tuple[Optional[str], Optional[str]]]
OnExc = Callable[[FunctionType, Path, BaseException], Any]
OnErr = Callable[[FunctionType, Path, ExcInfo], Any]

FILE_CHUNK_SIZE = 1024 * 1024

def get_pip_version() -> str:
    pip_pkg_dir = os.path.join(os.path.dirname(__file__), "..")
    pip_pkg_dir = os.path.abspath(pip_pkg_dir)

    return f"pip {__version__} from {pip_pkg_dir} (python {get_major_minor_version()})"

# Simulates an enum
def enum(*sequential: Any, **named: Any) -> type[Any]:
    enums = dict(zip(sequential, range(len(sequential))), **named)
    reverse = {value: key for key, value in enums.items()}
    enums["reverse_mapping"] = reverse
    return type("Enum", (), enums)

def ensure_dir(path: str) -> None:
    """os.path.makedirs without EEXIST."""
    try:
        os.makedirs(path)
    except OSError as e:
        # Windows can raise spurious ENOTEMPTY errors. See #6426.
        if e.errno != errno.EEXIST and e.errno != errno.ENOTEMPTY:
            raise

def format_size(bytes: float) -> str:
    if bytes > 1000 * 1000:
        return f"{bytes / 1000.0 / 1000:.1f} MB"
    elif bytes > 10 * 1000:
        return f"{int(bytes / 1000)} kB"
    elif bytes > 1000:
        return f"{bytes / 1000.0:.1f} kB"
    else:
        return f"{int(bytes)} bytes"


def normalize_path(path: str, resolve_symlinks: bool = True) -> str:
    """
    Convert a path to its canonical, case-normalized, absolute version.

    """
    path = os.path.expanduser(path)
    if resolve_symlinks:
        path = os.path.realpath(path)
    else:
        path = os.path.abspath(path)
    return os.path.normcase(path)

def get_prog() -> str:
    try:
        prog = os.path.basename(sys.argv[0])
        if prog in ("__main__.py", "-c"):
            return f"{sys.executable} -m pip"
        else:
            return prog
    except (AttributeError, TypeError, IndexError):
        pass
    return "pip"


# Retry every half second for up to 3 seconds
@retry(stop_after_delay=3, wait=0.5)
def rmtree(dir: str, ignore_errors: bool = False, onexc: OnExc | None = None) -> None:
    if ignore_errors:
        onexc = _onerror_ignore
    if onexc is None:
        onexc = _onerror_reraise
    handler: OnErr = partial(rmtree_errorhandler, onexc=onexc)
    if sys.version_info >= (3, 12):
        # See https://docs.python.org/3.12/whatsnew/3.12.html#shutil.
        shutil.rmtree(dir, onexc=handler)  # type: ignore
    else:
        shutil.rmtree(dir, onerror=handler)  # type: ignore

def _onerror_ignore(*_args: Any) -> None:
    pass


def _onerror_reraise(*_args: Any) -> None:
    raise  # noqa: PLE0704 - Bare exception used to reraise existing exception


def rmtree_errorhandler(
    func: FunctionType,
    path: Path,
    exc_info: ExcInfo | BaseException,
    *,
    onexc: OnExc = _onerror_reraise,
) -> None:
    """
    `rmtree` error handler to 'force' a file remove (i.e. like `rm -f`).

    * If a file is readonly then it's write flag is set and operation is
      retried.

    * `onerror` is the original callback from `rmtree(... onerror=onerror)`
      that is chained at the end if the "rm -f" still fails.
    """
    try:
        st_mode = os.stat(path).st_mode
    except OSError:
        # it's equivalent to os.path.exists
        return

    if not st_mode & stat.S_IWRITE:
        # convert to read/write
        try:
            os.chmod(path, st_mode | stat.S_IWRITE)
        except OSError:
            pass
        else:
            # use the original function to repeat the operation
            try:
                func(path)
                return
            except OSError:
                pass

    if not isinstance(exc_info, BaseException):
        _, exc_info, _ = exc_info
    onexc(func, path, exc_info)

def redact_auth_from_url(url: str) -> str:
    """Replace the password in a given url with ****."""
    return _transform_url(url, _redact_netloc)[0]


def _redact_netloc(netloc: str) -> tuple[str]:
    return (redact_netloc(netloc),)

def redact_netloc(netloc: str) -> str:
    """
    Replace the sensitive data in a netloc with "****", if it exists.

    For example:
        - "user:pass@example.com" returns "user:****@example.com"
        - "accesstoken@example.com" returns "****@example.com"
    """
    netloc, (user, password) = split_auth_from_netloc(netloc)
    if user is None:
        return netloc
    if password is None:
        user = "****"
        password = ""
    else:
        user = urllib.parse.quote(user)
        password = ":****"
    return f"{user}{password}@{netloc}"


def split_auth_from_netloc(netloc: str) -> NetlocTuple:
    """
    Parse out and remove the auth information from a netloc.

    Returns: (netloc, (username, password)).
    """
    if "@" not in netloc:
        return netloc, (None, None)

    # Split from the right because that's how urllib.parse.urlsplit()
    # behaves if more than one @ is present (which can be checked using
    # the password attribute of urlsplit()'s return value).
    auth, netloc = netloc.rsplit("@", 1)
    pw: str | None = None
    if ":" in auth:
        # Split from the left because that's how urllib.parse.urlsplit()
        # behaves if more than one : is present (which again can be checked
        # using the password attribute of the return value)
        user, pw = auth.split(":", 1)
    else:
        user, pw = auth, None

    user = urllib.parse.unquote(user)
    if pw is not None:
        pw = urllib.parse.unquote(pw)

    return netloc, (user, pw)


def _transform_url(
    url: str, transform_netloc: Callable[[str], tuple[Any, ...]]
) -> tuple[str, NetlocTuple]:
    """Transform and replace netloc in a url.

    transform_netloc is a function taking the netloc and returning a
    tuple. The first element of this tuple is the new netloc. The
    entire tuple is returned.

    Returns a tuple containing the transformed url as item 0 and the
    original tuple returned by transform_netloc as item 1.
    """
    purl = urllib.parse.urlsplit(url)
    netloc_tuple = transform_netloc(purl.netloc)
    # stripped url
    url_pieces = (purl.scheme, netloc_tuple[0], purl.path, purl.query, purl.fragment)
    surl = urllib.parse.urlunsplit(url_pieces)
    return surl, cast("NetlocTuple", netloc_tuple)


def strtobool(val: str) -> int:
    """Convert a string representation of truth to true (1) or false (0).

    True values are 'y', 'yes', 't', 'true', 'on', and '1'; false values
    are 'n', 'no', 'f', 'false', 'off', and '0'.  Raises ValueError if
    'val' is anything else.
    """
    val = val.lower()
    if val in ("y", "yes", "t", "true", "on", "1"):
        return 1
    elif val in ("n", "no", "f", "false", "off", "0"):
        return 0
    else:
        raise ValueError(f"invalid truth value {val!r}")


def write_output(msg: Any, *args: Any) -> None:
    logger.info(msg, *args)
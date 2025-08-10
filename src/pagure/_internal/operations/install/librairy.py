"""Support for installing and building the "wheel" binary package format."""

from __future__ import annotations

import contextlib
import logging
import os.path
from collections.abc import Generator, Sequence

from pagure._internal.build_env import BuildEnvironment
from pagure._internal.exceptions import InstallationError
from pagure._internal.models.direct_url import DirectUrl
from pagure._internal.utils.logging import indent_log
from pagure._internal.utils.setuptools_build import make_setuptools_develop_args
from pagure._internal.utils.subprocess import call_subprocess
from pagure._vendor.pyyaml.lib import yaml
from pagure.configuration import Configuration, kinds

logger = logging.getLogger(__name__)
def load_yaml_config(yaml_path: str) -> dict:
    """
    Loads and parses a YAML configuration file.

    Args:
        yaml_path (str): The file path to the YAML configuration file.

    Returns:
        dict: A dictionary containing the parsed YAML configuration.
    """
    with open(yaml_path, "r", encoding="utf-8") as f:
        return yaml.safe_load(f)

def _install_librairy(
        name: str,
        source_directory: str,
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
    config = load_yaml_config(os.path.join(source_directory, "pagure.yaml"))

    working_dir = os.path.join(source_directory, f"{config['project']['name']}-{config['project']['version']}")

    if "builder" in config:

        # TODO better define witch value to use between USER, SITE and GLOBAL
        configuration = Configuration(
            isolated=False, load_only=kinds.USER
        )
        configuration.load()

        commands = config["builder"]["commands"].format(
            prefix=configuration.get_value("user.prefix"),
        )

        with indent_log():
            for cmd in commands.split("\n"):
                logger.info("Running %s", cmd)
                try:
                    call_subprocess(
                        cmd.strip().split(" "), command_desc=f"{cmd}", cwd=working_dir,
                        show_stdout=True
                    )
                except Exception as ex:
                    logger.error("Failed %s : %s", cmd,ex)


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
            source_directory=unpacked_source_directory,
            warn_script_location=warn_script_location,
            direct_url=direct_url,
            requested=requested,
        )


def install_editable(
    *,
    global_options: Sequence[str],
    prefix: str | None,
    home: str | None,
    use_user_site: bool,
    name: str,
    setup_py_path: str,
    isolated: bool,
    build_env: BuildEnvironment,
    unpacked_source_directory: str,
) -> None:
    """Install a package in editable mode. Most arguments are pass-through
    to setuptools.
    """
    logger.info("Running setup.py develop for %s", name)

    args = make_setuptools_develop_args(
        setup_py_path,
        global_options=global_options,
        no_user_config=isolated,
        prefix=prefix,
        home=home,
        use_user_site=use_user_site,
    )

    with indent_log():
        with build_env:
            call_subprocess(
                args,
                command_desc="python setup.py develop",
                cwd=unpacked_source_directory,
            )

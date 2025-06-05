import configparser
import os
import sys
from logging import getLogger
from typing import Any, List, Optional, NewType
from pip._internal.exceptions import ConfigurationError
from pip._internal.utils import appdirs
from pip._internal.utils.misc import enum
from pip._internal.utils.compat import WINDOWS

RawConfigParser = configparser.RawConfigParser  # Shorthand
Kind = NewType("Kind", str)

CONFIG_BASENAME = "pip.ini" if WINDOWS else "pip.conf"
ENV_NAMES_IGNORED = "version", "help"

# The kinds of configurations there are.
kinds = enum(
    USER="user",  # User Specific
    GLOBAL="global",  # System Wide
    SITE="site",  # [Virtual] Environment Specific
    ENV="env",  # from PIP_CONFIG_FILE
    ENV_VAR="env-var",  # from Environment Variables
)
OVERRIDE_ORDER = kinds.GLOBAL, kinds.USER, kinds.SITE, kinds.ENV, kinds.ENV_VAR
VALID_LOAD_ONLY = kinds.USER, kinds.GLOBAL, kinds.SITE

logger = getLogger(__name__)

# NOTE: Maybe use the optionx attribute to normalize keynames.
def _normalize_name(name: str) -> str:
    """Make a name consistent regardless of source (environment or file)"""
    name = name.lower().replace("_", "-")
    if name.startswith("--"):
        name = name[2:]  # only prefer long opts
    return name


def _disassemble_key(name: str) -> list[str]:
    if "." not in name:
        error_message = (
            "Key does not contain dot separated section and key. "
            f"Perhaps you wanted to use 'global.{name}' instead?"
        )
        raise ConfigurationError(error_message)
    return name.split(".", 1)


def get_configuration_files() -> dict[Kind, list[str]]:
    global_config_files = [
        os.path.join(path, CONFIG_BASENAME) for path in appdirs.site_config_dirs("pip")
    ]

    site_config_file = os.path.join(sys.prefix, CONFIG_BASENAME)
    legacy_config_file = os.path.join(
        os.path.expanduser("~"),
        "pip" if WINDOWS else ".pip",
        CONFIG_BASENAME,
    )
    new_config_file = os.path.join(appdirs.user_config_dir("pip"), CONFIG_BASENAME)
    return {
        kinds.GLOBAL: global_config_files,
        kinds.SITE: [site_config_file],
        kinds.USER: [legacy_config_file, new_config_file],
    }

class Configuration:
    """
    Manages the application configuration.
    """
    def __init__(self, config_files: Optional[List[str]] = None):
        """
        Initializes the configuration object.
        :param config_files: List of configuration files to load.
        """
        self.config_files = config_files or self._get_config_files()
        self.config = configparser.ConfigParser()
        self.load_config()

    def _get_config_files(self) -> List[str]:
        """
        Returns the paths of the default configuration files.
        :return: List of configuration file paths.
        """
        files = []
        # macOS
        if sys.platform == "darwin":
            mac_path = os.path.expanduser("~/Library/Application Support/pagure/config.ini")
            files.append(mac_path)
        # XDG (Linux/Unix)
        xdg = os.environ.get("XDG_CONFIG_HOME")
        if xdg:
            files.append(os.path.join(xdg, "pagure", "config.ini"))
        files.append(os.path.expanduser("~/.config/pagure/config.ini"))
        # Legacy
        files.append(os.path.expanduser("~/.pagure_config.ini"))
        return files

    def load_config(self) -> None:
        """
        Loads the configuration from the configuration files.
        """
        self.config.read(self.config_files)

    def get_value(self, section: str, key: str) -> Any:
        """
        Gets a value from the configuration.
        :param section: Configuration section.
        :param key: Configuration key.
        :return: Configuration value.
        """
        return self.config.get(section, key)

    def set_value(self, section: str, key: str, value: Any) -> None:
        """
        Sets a value in the configuration.
        :param section: Configuration section.
        :param key: Configuration key.
        :param value: Value to set.
        """
        if not self.config.has_section(section):
            self.config.add_section(section)
        self.config.set(section, key, value)

    def save_config(self) -> None:
        """
        Saves the configuration to the files.
        """
        for config_file in self.config_files:
            os.makedirs(os.path.dirname(config_file), exist_ok=True)
            with open(config_file, 'w') as f:
                self.config.write(f)

    def add_config_file(self, config_file: str) -> None:
        """
        Adds a configuration file to the list of files to load.
        :param config_file: Path of the configuration file to add.
        """
        self.config_files.append(config_file)
        self.load_config()

    def items(self):
        """
        Returns all configuration items as a flat dictionary.
        """
        all_items = {}
        for section in self.config.sections():
            for key, value in self.config.items(section):
                all_items[f"{section}.{key}"] = value
        return all_items.items()

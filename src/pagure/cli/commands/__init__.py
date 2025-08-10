"""
Package containing all pip commands
"""

from __future__ import annotations

import importlib
from collections import namedtuple
from typing import Any

from pagure.cli.base_command import Command

CommandInfo = namedtuple("CommandInfo", "module_path, class_name, summary")

# This dictionary does a bunch of heavy lifting for help output:
# - Enables avoiding additional (costly) imports for presenting `--help`.
# - The ordering matters for help display.
#
# Even though the module path starts with the same "pagure._internal.commands"
# prefix, the full path makes testing easier (specifically when modifying
# `commands_dict` in test setup / teardown).
commands_dict: dict[str, CommandInfo] = {
    "install": CommandInfo(
        "pagure.cli.commands.install",
        "InstallCommand",
        "Install packages.",
    ),
    "download": CommandInfo(
        "pagure._internal.commands.download",
        "DownloadCommand",
        "Download packages.",
    ),
    "uninstall": CommandInfo(
        "pagure.cli.commands.uninstall",
        "UninstallCommand",
        "Uninstall packages.",
    ),
    "config": CommandInfo(
        "pagure.cli.commands.configuration",
        "ConfigurationCommand",
        "Manage local and global configuration.",
    ),
    "list": CommandInfo(
        "pagure._internal.commands.list",
        "ListCommand",
        "List installed packages.",
    ),
    "show": CommandInfo(
        "pagure._internal.commands.show",
        "ShowCommand",
        "Show information about installed packages.",
    ),
    "help": CommandInfo(
        "pagure.cli.commands.help",
        "HelpCommand",
        "Show help for commands.",
    ),
}


def create_command(name: str, **kwargs: Any) -> Command:
    """
    Create an instance of the Command class with the given name.
    """
    module_path, class_name, summary = commands_dict[name]
    module = importlib.import_module(module_path)
    command_class = getattr(module, class_name)
    command = command_class(name=name, summary=summary, **kwargs)

    return command


def get_similar_commands(name: str) -> str | None:
    """Command name auto-correct."""
    from difflib import get_close_matches

    name = name.lower()

    close_commands = get_close_matches(name, commands_dict.keys())

    if close_commands:
        return close_commands[0]
    else:
        return None

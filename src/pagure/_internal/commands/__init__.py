"""
Package containing all pagure commands
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
        "pagure._internal.commands.install",
        "InstallCommand",
        "Install packages.",
    ),
    "lock": CommandInfo(
        "pagure._internal.commands.lock",
        "LockCommand",
        "Generate a lock file.",
    ),
    "download": CommandInfo(
        "pagure._internal.commands.download",
        "DownloadCommand",
        "Download packages.",
    ),
    "uninstall": CommandInfo(
        "pagure._internal.commands.uninstall",
        "UninstallCommand",
        "Uninstall packages.",
    ),
    "freeze": CommandInfo(
        "pagure._internal.commands.freeze",
        "FreezeCommand",
        "Output installed packages in requirements format.",
    ),
    "inspect": CommandInfo(
        "pagure._internal.commands.inspect",
        "InspectCommand",
        "Inspect the python environment.",
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
    "check": CommandInfo(
        "pagure._internal.commands.check",
        "CheckCommand",
        "Verify installed packages have compatible dependencies.",
    ),
    "config": CommandInfo(
        "pagure._internal.commands.configuration",
        "ConfigurationCommand",
        "Manage local and global configuration.",
    ),
    "search": CommandInfo(
        "pagure._internal.commands.search",
        "SearchCommand",
        "Search PyPI for packages.",
    ),
    "cache": CommandInfo(
        "pagure._internal.commands.cache",
        "CacheCommand",
        "Inspect and manage pagure's wheel cache.",
    ),
    "index": CommandInfo(
        "pagure._internal.commands.index",
        "IndexCommand",
        "Inspect information available from package indexes.",
    ),
    "wheel": CommandInfo(
        "pagure._internal.commands.wheel",
        "WheelCommand",
        "Build wheels from your requirements.",
    ),
    "hash": CommandInfo(
        "pagure._internal.commands.hash",
        "HashCommand",
        "Compute hashes of package archives.",
    ),
    "completion": CommandInfo(
        "pagure._internal.commands.completion",
        "CompletionCommand",
        "A helper command used for command completion.",
    ),
    "debug": CommandInfo(
        "pagure._internal.commands.debug",
        "DebugCommand",
        "Show information useful for debugging.",
    ),
    "help": CommandInfo(
        "pagure._internal.commands.help",
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

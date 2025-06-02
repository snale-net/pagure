# src/pagure/cli/commands/__init__.py
# Register of commands

from .configuration import ConfigurationCommand

COMMANDS = {
    "config": ConfigurationCommand,
}

def create_command(name):
    try:
        return COMMANDS[name]()
    except KeyError:
        raise ValueError(f"Unknown command : {name}")

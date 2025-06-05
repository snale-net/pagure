import sys

from ..base_command import Command
from ...configuration import Configuration

class ConfigurationCommand(Command):
    name = "config"
    usage = "pagure config [debug|set|list] ..."
    summary = "Manage pagure configuration."

    def add_options(selfself,parser):
        """ Specific Options"""
        #To implement here
        pass

    def run(self, options):
        action = options.get("action")
        config = Configuration()
        if action == "debug":
            print("Actual Configuration:")
            for k, v in config.items():
                print(f"{k}: {v}")
        elif action == "set":
            key = options.get("key")
            value = options.get("value")
            config.set(key, value)
            print(f"{key} = {value} (saved)")
        elif action == "list":
            for k, v in config.items():
                print(f"{k}: {v}")
        else:
            print("Unknown action")
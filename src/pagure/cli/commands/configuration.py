from ..base_command import BaseCommand
from ...configuration import load_config

class ConfigurationCommand(BaseCommand):
    def main(self, args):
        action = args.get("action")
        if action == "debug":
            config = load_config()
            print("Configuration actuelle :")
            for k, v in config.items():
                print(f"{k}: {v}")
        else:
            print(f"Action inconnue : {action}")

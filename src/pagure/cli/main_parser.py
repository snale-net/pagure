import argparse

def parse_command(args):
    parser = argparse.ArgumentParser(prog="pagure")
    subparsers = parser.add_subparsers(dest="command", required=True)

    config_parser = subparsers.add_parser("config", help="Manage configuration")
    config_subparsers = config_parser.add_subparsers(dest="action", required=True)
    config_subparsers.add_parser("debug", help="Show configuration")
    set_parser = config_subparsers.add_parser("set", help="Set a value")
    set_parser.add_argument("key")
    set_parser.add_argument("value")
    config_subparsers.add_parser("list", help="List configuration")

    parsed = parser.parse_args(args)
    return parsed.command, vars(parsed)

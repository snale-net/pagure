import argparse

def parse_command(args):
    parser = argparse.ArgumentParser(prog="pagure")
    subparsers = parser.add_subparsers(dest="command", required=True)

    config_parser = subparsers.add_parser("config", help="Gérer la configuration")
    config_parser.add_argument("action", choices=["debug"], help="Action à effectuer")

    parsed = parser.parse_args(args)
    return parsed.command, vars(parsed)

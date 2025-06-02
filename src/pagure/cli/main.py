import sys
from .main_parser import parse_command
from .commands import create_command

def main(args=None):
    if args is None:
        args = sys.argv[1:]

    cmd_name, cmd_args = parse_command(args)
    command = create_command(cmd_name)
    return command.main(cmd_args)

if __name__ == "__main__":
    sys.exit(main())
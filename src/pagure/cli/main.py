import sys
from .commands import create_command
from .main_parser import parse_command

def main(args=None):
    if args is None:
        args = sys.argv[1:]
    cmd_name, options = parse_command(args)
    command = create_command(cmd_name)
    return command.run(options)

if __name__ == "__main__":
    sys.exit(main())
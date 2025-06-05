# src/pagure/cli/base_command.py
class Command:
    """ First Class for all Cli Command """
    name = None
    usage = None
    summary = None

    def __init__(self):
        pass

    def run(self, options):
        """ Method to overload in each command """
        raise NotImplementedError("Subclasses must implement the 'run' method.")

    def get_usage(self,options):
        """ Returns the help string for using the command"""
        return self.usage or ""

    def get_summary(self):
        """  Returns the command summary string """
        return self.summary or ""
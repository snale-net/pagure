from abc import ABC, abstractmethod

class BaseCommand(ABC):
    @abstractmethod
    def main(self, args):
        pass
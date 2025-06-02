import os
import sys
import json

class Configuration:
    def __init__(self):
        self.files = self._get_config_files()
        self._config = {}
        self.load()

    def _get_config_files(self):
        files = []
        # macOS
        if sys.platform == "darwin":
            mac_path = os.path.expanduser("~/Library/Application Support/pagure/config.json")
            files.append(mac_path)
        # XDG (Linux/Unix)
        xdg = os.environ.get("XDG_CONFIG_HOME")
        if xdg:
            files.append(os.path.join(xdg, "pagure", "config.json"))
        files.append(os.path.expanduser("~/.config/pagure/config.json"))
        # Legacy
        files.append(os.path.expanduser("~/.pagure_config.json"))
        return files

    def load(self):
        config = {}
        for path in self.files:
            if os.path.exists(path):
                try:
                    with open(path, "r") as f:
                        data = json.load(f)
                        config.update(data)
                except Exception:
                    continue
        self._config = config

    def get(self, key, default=None):
        return self._config.get(key, default)

    def set(self, key, value):
        self._config[key] = value
        self.save()

    def save(self):

        path = self.files[0]
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "w") as f:
            json.dump(self._config, f, indent=2)

    def items(self):
        return self._config.items()

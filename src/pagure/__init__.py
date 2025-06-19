from __future__ import annotations

__version__ = "2.0.0"


def main(args: list[str] | None = None) -> int:
    """This is an internal API only meant for use by pagure's own console scripts.
    """
    from pagure._internal.utils.entrypoints import _wrapper

    return _wrapper(args)
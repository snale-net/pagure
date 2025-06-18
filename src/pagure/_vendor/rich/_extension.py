from typing import Any


def load_ipython_extension(ip: Any) -> None:  # pragma: no cover
    # prevent circular import
    from _vendor.rich.pretty import install
    from pagure._vendor.rich.traceback import install as tr_install

    install()
    tr_install()

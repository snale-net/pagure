# Expose a limited set of classes and functions so callers outside of
# the vcs package don't need to import deeper than `pip._internal.vcs`.
# (The test directory may still need to import from a vcs sub-package.)
# Import all vcs modules to register each VCS in the VcsSupport object.
import pagure._internal.vcs.bazaar
import pagure._internal.vcs.git
import pagure._internal.vcs.mercurial
import pagure._internal.vcs.subversion  # noqa: F401
from pagure._internal.vcs.versioncontrol import (  # noqa: F401
    RemoteNotFoundError,
    RemoteNotValidError,
    is_url,
    make_vcs_requirement_url,
    vcs,
)

from __future__ import annotations

import importlib.util
import os
from collections import namedtuple
from typing import Any

from pagure._vendor.packaging.requirements import InvalidRequirement

from pagure._internal.exceptions import (
    InstallationError,
    InvalidPyProjectBuildRequires,
    MissingPyProjectBuildRequires,
)
from pagure._internal.utils.compat import tomllib
from pagure._internal.utils.packaging import get_requirement

from pagure._vendor.pyyaml.lib import yaml


def _is_list_of_str(obj: Any) -> bool:
    return isinstance(obj, list) and all(isinstance(item, str) for item in obj)


def make_pagure_path(unpacked_source_directory: str) -> str:
    return os.path.join(unpacked_source_directory, "pagure.yaml")


BuildSystemDetails = namedtuple(
    "BuildSystemDetails", ["requires", "backend", "check", "backend_path"]
)


def load_pagure_builder(
    use_pep517: bool | None, pyproject_toml: str, setup_py: str, req_name: str
) -> BuildSystemDetails | None:
    """Load the pagure.yaml file.

    Parameters:
        use_pep517 - Has the user requested PEP 517 processing? None
                     means the user hasn't explicitly specified.
        pyproject_toml - Location of the project's pyproject.toml file
        setup_py - Location of the project's setup.py file
        req_name - The name of the requirement we're processing (for
                   error reporting)

    Returns:
        None if we should use the legacy code path, otherwise a tuple
        (
            requirements from pyproject.toml,
            name of PEP 517 backend,
            requirements we should check are installed after setting
                up the build environment
            directory paths to import the backend from (backend-path),
                relative to the project root.
        )
    """
    has_pagure = os.path.isfile(pyproject_toml)

    if not has_pagure:
        raise InstallationError(
            f"{req_name} does not appear to be a Python project: "
            f"neither 'setup.py' nor 'pyproject.toml' found."
        )

    build_system = {
        "requires": [],
        "build-backend": "build_meta",
        "backend-path": "."
    }

    # If we're using PEP 517, we have build system information (either
    # from pyproject.toml, or defaulted by the code above).
    # Note that at this point, we do not know if the user has actually
    # specified a backend, though.
    assert build_system is not None

    # Ensure that the build-system section in pyproject.toml conforms
    # to PEP 518.

    # Specifying the build-system table but not the requires key is invalid
    if "requires" not in build_system:
        raise MissingPyProjectBuildRequires(package=req_name)

    # Error out if requires is not a list of strings
    requires = build_system["requires"]
    if not _is_list_of_str(requires):
        raise InvalidPyProjectBuildRequires(
            package=req_name,
            reason="It is not a list of strings.",
        )

    # Each requirement must be valid as per PEP 508
    for requirement in requires:
        try:
            get_requirement(requirement)
        except InvalidRequirement as error:
            raise InvalidPyProjectBuildRequires(
                package=req_name,
                reason=f"It contains an invalid requirement: {requirement!r}",
            ) from error

    backend = build_system.get("build-backend")
    backend_path = build_system.get("backend-path", [])
    check: list[str] = []
    if backend is None:
        # If the user didn't specify a backend, we assume they want to use
        # the setuptools backend. But we can't be sure they have included
        # a version of setuptools which supplies the backend. So we
        # make a note to check that this requirement is present once
        # we have set up the environment.
        # This is quite a lot of work to check for a very specific case. But
        # the problem is, that case is potentially quite common - projects that
        # adopted PEP 518 early for the ability to specify requirements to
        # execute setup.py, but never considered needing to mention the build
        # tools themselves. The original PEP 518 code had a similar check (but
        # implemented in a different way).
        backend = "setuptools.build_meta:__legacy__"
        check = ["setuptools>=40.8.0"]

    return BuildSystemDetails(requires, backend, check, backend_path)

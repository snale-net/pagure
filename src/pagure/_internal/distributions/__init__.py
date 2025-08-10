from pagure._internal.distributions.base import AbstractDistribution
from pagure._internal.distributions.sdist import SourceDistribution
from pagure._internal.req.req_install import InstallRequirement


def make_distribution_for_install_requirement(
    install_req: InstallRequirement,
) -> AbstractDistribution:
    """Returns a Distribution for the given InstallRequirement"""
    # Editable requirements will always be source distributions. They use the
    # legacy logic until we create a modern standard for them.
    if install_req.editable:
        return SourceDistribution(install_req)

    # Otherwise, a SourceDistribution
    return SourceDistribution(install_req)

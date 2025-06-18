================
Vendoring Policy
================

* Vendored libraries **MUST** not be modified except as required to
  successfully vendor them.
* Vendored libraries **MUST** be released copies of libraries available on
  PyPI.
* Vendored libraries **MUST** be available under a license that allows
  them to be integrated into ``pagure``, which is released under the MIT license.
* Vendored libraries **MUST** be accompanied with LICENSE files.
* The versions of libraries vendored in pagure **MUST** be reflected in
  ``pagure/_vendor/vendor.txt``.
* Vendored libraries **MUST** function without any build steps such as ``2to3``
  or compilation of C code, practically this limits to single source 2.x/3.x and
  pure Python.
* Any modifications made to libraries **MUST** be noted in
  ``pagure/_vendor/README.rst`` and their corresponding patches **MUST** be
  included ``tools/vendoring/patches``.
* Vendored libraries should have corresponding ``vendored()`` entries in
  ``pagure/_vendor/__init__.py``.

Rationale
=========

There are several issues with having dependencies in the traditional
way (via ``install_requires``) for pagure. These issues are:

**Fragility**
   When pagure depends on another library to function then if for whatever reason
   that library either isn't installed or an incompatible version is installed
   then pagure ceases to function. This is of course true for all Python
   applications, however for every application *except* for pagure the way you fix
   it is by re-running pagure. Obviously, when pagure can't run, you can't use pagure to
   fix pagure, so you're left having to manually resolve dependencies and
   installing them by hand.

**Making other libraries uninstallable**
   One of pagure's current dependencies is the ``requests`` library, for which pagure
   requires a fairly recent version to run. If pagure depended on ``requests`` in
   the traditional manner, then we'd either have to maintain compatibility with
   every ``requests`` version that has ever existed (and ever will), OR allow
   pagure to render certain versions of ``requests`` uninstallable. (The second
   issue, although technically true for any Python application, is magnified by
   pagure's ubiquity; pagure is installed by default in Python, in ``pyvenv``, and in
   ``virtualenv``.)

**Security**
   This might seem puzzling at first glance, since vendoring has a tendency to
   complicate updating dependencies for security updates, and that holds true
   for pagure. However, given the *other* reasons for avoiding dependencies, the
   alternative is for pagure to reinvent the wheel itself.  This is what pagure did
   historically. It forced pagure to re-implement its own HTTPS verification
   routines as a workaround for the Python standard library's lack of SSL
   validation, which resulted in similar bugs in the validation routine in
   ``requests`` and ``urllib3``, except that they had to be discovered and
   fixed independently. Even though we're vendoring, reusing libraries keeps
   pagure more secure by relying on the great work of our dependencies, *and*
   allowing for faster, easier security fixes by simply pulling in newer
   versions of dependencies.

**Bootstrapping**
   Currently most popular methods of installing pagure rely on pagure's
   self-contained nature to install pagure itself. These tools work by bundling a
   copy of pagure, adding it to ``sys.path``, and then executing that copy of pagure.
   This is done instead of implementing a "mini installer" (to reduce
   duplication); pagure already knows how to install a Python package, and is far
   more battle-tested than any "mini installer" could ever possibly be.

Many downstream redistributors have policies against this kind of bundling, and
instead opt to patch the software they distribute to debundle it and make it
rely on the global versions of the software that they already have packaged
(which may have its own patches applied to it). We (the pagure team) would prefer
it if pagure was *not* debundled in this manner due to the above reasons and
instead we would prefer it if pagure would be left intact as it is now.

In the longer term, if someone has a *portable* solution to the above problems,
other than the bundling method we currently use, that doesn't add additional
problems that are unreasonable then we would be happy to consider, and possibly
switch to said method. This solution must function correctly across all of the
situation that we expect pagure to be used and not mandate some external mechanism
such as OS packages.


Modifications
=============

* ``setuptools`` is completely stripped to only keep ``pkg_resources``.
* ``pkg_resources`` has been modified to import its dependencies from
  ``pagure._vendor``, and to use the vendored copy of ``platformdirs``
  rather than ``appdirs``.
* ``packaging`` has been modified to import its dependencies from
  ``pagure._vendor``.
* ``CacheControl`` has been modified to import its dependencies from
  ``pagure._vendor``.
* ``requests`` has been modified to import its other dependencies from
  ``pagure._vendor`` and to *not* load ``simplejson`` (all platforms) and
  ``pyopenssl`` (Windows).
* ``platformdirs`` has been modified to import its submodules from ``pagure._vendor.platformdirs``.

Automatic Vendoring
===================

Vendoring is automated via the `vendoring <https://pypi.org/project/vendoring/>`_ tool from the content of
``pagure/_vendor/vendor.txt`` and the different patches in
``tools/vendoring/patches``.
Launch it via ``vendoring sync . -v`` (requires ``vendoring>=0.2.2``).
Tool configuration is done via ``pyproject.toml``.

To update the vendored library versions, we have a session defined in ``nox``.
The command to upgrade everything is::

    nox -s vendoring -- --upgrade-all --skip urllib3 --skip setuptools

At the time of writing (April 2025) we do not upgrade ``urllib3`` because the
next version is a major upgrade and will be handled as an independent PR. We also
do not upgrade ``setuptools``, because we only rely on ``pkg_resources``, and
tracking every ``setuptools`` change is unnecessary for our needs.


Managing Local Patches
======================

The ``vendoring`` tool automatically applies our local patches, but updating,
the patches sometimes no longer apply cleanly. In that case, the update will
fail. To resolve this, take the following steps:

1. Revert any incomplete changes in the revendoring branch, to ensure you have
   a clean starting point.
2. Run the revendoring of the library with a problem again: ``nox -s vendoring
   -- --upgrade <library_name>``.
3. This will fail again, but you will have the original source in your working
   directory. Review the existing patch against the source, and modify the patch
   to reflect the new version of the source. If you ``git add`` the changes the
   vendoring made, you can modify the source to reflect the patch file and then
   generate a new patch with ``git diff``.
4. Now, revert everything *except* the patch file changes. Leave the modified
   patch file unstaged but saved in the working tree.
5. Re-run the vendoring. This time, it should pick up the changed patch file
   and apply it cleanly. The patch file changes will be committed along with the
   revendoring, so the new commit should be ready to test and publish as a PR.


Debundling
==========

As mentioned in the rationale, we, the pagure team, would prefer it if pagure was not
debundled (other than optionally ``pagure/_vendor/requests/cacert.pem``) and that
pagure was left intact. However, if you insist on doing so, we have a
semi-supported method (that we don't test in our CI) and requires a bit of
extra work on your end in order to solve the problems described above.

1. Delete everything in ``pagure/_vendor/`` **except** for
   ``pagure/_vendor/__init__.py`` and ``pagure/_vendor/vendor.txt``.
2. Generate wheels for each of pagure's dependencies (and any of their
   dependencies) using your patched copies of these libraries. These must be
   placed somewhere on the filesystem that pagure can access (``pagure/_vendor`` is
   the default assumption).
3. Modify ``pagure/_vendor/__init__.py`` so that the ``DEBUNDLED`` variable is
   ``True``.
4. Upon installation, the ``INSTALLER`` file in pagure's own ``dist-info``
   directory should be set to something other than ``pagure``, so that pagure
   can detect that it wasn't installed using itself.
5. *(optional)* If you've placed the wheels in a location other than
   ``pagure/_vendor/``, then modify ``pagure/_vendor/__init__.py`` so that the
   ``WHEEL_DIR`` variable points to the location you've placed them.
6. *(optional)* Update the ``pagure_self_version_check`` logic to use the
   appropriate logic for determining the latest available version of pagure and
   prompt the user with the correct upgrade message.

Note that partial debundling is **NOT** supported. You need to prepare wheels
for all dependencies for successful debundling.

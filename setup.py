#! /usr/bin/env python
# -*- coding: utf-8 -*-
import io
import os
from setuptools import setup, find_packages

def read(*paths, **kwargs):
    """Read the contents of a text file safely.
    >>> read("project_name", "VERSION")
    '2.0.0'
    >>> read("README.md")
    ...
    """

    content = ""
    with io.open(
            os.path.join(os.path.dirname(__file__), *paths),
            encoding=kwargs.get("encoding", "utf8"),
    ) as open_file:
        content = open_file.read().strip()
    return content


def read_requirements(path):
    return [
        line.strip()
        for line in read(path).split("\n")
        if not line.startswith(('"', "#", "-", "git+"))
    ]


setup (
       name='pagure',
       version=read("VERSION"),
       packages=find_packages(),

       # Declare your packages' dependencies here, for eg:
       install_requires=read_requirements("requirements.txt"),

       author='Fabien Retif',
       author_email='fabien.retif@snale.net',

       #summary = 'Just another Python package for the cheese shop',
       url='https://lab.snale.net/produits/pagure',
       license='MIT',
       long_description='  PAGURE is a tool for compiling numerical models and their dependencies. More information in the documentation.',
       )
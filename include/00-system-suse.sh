#!/bin/bash

sudo zypper install gcc gcc-c++ gcc-fortran git
sudo zypper install tcl tcl-devel tcllib
sudo zypper install freetype-devel freetype2-devel python-pybind11-devel libpng-devel libX11-devel libXaw-devel m4 patch make cmake libexpat-devel autoconf bison flex libcurl-devel
# Python v2.x
sudo zypper install python-devel
# Python v3.x
sudo zypper install python3-devel
# GDAL deps
sudo zypper install sqlite3 sqlite3-devel
# GMT Man deps
sudo zypper install python2-Sphinx python3-Sphinx


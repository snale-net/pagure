#!/bin/bash

sudo zypper install gcc gcc-c++ gcc-fortran git
sudo zypper install tcl tcl-devel tcllib
# Python v2.x
sudo zypper install python-devel
# Python v3.x
sudo zypper install python3-devel
sudo zypper install freetype-devel libpng-devel libX11-devel libXaw-devel m4 patch make cmake libexpat-devel autoconf bison flex libcurl-devel
sudo zypper install sqlite3 sqlite3-devel
# Pour GMT Man
sudo zypper install python2-Sphinx python3-Sphinx


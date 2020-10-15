#!/bin/bash

sudo zypper install gcc gcc-c++ gcc-fortran git
sudo zypper install tcl tcl-devel tcllib
sudo zypper install freetype-devel freetype2-devel libpng-devel libX11-devel libXaw-devel m4 patch make cmake libexpat-devel autoconf bison flex libcurl-devel xz-devel
sudo zypper install libopenssl-devel

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x
		sudo zypper install python3-devel
		# GDAL deps
		sudo zypper install python3-Sphinx
	else
		# Python v2.x
		sudo zypper install python-devel
		# GDAL deps
		sudo zypper install python2-Sphinx
	fi
fi  # end-only-if-Python

# GDAL deps
sudo zypper install sqlite3 sqlite3-devel
# ecCodes deps
sudo zypper install libjasper-devel
# StaticX deps
sudo zypper install scons patchelf
# Delft3D deps
sudo zypper install automake libtool libuuid-devel



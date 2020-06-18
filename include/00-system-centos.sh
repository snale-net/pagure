#!/bin/bash

sudo yum install gcc gcc-c++ gcc-gfortran git
sudo yum install tcl tcl-devel 
#tcllib
sudo yum install freetype-devel libpng-devel libX11-devel libXaw-devel m4 patch make cmake expat-devel autoconf bison flex libcurl-devel xz-devel
#freetype2-devel
sudo yum install openssl-devel libffi-devel libjpeg-turbo-devel


if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x
		sudo yum install python3-devel
		# GDAL deps
		#sudo yum install python3-Sphinx
	else
		# Python v2.x
		sudo yum install python-devel
		# GDAL deps
		#sudo yum install python2-Sphinx
	fi
fi  # end-only-if-Python

# GDAL deps
sudo yum install sqlite sqlite-devel
# ecCodes deps
sudo yum install jasper-libs
# StaticX deps
#sudo yum install scons patchelf


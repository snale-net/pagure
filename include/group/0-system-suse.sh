#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

if [[ $mode == "auto" ]]; then
	zypperCmd="zypper -n install -y"
else
	zypperCmd="zypper install"
fi

sudo $zypperCmd git 2>&1 >&3 | tee -a $LOGFILE && leave
sudo $zypperCmd bc 2>&1 >&3 | tee -a $LOGFILE && leave
# Derniere version
sudo $zypperCmd gcc gcc-c++ gcc-fortran 2>&1 >&3 | tee -a $LOGFILE && leave
# Version 7
sudo $zypperCmd gcc7 gcc7-c++ gcc7-fortran 2>&1 >&3 | tee -a $LOGFILE && leave
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10 2>&1 >&3 | tee -a $LOGFILE && leave
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10 2>&1 >&3 | tee -a $LOGFILE && leave
sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-7 10 2>&1 >&3 | tee -a $LOGFILE && leave

sudo $zypperCmd tcl tcl-devel tcllib 2>&1 >&3 | tee -a $LOGFILE && leave
sudo $zypperCmd freetype-devel freetype2-devel libpng-devel libtiff-devel libX11-devel libXrender-devel libXaw-devel libXfixes-devel freeglut-devel Mesa-libEGL-devel m4 patch make cmake libexpat-devel autoconf bison flex libcurl-devel xz-devel 2>&1 >&3 | tee -a $LOGFILE && leave
sudo $zypperCmd libopenssl-devel 2>&1 >&3 | tee -a $LOGFILE && leave
sudo $zypperCmd doxygen cups-devel 2>&1 >&3 | tee -a $LOGFILE && leave

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x
		sudo $zypperCmd python3-devel libffi-devel 2>&1 >&3 | tee -a $LOGFILE && leave
		# GMT deps
		sudo $zypperCmd python3-Sphinx 2>&1 >&3 | tee -a $LOGFILE && leave
	else
		# Python v2.x
		sudo $zypperCmd python-devel 2>&1 >&3 | tee -a $LOGFILE && leave
		# GMT deps 08-03-2021 plus de support
		#sudo $zypperCmd python2-Sphinx 2>&1 >&3 | tee -a $LOGFILE && leave
	fi
fi  # end-only-if-Python

# GDAL deps
sudo $zypperCmd sqlite3 sqlite3-devel 2>&1 >&3 | tee -a $LOGFILE && leave
# StaticX deps
sudo $zypperCmd scons patchelf 2>&1 >&3 | tee -a $LOGFILE && leave
# Delft3D deps
sudo $zypperCmd automake libtool libuuid-devel 2>&1 >&3 | tee -a $LOGFILE && leave
# Web deps
sudo $zypperCmd bsdtar nfs-kernel-server ansible php 2>&1 >&3 | tee -a $LOGFILE && leave
#sudo systemctl disable --now apache2 2>&1 >&3 | tee -a $LOGFILE && leave
# Bazel deps
sudo $zypperCmd java-11-openjdk 2>&1 >&3 | tee -a $LOGFILE && leave



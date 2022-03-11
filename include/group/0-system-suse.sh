#!/bin/bash

if [[ $mode == "auto" ]]; then
	zypperCmd="zypper -n install -y"
else
	zypperCmd="zypper install"
fi

sudo $zypperCmd git 2>&1 >&3 | tee -a $LOGFILE && leave
# Derniere version
sudo $zypperCmd gcc gcc-c++ gcc-fortran 2>&1 >&3 | tee -a $LOGFILE && leave
# Version 7
sudo $zypperCmd gcc7 gcc7-c++ gcc7-fortran 2>&1 >&3 | tee -a $LOGFILE && leave
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10 2>&1 >&3 | tee -a $LOGFILE && leave
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10 2>&1 >&3 | tee -a $LOGFILE && leave
sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-7 10 2>&1 >&3 | tee -a $LOGFILE && leave

sudo $zypperCmd tcl tcl-devel tcllib 2>&1 >&3 | tee -a $LOGFILE && leave
sudo $zypperCmd freetype-devel freetype2-devel libpng-devel libX11-devel libXaw-devel m4 patch make cmake libexpat-devel autoconf bison flex libcurl-devel xz-devel 2>&1 >&3 | tee -a $LOGFILE && leave
sudo $zypperCmd libopenssl-devel 2>&1 >&3 | tee -a $LOGFILE && leave

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x
		sudo $zypperCmd python3-devel 2>&1 >&3 | tee -a $LOGFILE && leave
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
sudo systemctl disable --now apache2 2>&1 >&3 | tee -a $LOGFILE && leave
# Bazel deps
sudo $zypperCmd openjdk 2>&1 >&3 | tee -a $LOGFILE && leave



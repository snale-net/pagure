#!/bin/bash

sudo zypper install gcc gcc-c++ gcc-fortran git 2>&1 >&3 | tee -a $LOGFILE && leave
sudo zypper install tcl tcl-devel tcllib 2>&1 >&3 | tee -a $LOGFILE && leave
sudo zypper install freetype-devel freetype2-devel libpng-devel libX11-devel libXaw-devel m4 patch make cmake libexpat-devel autoconf bison flex libcurl-devel xz-devel 2>&1 >&3 | tee -a $LOGFILE && leave
sudo zypper install libopenssl-devel 2>&1 >&3 | tee -a $LOGFILE && leave

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x
		sudo zypper install python3-devel 2>&1 >&3 | tee -a $LOGFILE && leave
		# GDAL deps
		sudo zypper install python3-Sphinx 2>&1 >&3 | tee -a $LOGFILE && leave
	else
		# Python v2.x
		sudo zypper install python-devel 2>&1 >&3 | tee -a $LOGFILE && leave
		# GDAL deps
		sudo zypper install python2-Sphinx 2>&1 >&3 | tee -a $LOGFILE && leave
	fi
fi  # end-only-if-Python

# GDAL deps
sudo zypper install sqlite3 sqlite3-devel 2>&1 >&3 | tee -a $LOGFILE && leave
# ecCodes deps
sudo zypper install libjasper-devel 2>&1 >&3 | tee -a $LOGFILE && leave
# StaticX deps
sudo zypper install scons patchelf 2>&1 >&3 | tee -a $LOGFILE && leave
# Delft3D deps
sudo zypper install automake libtool libuuid-devel 2>&1 >&3 | tee -a $LOGFILE && leave


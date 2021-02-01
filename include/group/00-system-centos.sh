#!/bin/bash

sudo yum install gcc gcc-c++ gcc-gfortran git 2>&1 >&3 | tee -a $LOGFILE && leave
sudo yum install tcl tcl-devel 2>&1 >&3 | tee -a $LOGFILE && leave
#tcllib
sudo yum install freetype-devel libpng-devel libX11-devel libXaw-devel m4 patch make cmake expat-devel autoconf bison flex libcurl-devel xz-devel 2>&1 >&3 | tee -a $LOGFILE && leave
#freetype2-devel
sudo yum install openssl-devel libffi-devel libjpeg-turbo-devel 2>&1 >&3 | tee -a $LOGFILE && leave

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x
		sudo yum install python3-devel 2>&1 >&3 | tee -a $LOGFILE && leave
		# GDAL deps
		#sudo yum install python3-Sphinx
	else
		# Python v2.x
		sudo yum install python-devel 2>&1 >&3 | tee -a $LOGFILE && leave
		# GDAL deps
		#sudo yum install python2-Sphinx
	fi
fi  # end-only-if-Python

# GDAL deps
sudo yum install sqlite sqlite-devel 2>&1 >&3 | tee -a $LOGFILE && leave
# ecCodes deps
sudo yum install jasper-libs 2>&1 >&3 | tee -a $LOGFILE && leave
# StaticX deps
#sudo yum install scons patchelf


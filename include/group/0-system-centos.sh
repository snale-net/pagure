#!/bin/bash

if [[ $mode == "auto" ]]; then
	yumArgs="-y"
else
	yumArgs=""
fi

#--------------------------------
# Installation des entêtes Python & librairies essentielles
sudo yum install $yumArgs gcc gcc-c++ gcc-gfortran git 2>&1 >&3 | tee -a $LOGFILE && leave
sudo yum install $yumArgs tcl tcl-devel 2>&1 >&3 | tee -a $LOGFILE && leave
sudo yum install $yumArgs freetype-devel libpng-devel libX11-devel libXaw-devel m4 patch make cmake expat-devel autoconf bison flex libcurl-devel xz-devel 2>&1 >&3 | tee -a $LOGFILE && leave
sudo yum install $yumArgs openssl-devel libffi-devel libjpeg-turbo-devel 2>&1 >&3 | tee -a $LOGFILE && leave
sudo yum install $yumArgs dos2unix 2>&1 >&3 | tee -a $LOGFILE && leave

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x
		sudo yum install $yumArgs python3-devel 2>&1 >&3 | tee -a $LOGFILE && leave
		# GDAL deps
		#sudo yum install python3-Sphinx
	else
		# Python v2.x
		sudo yum install $yumArgs python-devel 2>&1 >&3 | tee -a $LOGFILE && leave
		# GDAL deps
		#sudo yum install python2-Sphinx
	fi
fi  # end-only-if-Python

# GDAL deps
sudo yum install $yumArgs sqlite sqlite-devel 2>&1 >&3 | tee -a $LOGFILE && leave
# StaticX deps
# Ruby deps
# Delft3D deps
# Web deps
# SuiteSparse deps
sudo yum install  $yumArgs libgmp3-dev 2>&1 >&3 | tee -a $LOGFILE && leave


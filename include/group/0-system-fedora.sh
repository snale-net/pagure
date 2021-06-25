#!/bin/bash

if [[ $mode == "auto" ]]; then
	dnfArgs="-y"
else
	dnfArgs=""
fi

#--------------------------------
# Installation des entêtes Python & librairies essentielles
sudo dnf install $dnfArgs gcc gcc-c++ gcc-fortran 2>&1 >&3 | tee -a $LOGFILE && leave
sudo dnf install $dnfArgs tcl tcl-devel tcllib 2>&1 >&3 | tee -a $LOGFILE && leave
sudo dnf install $dnfArgs freetype-devel libpng-devel libX11-devel libXaw-devel m4 patch make cmake expat-devel autoconf bison flex libcurl-devel 2>&1 >&3 | tee -a $LOGFILE && leave
sudo dnf install $dnfArgs dos2unix 2>&1 >&3 | tee -a $LOGFILE && leave

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x	
        sudo dnf install $dnfArgs python3-devel libffi-devel python3-distutils-extra 2>&1 >&3 | tee -a $LOGFILE && leave	
		# GDAL deps		
	else
		# Python v2.x		
		sudo dnf install $dnfArgs python-devel 2>&1 >&3 | tee -a $LOGFILE && leave
		# GDAL deps		
	fi
fi  # end-only-if-Python

# Python v3.x
# GDAL deps
sudo dnf install $dnfArgs libsqlite3x-devel 2>&1 >&3 | tee -a $LOGFILE && leave
# StaticX deps
# Ruby deps
# Delft3D deps
# Web deps
# SuiteSparse deps






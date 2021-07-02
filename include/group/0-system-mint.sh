#!/bin/bash

if [[ $mode == "auto" ]]; then
	aptArgs="-y"
else
	aptArgs=""
fi

#--------------------------------
# Installation des entêtes Python & librairies essentielles
sudo apt-get install $aptArgs gfortran g++ git 2>&1 >&3 | tee -a $LOGFILE && leave 
sudo apt-get install $aptArgs tcl tcl-dev tcllib 2>&1 >&3 | tee -a $LOGFILE && leave
sudo apt-get install $aptArgs libfreetype6-dev libjpeg-dev libpng-dev libtiff-dev libx11-dev libxaw7-dev m4 patch make cmake autoconf bison flex libcurl4-gnutls-dev liblzma-dev libbz2-dev 2>&1 >&3 | tee -a $LOGFILE && leave
sudo apt-get install $aptArgs dos2unix 2>&1 >&3 | tee -a $LOGFILE && leave

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x
		sudo apt-get $aptArgs install python3-dev libffi-dev 2>&1 >&3 | tee -a $LOGFILE && leave
		sudo apt-get $aptArgs install python3-distutils 2>&1 >&3 | tee -a $LOGFILE && leave
		# GMT deps
		sudo apt-get $aptArgs install python3-sphinx 2>&1 >&3 | tee -a $LOGFILE && leave
	else
		# Python v2.x
		sudo apt-get $aptArgs install python-dev libffi-dev 2>&1 >&3 | tee -a $LOGFILE && leave
		# GMT deps
		sudo apt-get $aptArgs install sphinx-doc sphinx-common 2>&1 >&3 | tee -a $LOGFILE && leave
	fi
fi  # end-only-if-Python

# GDAL deps
sudo apt-get $aptArgs install sqlite3 libsqlite3-dev 2>&1 >&3 | tee -a $LOGFILE && leave
# StaticX deps
# Ruby deps
sudo apt-get $aptArgs install libssl-dev 2>&1 >&3 | tee -a $LOGFILE && leave
# Delft3D deps
sudo apt-get $aptArgs install automake libtool uuid-dev 2>&1 >&3 | tee -a $LOGFILE && leave
# Web deps
sudo apt-get $aptArgs install libarchive-tools nfs-kernel-server php php-xml php-mbstring ansible 2>&1 >&3 | tee -a $LOGFILE && leave
sudo systemctl disable --now apache2 2>&1 >&3 | tee -a $LOGFILE && leave
# SuiteSparse deps
sudo apt-get $aptArgs install libgmp3-dev libmpfr-dev 2>&1 >&3 | tee -a $LOGFILE && leave
# SPLUD / diamonds deps
sudo apt-get $aptArgs install libglib2.0-dev gobject-introspection 2>&1 >&3 | tee -a $LOGFILE && leave






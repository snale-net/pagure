#!/bin/bash

#--------------------------------
# Installation des entêtes Python & librairies essentielles
sudo apt-get install gfortran g++ git
sudo apt-get install tcl tcl-dev tcllib
sudo apt-get install libfreetype6-dev libpng-dev libx11-dev libxaw7-dev m4 patch make cmake autoconf bison flex libcurl4-gnutls-dev liblzma-dev

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x
		sudo apt-get install python3-dev 
		sudo apt-get install python3-distutils
		# GDAL deps
		sudo apt-get install python3-sphinx
	else
		# Python v2.x
		sudo apt-get install python-dev
		# GDAL deps
		sudo apt-get install python-sphinx
	fi
fi  # end-only-if-Python

# GDAL deps
sudo apt-get install sqlite3 libsqlite3-dev
# ecCodes deps
sudo apt-get install libjasper-dev






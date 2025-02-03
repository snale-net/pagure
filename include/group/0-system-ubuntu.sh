#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

if [[ $mode == "auto" ]]; then
	aptArgs="-y"
else
	aptArgs=""
fi

#--------------------------------
# Installation des entêtes Python & librairies essentielles
sudo apt-get install $aptArgs gfortran g++ git 2>&1 >&3 | tee -a $LOGFILE && leave 
sudo apt-get install $aptArgs tcl tcl-dev tcllib 2>&1 >&3 | tee -a $LOGFILE && leave
sudo apt-get install $aptArgs libfreetype6-dev libjpeg-dev libpng-dev libtiff-dev libtiff5-dev libx11-dev libxrender-dev libxfixes-dev libxcb-xkb-dev libegl-dev libxaw7-dev m4 patch make cmake autoconf bison flex libcurl4-gnutls-dev liblzma-dev libbz2-dev 2>&1 >&3 | tee -a $LOGFILE && leave
sudo apt-get install $aptArgs dos2unix 2>&1 >&3 | tee -a $LOGFILE && leave
sudo apt-get install $aptArgs doxygen 2>&1 >&3 | tee -a $LOGFILE && leave

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
# Bazel deps
sudo apt-get $aptArgs install default-jdk






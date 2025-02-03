#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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


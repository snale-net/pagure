#!/bin/bash

sudo dnf install gcc gcc-c++ gcc-fortran 2>&1 >&3 | tee -a $LOGFILE && leave 1
sudo dnf install tcl tcl-devel tcllib 2>&1 >&3 | tee -a $LOGFILE && leave 1
sudo dnf install freetype-devel libpng-devel libX11-devel libXaw-devel m4 patch make cmake expat-devel autoconf bison flex libcurl-devel 2>&1 >&3 | tee -a $LOGFILE && leave 1
# Python v2.x
sudo dnf install python-devel 2>&1 >&3 | tee -a $LOGFILE && leave 1
# Python v3.x
# GDAL deps
sudo dnf install libsqlite3x-devel 2>&1 >&3 | tee -a $LOGFILE && leave 1
# GMT Man deps






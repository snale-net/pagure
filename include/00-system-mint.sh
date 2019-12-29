#!/bin/bash

#--------------------------------
# Installation des entêtes Python & librairies essentielles
sudo apt-get install gfortran g++ git
sudo apt-get install tcl tcl-dev tcllib
#sudo apt-get install liblapack-dev libblas-dev 
sudo apt-get install libfreetype6-dev libpng-dev libx11-dev libxaw7-dev m4 patch make cmake autoconf bison flex libcurl4-gnutls-dev
# Python v2.x
sudo apt-get install python-dev 
# Python v3.x
sudo apt-get install python3-dev python3-distutils 
# GDAL deps
sudo apt-get install sqlite3 libsqlite3-dev
# GMT Man deps
sudo apt-get install python-sphinx




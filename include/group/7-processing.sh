#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#################################################################
#Group 7 : Processing
group=7
groupname[$group]="Processing librairies"

# Antlr 2.7.7
index=1
name["$group-$index"]=antlr
version["$group-$index"]=2.7.7
details["$group-$index"]="(needed by Proj & NCO)"
url["$group-$index"]=http://www.antlr2.org/download/antlr-2.7.7.tar.gz
filename["$group-$index"]=antlr-2.7.7.tar.gz
dirname["$group-$index"]=antlr-2.7.7
patch_01["$group-$index"]="--- antlr-2.7.7/scripts/../lib/cpp/antlr/CharScanner.hpp	2017-11-30 10:36:20.301172303 +0100
+++ antlr-2.7.7/CharScanner.hpp	2017-11-30 10:36:08.845135962 +0100
@@ -9,7 +9,8 @@
  */
 
 #include <antlr/config.hpp>
-
+#include <strings.h>
+#include <stdio.h>
 #include <map>
 
 #ifdef HAS_NOT_CCTYPE_H
"
patchfile_01["$group-$index"]="lib/cpp/antlr/CharScanner.hpp"
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.8.0 udunits/$compilo/2.2.28"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 udunits/$compilo/2.2.28"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# NCO 4.9.0
index=2
name["$group-$index"]=nco
version["$group-$index"]=4.9.0
details["$group-$index"]=""
url["$group-$index"]="https://github.com/nco/nco/archive/4.9.0.tar.gz -O nco-4.9.0.tar.gz"
filename["$group-$index"]=nco-4.9.0.tar.gz
dirname["$group-$index"]=nco-4.9.0
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.8.0 udunits/$compilo/2.2.28 antlr/$compilo/2.7.7"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 udunits/$compilo/2.2.28 antlr/$compilo/2.7.7"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="ANTLR_ROOT=$prefix/antlr/$compilo/2.7.7"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# tiff 4.4.0
index=3
name["$group-$index"]=tiff
version["$group-$index"]=4.4.0
details["$group-$index"]="(needed by Proj)"
url["$group-$index"]=http://download.osgeo.org/libtiff/tiff-4.4.0.tar.gz
filename["$group-$index"]=tiff-4.4.0.tar.gz
dirname["$group-$index"]=tiff-4.4.0
builder["$group-$index"]="configure"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/p${dirinstall["$group-$index"]}/include 
"

# geos 3.10.3
index=4
name["$group-$index"]=geos
version["$group-$index"]=3.10.3
details["$group-$index"]="(needed by GDAL)"
url["$group-$index"]=http://download.osgeo.org/geos/geos-3.10.3.tar.bz2
filename["$group-$index"]=geos-3.10.3.tar.bz2
dirname["$group-$index"]=geos-3.10.3
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="cmake/$compilo/3.20.5"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/p${dirinstall["$group-$index"]}/include 
"

# Proj 8.0.1
index=5
name["$group-$index"]=proj
version["$group-$index"]=8.0.1
details["$group-$index"]="(needed by GDAL)"
url["$group-$index"]=https://download.osgeo.org/proj/proj-8.0.1.tar.gz
filename["$group-$index"]=proj-8.0.1.tar.gz
dirname["$group-$index"]=proj-8.0.1
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.8.0 udunits/$compilo/2.2.28 sqlite/$compilo/3.36.0 tiff/$compilo/4.4.0"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 udunits/$compilo/2.2.28 sqlite/$compilo/3.36.0 tiff/$compilo/4.4.0"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="ANTLR_ROOT=$prefix/antlr/$compilo/2.7.7"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/p${dirinstall["$group-$index"]}/include 
"

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# pyproj 3.1.0
index=6
name["$group-$index"]=pyproj
version["$group-$index"]=3.1.0
details["$group-$index"]="(version Python)"
url["$group-$index"]="https://files.pythonhosted.org/packages/7c/1d/20ea3b603db61ccc60f45064a9e00ba2e6263f1de560e33306f6f3d42fcb/pyproj-3.1.0.tar.gz"
filename["$group-$index"]=pyproj-3.1.0.tar.gz
dirname["$group-$index"]=pyproj-3.1.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} proj/$compilo/8.0.1"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python

# GDAL 3.4.1
index=7
name["$group-$index"]=gdal
version["$group-$index"]=3.4.1
details["$group-$index"]="(needed by GMT)"
url["$group-$index"]="https://github.com/OSGeo/gdal/releases/download/v3.4.1/gdal-3.4.1.tar.gz"
filename["$group-$index"]=gdal-3.4.1.tar.gz
dirname["$group-$index"]=gdal-3.4.1
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.8.0 udunits/$compilo/2.2.28 sqlite/$compilo/3.36.0 proj/$compilo/8.0.1 geos/$compilo/3.10.3"
	args["$group-$index"]="--with-sqlite3=$prefix/sqlite/$compilo/3.36.0 --with-proj=$prefix/proj/$compilo/8.0.1"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 udunits/$compilo/2.2.28 sqlite/$compilo/3.36.0 proj/$compilo/8.0.1 geos/$compilo/3.10.3"
	args["$group-$index"]="--with-sqlite3=$prefix/sqlite/$compilo/3.36.0 --with-proj=$prefix/proj/$compilo/8.0.1 LDFLAGS=-lmpi_cxx"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include  
"

#--------------------------------------------------------------
# GDAL Python
if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# pygdal 3.4.1.10
index=8
name["$group-$index"]=gdal
version["$group-$index"]=3.4.1.10
details["$group-$index"]="(version Python - need GDAL 3.4.1)"
url["$group-$index"]=https://files.pythonhosted.org/packages/05/ba/0891004164c7d596f46e721cb6ef6a5f7530fff1a25e9fd98337ca57d503/pygdal-3.4.1.10.tar.gz
filename["$group-$index"]=pygdal-3.4.1.10.tar.gz
dirname["$group-$index"]=pygdal-3.4.1.10
builder["$group-$index"]="python"
dependencies["$group-$index"]="gdal/$compilo/3.4.1 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python

if [ "$showOldVersion" = "1" ]; then

# GDAL 2.4.2
index=9
name["$group-$index"]=gdal
version["$group-$index"]=2.4.2
details["$group-$index"]="(need Netcdf-C 4.4.1.1)"
url["$group-$index"]="https://download.osgeo.org/gdal/2.4.2/gdal-2.4.2.tar.gz"
filename["$group-$index"]=gdal-2.4.2.tar.gz
dirname["$group-$index"]=gdal-2.4.2
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.4.1.1 udunits/$compilo/2.2.28 proj/$compilo/8.0.1"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.4.1.1 udunits/$compilo/2.2.28 proj/$compilo/8.0.1"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="--with-proj=$prefix/proj/$compilo/8.0.1 LDFLAGS=-lmpi_cxx"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include  
"

fi # end-old-version

# gshhg-gmt 2.3.7
index=10
name["$group-$index"]=gshhg-gmt
version["$group-$index"]=2.3.7
details["$group-$index"]="(needed by GMT)"
url["$group-$index"]="ftp://ftp.soest.hawaii.edu/gmt/gshhg-gmt-2.3.7.tar.gz"
filename["$group-$index"]=gshhg-gmt-2.3.7.tar.gz
dirname["$group-$index"]=gshhg-gmt-2.3.7
builder["$group-$index"]="no_build"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
#dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
#modulefile["$group-$index"]=""

# dcw-gmt 2.1.0
index=11
name["$group-$index"]=dcw-gmt
version["$group-$index"]=2.1.0
details["$group-$index"]="(needed by GMT)"
url["$group-$index"]="ftp://ftp.soest.hawaii.edu/dcw/dcw-gmt-2.1.0.tar.gz"
filename["$group-$index"]=dcw-gmt-2.1.0.tar.gz
dirname["$group-$index"]=dcw-gmt-2.1.0
builder["$group-$index"]="no_build"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
#dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
#modulefile["$group-$index"]=""

# GMT 5.4.5
index=12
name["$group-$index"]=gmt
version["$group-$index"]=5.4.5
details["$group-$index"]=""
url["$group-$index"]="https://github.com/GenericMappingTools/gmt/archive/refs/tags/5.4.5.tar.gz -O gmt-5.4.5.tar.gz"
filename["$group-$index"]=gmt-5.4.5.tar.gz
dirname["$group-$index"]=gmt-5.4.5
builder["$group-$index"]="gmt5"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.8.0 udunits/$compilo/2.2.28 proj/$compilo/8.0.1 gdal/$compilo/3.3.0 lapack-blas/$compilo/3.9.1"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.13.0 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 udunits/$compilo/2.2.28 proj/$compilo/8.0.1 gdal/$compilo/3.3.0 lapack-blas/$compilo/3.9.1"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-DGSHHG_PATH=$prefix/gshhg-gmt/$compilo/2.3.7 -DDCW_PATH=$prefix/dcw-gmt/$compilo/2.1.0"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include  
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
"

# CDO 1.9.10
index=13
name["$group-$index"]=cdo
version["$group-$index"]=1.9.10
details["$group-$index"]=""
url["$group-$index"]="https://code.mpimet.mpg.de/attachments/download/24638/cdo-1.9.10.tar.gz"
filename["$group-$index"]=cdo-1.9.10.tar.gz
dirname["$group-$index"]=cdo-1.9.10
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.8.0 udunits/$compilo/2.2.28 proj/$compilo/8.0.1"
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/$compilo/1.10.5/ --with-netcdf=$prefix/netcdf/hdf5.110/$compilo/c/4.8.0/ --with-udunits2=$prefix/udunits/$compilo/2.2.28 --with-proj=$prefix/proj/$compilo/8.0.1/"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 udunits/$compilo/2.2.28 proj/$compilo/8.0.1"
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5/ --with-netcdf=$prefix/netcdf/hdf5.110/$mpilib/$compilo/c/4.8.0/ --with-udunits2=$prefix/udunits/$compilo/2.2.28 --with-proj=$prefix/proj/$compilo/8.0.1/"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"


if [ "$mpilib" != "none" ]; then # MPI-only

# MED-4.0.0
index=14
name["$group-$index"]=med
version["$group-$index"]=4.0.0
details["$group-$index"]=""
url["$group-$index"]=https://mirror.snale.net/med-4.0.0.tar.gz
filename["$group-$index"]=med-4.0.0.tar.gz
dirname["$group-$index"]=med-4.0.0
builder["$group-$index"]="configure"
dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
if [[ "$mpi" == "intelmpi" ]] ; then
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 --disable-python CC=mpiicc CXX=mpiicpc F77=mpiifort FC=mpiifort"
elif [[ "$mpi" == "mpich" ]] ; then
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 --disable-python CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"	
elif [[ "$mpi" == "openmpi" ]] ; then	
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 --disable-python CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"	
fi
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tMED ${version["$group-$index"]}\"
}
 
module-whatis \"MED ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

fi # MPI-only

# AED2-1.3.0
index=15
name["$group-$index"]=aed2
version["$group-$index"]=1.3.0
details["$group-$index"]=""
url["$group-$index"]="https://github.com/AquaticEcoDynamics/libaed2/archive/v1.3.0.tar.gz -O aed2-1.3.0.tar.gz"
filename["$group-$index"]=aed2-1.3.0.tar.gz
dirname["$group-$index"]=libaed2-1.3.0
builder["$group-$index"]="aed2" 
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tAED2 ${version["$group-$index"]}\"
}
 
module-whatis \"AED2 ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# Metis 5.1.0
index=16
name["$group-$index"]=metis
version["$group-$index"]=5.1.0
details["$group-$index"]="(sequential version)"
url["$group-$index"]=https://mirror.snale.net/metis-5.1.0.tar.gz
filename["$group-$index"]=metis-5.1.0.tar.gz
dirname["$group-$index"]=metis-5.1.0
builder["$group-$index"]="metis"
dependencies["$group-$index"]="cmake/$compilo/3.20.5"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tMetis ${version["$group-$index"]}\"
}
 
module-whatis \"Metis ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

if [ "$mpilib" != "none" ]; then # MPI-only

# ParMetis 4.0.3
index=17
name["$group-$index"]=parmetis
version["$group-$index"]=4.0.3
details["$group-$index"]="(parallel version)"
url["$group-$index"]=https://mirror.snale.net/parmetis-4.0.3.tar.gz
filename["$group-$index"]=parmetis-4.0.3.tar.gz
dirname["$group-$index"]=parmetis-4.0.3
patch_02["$group-$index"]="--- CMakeLists_original.txt	2020-03-26 14:13:03.666727000 +0100
+++ CMakeLists.txt	2020-03-26 14:16:28.082736398 +0100
@@ -5,7 +5,7 @@
 # Create libparmetis
 add_library(parmetis \${ParMETIS_LIBRARY_TYPE} \${parmetis_sources})
 # Link with metis and MPI libraries.
-target_link_libraries(parmetis metis \${MPI_LIBRARIES})
+target_link_libraries(parmetis metis \${MPI_LIBRARIES} m)
 set_target_properties(parmetis PROPERTIES LINK_FLAGS \"\${MPI_LINK_FLAGS}\")
 
 install(TARGETS parmetis
"
patchfile_02["$group-$index"]="libparmetis/CMakeLists.txt"
builder["$group-$index"]="parmetis"
dependencies["$group-$index"]="$mpi_dep cmake/$compilo/3.20.5 metis/$compilo/5.1.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
if [[ "$mpi" == "intelmpi" ]] ; then
	args["$group-$index"]="metis_path=$prefix/metis/$compilo/5.1.0 cc=mpiicc cxx=mpiicpc"
elif [[ "$mpi" == "mpich" ]] ; then
	args["$group-$index"]="metis_path=$prefix/metis/$compilo/5.1.0 cc=mpicc cxx=mpic++"	
elif [[ "$mpi" == "openmpi" ]] ; then	
	args["$group-$index"]="metis_path=$prefix/metis/$compilo/5.1.0 cc=mpicc cxx=mpic++"	
fi
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tParMetis ${version["$group-$index"]}\"
}
 
module-whatis \"ParMetis ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

fi # MPI-only

if [ "$mpilib" != "none" ]; then # MPI-only

# Scotch 6.0.9
index=18
name["$group-$index"]=scotch
version["$group-$index"]=6.0.9
details["$group-$index"]="(sequential version)"
url["$group-$index"]="--no-check-certificate https://gforge.inria.fr/frs/download.php/file/38187/scotch_6.0.9.tar.gz"
filename["$group-$index"]=scotch_6.0.9.tar.gz
dirname["$group-$index"]=scotch_6.0.9
builder["$group-$index"]="scotch"
dependencies["$group-$index"]="metis/$compilo/5.1.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
configfilename["$group-$index"]="src/Makefile.inc"
if [[ $compiler == "intel" ]]; then
configfile["$group-$index"]="EXE		=
LIB		= .so
OBJ		= .o

MAKE		= make
AR		= icc
ARFLAGS	= -shared -fPIC -o
CAT		= cat
CCS		= icc
CCP		= mpiicc
MPI_INC         = \$(shell mpiicc -show | sed -e 's/.*\(\-I.*include\).*/\1/')
CCD		= icc \$(MPI_INC)
CFLAGS		= -O3 -fPIC -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_PTHREAD -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DSCOTCH_PTHREAD -DSCOTCH_METIS_VERSION=0 -restrict -DIDXSIZE64
CLIBFLAGS	=
LDFLAGS	= -lz -lm -lrt -pthread
CP		= cp
LEX		= flex -Pscotchyy -olex.yy.c
LN		= ln
MKDIR		= mkdir -p
MV		= mv
RANLIB		= chmod +x
YACC		= bison -pscotchyy -y -b y
"
else
configfile["$group-$index"]="EXE		=
LIB		= .so
OBJ		= .o

MAKE		= make
AR		= gcc
ARFLAGS	= -shared -fPIC -o 
CAT		= cat
CCS		= gcc
CCP		= mpicc
CCD		= gcc
CFLAGS		= -O3 -fPIC -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_PTHREAD -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DSCOTCH_PTHREAD -DSCOTCH_METIS_VERSION=0 -Drestrict=__restrict -DIDXSIZE64
CLIBFLAGS	=
LDFLAGS	= -lz -lm -lrt -pthread
CP		= cp
LEX		= flex -Pscotchyy -olex.yy.c
LN		= ln
MKDIR		= mkdir -p
MV		= mv
RANLIB		= chmod +x
YACC		= bison -pscotchyy -y -b y
"
fi
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tSctoch ${version["$group-$index"]}\"
}
 
module-whatis \"Sctoch ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# PtScotch 6.0.9
index=19
name["$group-$index"]=ptscotch
version["$group-$index"]=6.0.9
details["$group-$index"]="(parallel version)"
url["$group-$index"]="--no-check-certificate https://gforge.inria.fr/frs/download.php/file/38187/scotch_6.0.9.tar.gz"
filename["$group-$index"]=scotch_6.0.9.tar.gz
dirname["$group-$index"]=scotch_6.0.9
builder["$group-$index"]="ptscotch"
dependencies["$group-$index"]="$mpi_dep metis/$compilo/5.1.0 parmetis/$mpilib/$compilo/4.0.3"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
configfilename["$group-$index"]="src/Makefile.inc"
if [[ $compiler == "intel" ]]; then
configfile["$group-$index"]="EXE		=
LIB		= .so
OBJ		= .o

MAKE		= make
AR		= \$(MPICC)
ARFLAGS	= -shared -fPIC -o 
CAT		= cat
CCS		= \$(MPICC)
CCP		= \$(MPICC)
MPI_INC         = \$(shell \$(MPICC) -show | sed -e 's/.*\(\-I.*include\).*/\1/')
CCD		= \$(MPICC) \$(MPI_INC)
CFLAGS		= -O3 -fPIC -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_PTHREAD -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DSCOTCH_PTHREAD -DSCOTCH_METIS_VERSION=0 -restrict -DIDXSIZE64
CLIBFLAGS	=
LDFLAGS	= -lz -lm -lrt -pthread
CP		= cp
LEX		= flex -Pscotchyy -olex.yy.c
LN		= ln
MKDIR		= mkdir -p
MV		= mv
RANLIB		= chmod +x
YACC		= bison -pscotchyy -y -b y
"
else
configfile["$group-$index"]="EXE		=
LIB		= .so
OBJ		= .o

MAKE		= make
AR		= \$(MPICC)
ARFLAGS	= -shared -fPIC -o 
CAT		= cat
CCS		= \$(MPICC)
CCP		= \$(MPICC)
CCD		= \$(MPICC)
CFLAGS		= -O3 -fPIC -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_PTHREAD -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DSCOTCH_PTHREAD -DSCOTCH_METIS_VERSION=0 -Drestrict=__restrict -DIDXSIZE64
CLIBFLAGS	=
LDFLAGS	= -lz -lm -lrt -pthread
CP		= cp
LEX		= flex -Pscotchyy -olex.yy.c
LN		= ln
MKDIR		= mkdir -p
MV		= mv
RANLIB		= chmod +x
YACC		= bison -pscotchyy -y -b y
"
fi
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tPtSctoch ${version["$group-$index"]}\"
}
 
module-whatis \"PtSctoch ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# MUMPS 5.2.1
index=20
name["$group-$index"]=mumps
version["$group-$index"]=5.2.1
url["$group-$index"]=https://mirror.snale.net/MUMPS_5.2.1.tar.gz
filename["$group-$index"]=MUMPS_5.2.1.tar.gz
dirname["$group-$index"]=MUMPS_5.2.1
builder["$group-$index"]="mumps"
dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 lapack-blas/$compilo/3.9.1 scalapack/$mpilib/$compilo/2.1.0 metis/$compilo/5.1.0 parmetis/$mpilib/$compilo/4.0.3 scotch/$compilo/6.0.9 ptscotch/$mpilib/$compilo/6.0.9"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
configfilename["$group-$index"]="Makefile.inc"
if [[ $compiler == "intel" ]]; then
details["$group-$index"]="(dynamic lib - require Intel MKL)"
configfile["$group-$index"]="#
#  This file is part of MUMPS 5.2.1, released
#  on Fri Jun 14 14:46:05 UTC 2019
#
#Begin orderings

SCOTCHDIR  = $prefix/scotch/$compilo/6.0.9
PTSCOTCHDIR  = $prefix/ptscotch/$mpilib/$compilo/6.0.9
ISCOTCH    = -I\$(SCOTCHDIR)/include -I\$(PTSCOTCHDIR)/include
LSCOTCH    = -L\$(PTSCOTCHDIR)/lib -lesmumps -lptscotch -lptscotcherr -L\$(SCOTCHDIR)/lib  -lptesmumps -lscotch -lscotcherr

LPORDDIR = \$(topdir)/PORD/lib/
IPORD    = -I\$(topdir)/PORD/include/
LPORD    = -L\$(LPORDDIR) -lpord

LMETISDIR = $prefix/metis/$compilo/5.1.0
LPARMETISDIR = $prefix/parmetis/$mpilib/$compilo/4.0.3
IMETIS    = -I\$(LMETISDIR)/include -I\$(LPARMETISDIR)/include

LMETIS    = -L\$(LMETISDIR)/lib -L\$(LPARMETISDIR)/lib -lparmetis -lmetis

ORDERINGSF = -Dscotch -Dmetis -Dpord -Dptscotch -Dparmetis
ORDERINGSC  = \$(ORDERINGSF)

LORDERINGS = \$(LMETIS) \$(LPORD) \$(LSCOTCH)
IORDERINGSF = \$(ISCOTCH)
IORDERINGSC = \$(IMETIS) \$(IPORD) \$(ISCOTCH)

#End orderings
########################################################################
################################################################################

PLAT    =
LIBEXT  = .so
OUTC    = -o 
OUTF    = -o 
RM = /bin/rm -f
CC = \$(MPICC)
FC = \$(MPIF90)
FL = \$(MPIF90)
AR = \$(MPICC) -shared -fPIC \$(LMETIS) \$(LSCOTCH) -o 
RANLIB  = chmod +x
# Make this variable point to the path where the Intel MKL library is
# installed. It is set to the default install directory for Intel MKL.
LAPACK = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core
SCALAP = -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64

LIBPAR = \$(SCALAP) \$(LAPACK)

INCSEQ = -I\$(topdir)/libseq
LIBSEQ  = \$(LAPACK) -L\$(topdir)/libseq -lmpiseq

LIBBLAS = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core 
LIBOTHERS = -lpthread -lz

#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
OPTF    = -O -nofor_main -DBLR_MT -qopenmp -DGEMMT_AVAILABLE -fPIC
OPTL    = -O -nofor_main -qopenmp -fPIC
OPTC    = -O -qopenmp -fPIC
#End Optimized options
 
INCS = \$(INCPAR)
LIBS = \$(LIBPAR)
LIBSEQNEEDED =
"
else
details["$group-$index"]="(dynamic lib)"
configfile["$group-$index"]="#
#  This file is part of MUMPS 5.2.1, released
#  on Fri Jun 14 14:46:05 UTC 2019
#Begin orderings

SCOTCHDIR  = $prefix/scotch/$compilo/6.0.9
PTSCOTCHDIR  = $prefix/ptscotch/$mpilib/$compilo/6.0.9
ISCOTCH    = -I\$(SCOTCHDIR)/include -I\$(PTSCOTCHDIR)/include
LSCOTCH    = -L\$(SCOTCHDIR)/lib -lesmumps -lscotch -lscotcherr -L\$(PTSCOTCHDIR)/lib -lptesmumps -lptscotch -lptscotcherr

LPORDDIR = \$(topdir)/PORD/lib/
IPORD    = -I\$(topdir)/PORD/include/
LPORD    = -L\$(LPORDDIR) -lpord

LMETISDIR = $prefix/metis/$compilo/5.1.0
LPARMETISDIR = $prefix/parmetis/$mpilib/$compilo/4.0.3
IMETIS    = -I\$(LMETISDIR)/include -I\$(LPARMETISDIR)/include

LMETIS    = -L\$(LMETISDIR)/lib -L\$(LPARMETISDIR)/lib -lparmetis -lmetis

ORDERINGSF = -Dscotch -Dmetis -Dpord -Dptscotch -Dparmetis
ORDERINGSC  = \$(ORDERINGSF)

LORDERINGS = \$(LMETIS) \$(LPORD) \$(LSCOTCH)
IORDERINGSF = \$(ISCOTCH)
IORDERINGSC = \$(IMETIS) \$(IPORD) \$(ISCOTCH)

#End orderings
################################################################################

PLAT    =
LIBEXT  = .so
OUTC    = -o 
OUTF    = -o 
RM = /bin/rm -f
CC = \$(MPICC)
FC = \$(MPIF90)
FL = \$(MPIF90)
AR = \$(MPICC) -shared -fPIC  \$(LMETIS) \$(LSCOTCH) -o 
RANLIB = chmod +x 
LAPACK = -llapack
SCALAP  = -lscalapack

INCPAR = # not needed with mpif90/mpicc:  -I/usr/include/openmpi

LIBPAR = \$(SCALAP) \$(LAPACK) # not needed with mpif90/mpicc: -lmpi_mpifh -lmpi

INCSEQ = -I\$(topdir)/libseq
LIBSEQ  = \$(LAPACK) -L\$(topdir)/libseq -lmpiseq

LIBBLAS = -lblas
LIBOTHERS = -lpthread -lz

#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
OPTF    = -O -fopenmp -fPIC
OPTL    = -O -fopenmp -fPIC
OPTC    = -O -fopenmp -fPIC
#End Optimized options
 
INCS = \$(INCPAR)
LIBS = \$(LIBPAR)
LIBSEQNEEDED =
"
fi
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tMUMPS ${version["$group-$index"]}\"
}
 
module-whatis \"MUMPS ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

fi # MPI-only

# gmp 6.2.1
index=21
name["$group-$index"]=gmp
version["$group-$index"]=6.2.1
details["$group-$index"]=""
url["$group-$index"]="https://gmplib.org/download/gmp/gmp-6.2.1.tar.xz"
filename["$group-$index"]=gmp-6.2.1.tar.xz
dirname["$group-$index"]=gmp-6.2.1
builder["$group-$index"]="configure"
dependencies["$group-$index"]=""
args["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# mpfr 4.1.0
index=22
name["$group-$index"]=mpfr
version["$group-$index"]=4.1.0
details["$group-$index"]=""
url["$group-$index"]="https://www.mpfr.org/mpfr-4.1.0/mpfr-4.1.0.tar.gz"
filename["$group-$index"]=mpfr-4.1.0.tar.gz
dirname["$group-$index"]=mpfr-4.1.0
builder["$group-$index"]="configure"
dependencies["$group-$index"]="gmp/$compilo/6.2.1"
args["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# SuiteSparse 5.10.1
index=23
name["$group-$index"]=suitesparse
version["$group-$index"]=5.10.1
details["$group-$index"]=""
url["$group-$index"]="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/refs/tags/v5.10.1.tar.gz -O SuiteSparse-5.10.1.tar.gz"
filename["$group-$index"]=SuiteSparse-5.10.1.tar.gz
dirname["$group-$index"]=SuiteSparse-5.10.1
builder["$group-$index"]="SuiteSparse"
dependencies["$group-$index"]="cmake/$compilo/3.20.5 lapack-blas/$compilo/3.9.1 metis/$compilo/5.1.0 mpfr/$compilo/4.1.0"
args["$group-$index"]="MY_METIS_LIB=\"-L$prefix/metis/$compilo/5.1.0/lib -lmetis\" MY_METIS_INC=$prefix/metis/$compilo/5.1.0/include LAPACK=\"-L$prefix/lapack-blas/$compilo/3.9.1/lib -llapack\" BLAS=\"-L$prefix/lapack-blas/$compilo/3.9.1/lib -lblas\" LDFLAGS=\"-L$prefix/${name["$group-$index"]}/$compilo/${version["$group-$index"]}/lib -L$prefix/mpfr/$compilo/4.1.0/lib -lmpfr -L$prefix/gmp/$compilo/6.2.1/lib -lgmp\""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# Boost 1.72.0
index=24
name["$group-$index"]=boost
version["$group-$index"]=1.72.0
details["$group-$index"]=""
url["$group-$index"]="https://archives.boost.io/release/1.72.0/source/boost_1_72_0.tar.gz"
filename["$group-$index"]=boost_1_72_0.tar.gz
dirname["$group-$index"]=boost_1_72_0
patchfile_01["$group-$index"]="boost/thread/pthread/thread_data.hpp"
patch_01["$group-$index"]="--- ./boost/thread/pthread/thread_data.hpp.original  2025-10-30 12:27:17.626740000 +0100
+++ ./boost/thread/pthread/thread_data.hpp      2025-10-30 12:28:10.995168000 +0100
@@ -57,7 +57,7 @@
 #else
           std::size_t page_size = ::sysconf( _SC_PAGESIZE);
 #endif
-#if PTHREAD_STACK_MIN > 0
+#ifdef PTHREAD_STACK_MIN
           if (size<PTHREAD_STACK_MIN) size=PTHREAD_STACK_MIN;
 #endif
           size = ((size+page_size-1)/page_size)*page_size;
"
builder["$group-$index"]="boost"
if [[ "$compiler" == "intel" ]] ; then
    args["$group-$index"]="--toolset=intel --with-python=${pythonInterpreter}"
else
    args["$group-$index"]="--with-python=${pythonInterpreter}"
fi
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"    
    dirinstall["$group-$index"]="${name["$group-$index"]}/$pythonlib/$compilo/${version["$group-$index"]}"   
    dirmodule["$group-$index"]="${name["$group-$index"]}/$pythonlib/$compilo"
else
	dependencies["$group-$index"]="$mpi_dep python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
    dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$pythonlib/$compilo/${version["$group-$index"]}"	
	dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$pythonlib/$compilo"
fi
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
prepend-path BOOST_ROOT $prefix/${dirinstall["$group-$index"]}
prepend-path BOOST_DIR $prefix/${dirinstall["$group-$index"]}
prepend-path CMAKE_MODULE_PATH $prefix/${dirinstall["$group-$index"]}/lib/cmake
"

# Boost 1.76.0
index=25
name["$group-$index"]=boost
version["$group-$index"]=1.76.0
details["$group-$index"]=""
url["$group-$index"]="https://archives.boost.io/release/1.76.0/source/boost_1_76_0.tar.gz"
filename["$group-$index"]=boost_1_76_0.tar.gz
dirname["$group-$index"]=boost_1_76_0
builder["$group-$index"]="boost"
if [[ "$compiler" == "intel" ]] ; then
    args["$group-$index"]="--toolset=intel --with-python=${pythonInterpreter}"
else
    args["$group-$index"]="--with-python=${pythonInterpreter}"
fi
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"    
    dirinstall["$group-$index"]="${name["$group-$index"]}/$pythonlib/$compilo/${version["$group-$index"]}"   
    dirmodule["$group-$index"]="${name["$group-$index"]}/$pythonlib/$compilo"
else
	dependencies["$group-$index"]="$mpi_dep python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
    dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$pythonlib/$compilo/${version["$group-$index"]}"	
	dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$pythonlib/$compilo"
fi
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
prepend-path BOOST_ROOT $prefix/${dirinstall["$group-$index"]}
prepend-path BOOST_DIR $prefix/${dirinstall["$group-$index"]}
"

fi  # end-only-if-Python

# Cgal 5.5.2
index=26
name["$group-$index"]=cgal
version["$group-$index"]=5.5.2
details["$group-$index"]=""
url["$group-$index"]="https://github.com/CGAL/cgal/archive/refs/tags/v5.5.2.tar.gz -O cgal-5.5.2.tar.gz"
filename["$group-$index"]=cgal-5.5.2.tar.gz
dirname["$group-$index"]=cgal-5.5.2
builder["$group-$index"]="cmake"
if [ "$mpilib" == "none" ]; then 
    dependencies["$group-$index"]="cmake/$compilo/3.20.5 boost/$pythonlib/$compilo/1.76.0 gmp/$compilo/6.2.1 mpfr/$compilo/4.1.0"
else
    dependencies["$group-$index"]="cmake/$compilo/3.20.5 boost/$mpilib/$pythonlib/$compilo/1.76.0 gmp/$compilo/6.2.1 mpfr/$compilo/4.1.0"
fi
args["$group-$index"]="-DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=TRUE -DGMP_INCLUDE_DIR=$prefix/gmp/$compilo/6.2.1/include -DGMP_LIBRARIES=$prefix/gmp/$compilo/6.2.1/lib -DMPFR_INCLUDE_DIR=$prefix/mpfr/$compilo/4.1.0/include -DMPFR_LIBRARIES=$prefix/mpfr/$compilo/4.1.0/lib"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
setenv CGAL_DIR $prefix/${dirinstall["$group-$index"]}
"

if [ "$mpilib" != "none" ]; then # MPI-only

# petsc 3.12.5
index=27
name["$group-$index"]=petsc
version["$group-$index"]=3.12.5
details["$group-$index"]="(with parallel)"
url["$group-$index"]="https://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-3.12.5.tar.gz"
filename["$group-$index"]=petsc-3.12.5.tar.gz
dirname["$group-$index"]=petsc-3.12.5
patch_01["$group-$index"]="--- configure_original	2021-06-30 16:42:30.512355941 +0200
+++ configure	2021-06-30 16:42:39.844440867 +0200
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python${pythonVersion}
 
 import sys, os
 sys.path.insert(0, os.path.abspath('config'))
"
patchfile_01["$group-$index"]="configure"
builder["$group-$index"]="configure"
dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 lapack-blas/$compilo/3.9.1 scalapack/$mpilib/$compilo/2.1.0 med/$mpilib/$compilo/4.0.0 metis/$compilo/5.1.0 parmetis/$mpilib/$compilo/4.0.3 scotch/$compilo/6.0.9 ptscotch/$mpilib/$compilo/6.0.9 suitesparse/$compilo/5.10.1 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} boost/$mpilib/$pythonlib/$compilo/1.76.0 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 netcdf-fortran/hdf5.110/$mpilib/$compilo/4.5.3 parallel-netcdf/$mpilib/$compilo/1.13.0 mumps/$mpilib/$compilo/5.2.1"
args["$group-$index"]="--with-debugging=0 --with-openmp=1 --with-zlib=1 --with-hdf5=1 --with-netcdf=1 --with-pnetcdf=1 --with-metis=1 --with-parmetis=1 --with-ptscotch=1 --with-mumps=1 --with-scalapack=1 --with-suitesparse=1 --with-boost=1 --with-med=1 --with-python --download-zoltan=1 --download-zoltan-configure-arguments=--enable-f90interface --download-petsc4py=1 --with-valgrind=0 --with-mpi4py=0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$pythonlib/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$pythonlib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
setenv PETSC_DIR $prefix/${dirinstall["$group-$index"]}
"

# gmsh 4.8.4
index=28
name["$group-$index"]=gmsh
version["$group-$index"]=4.8.4
details["$group-$index"]="(with parallel)"
url["$group-$index"]="https://gmsh.info/src/gmsh-4.8.4-source.tgz"
filename["$group-$index"]=gmsh-4.8.4-source.tgz
dirname["$group-$index"]=gmsh-4.8.4-source
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="$mpi_dep cmake/$compilo/3.20.5 zlib/$compilo/1.2.11 lapack-blas/$compilo/3.9.1 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 netcdf-fortran/hdf5.110/$mpilib/$compilo/4.5.3 metis/$compilo/5.1.0 parmetis/$mpilib/$compilo/4.0.3 med/$mpilib/$compilo/4.0.0 mumps/$mpilib/$compilo/5.2.1"
args["$group-$index"]="-DENABLE_BLAS_LAPACK=1 -DENABLE_METIS=1 -DENABLE_OPENMP=1 -DENABLE_MED=1 -DENABLE_MUMPS=1 -DENABLE_MPI=1 -DENABLE_FLTK=0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"
fi # end-MPI-only

# GMT 6.5.0
index=29
name["$group-$index"]=gmt
version["$group-$index"]=6.5.0
details["$group-$index"]=""
url["$group-$index"]="https://github.com/GenericMappingTools/gmt/archive/refs/tags/6.5.0.tar.gz -O gmt-6.5.0.tar.gz"
filename["$group-$index"]=gmt-6.5.0.tar.gz
dirname["$group-$index"]=gmt-6.5.0
builder["$group-$index"]="gmt6"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.8.0 udunits/$compilo/2.2.28 proj/$compilo/8.0.1 gdal/$compilo/3.4.1 lapack-blas/$compilo/3.9.1"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.13.0 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 udunits/$compilo/2.2.28 proj/$compilo/8.0.1 gdal/$compilo/3.4.1 lapack-blas/$compilo/3.9.1"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-DGSHHG_PATH=$prefix/gshhg-gmt/$compilo/2.3.7 -DDCW_PATH=$prefix/dcw-gmt/$compilo/2.1.0"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
setenv GMT_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include  
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
"
if [ "$mpilib" != "none" ]; then # MPI-only

# hypre 2.11.1
index=30
name["$group-$index"]=hypre
version["$group-$index"]=2.11.1
details["$group-$index"]=""
url["$group-$index"]="https://github.com/hypre-space/hypre/archive/refs/tags/v2.11.1.tar.gz -O hypre-2.11.1.tar.gz"
filename["$group-$index"]=hypre-2.11.1.tar.gz
dirname["$group-$index"]=hypre-2.11.1/src
patch_01["$group-$index"]="--- Makefile	2016-06-09 16:48:30.000000000 +0200
+++ Makefile_new	2023-05-29 15:02:43.661248000 +0200
@@ -106,6 +106,6 @@
 	\${RANLIB} \$@
 
 libHYPRE.so: \${FILES_HYPRE}
-	@echo  \"Building \$@ ... \"
-	\${BUILD_CC_SHARED} -o \${SONAME} \${FILES_HYPRE} \${SOLIBS} \${SHARED_SET_SONAME}\${SONAME} \${SHARED_OPTIONS} \${LDFLAGS}
+	@echo  \"Building $@ ... \"  
+	\${BUILD_CC_SHARED} -o \${SONAME} \${FILES_HYPRE} \$(subst null,,\$(SOLIBS)) -lmpi_cxx \${SHARED_SET_SONAME}\${SONAME} \${SHARED_OPTIONS} \${LDFLAGS}
 	ln -s \${SONAME} \$@
"
patchfile_01["$group-$index"]="lib/Makefile"
builder["$group-$index"]="configure"
dependencies["$group-$index"]="$mpi_dep"
args["$group-$index"]="--enable-shared"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# petsc tferma-v1.0
index=31
name["$group-$index"]=petsc
version["$group-$index"]=tferma-v1.0
details["$group-$index"]="(with parallel)"
url["$group-$index"]="https://bitbucket.org/tferma/petsc/get/tferma-v1.0.tar.gz -O petsc-tferma-v1.0.tar.gz"
filename["$group-$index"]=petsc-tferma-v1.0.tar.gz
dirname["$group-$index"]=tferma-petsc-111ef2698fa5
patch_01["$group-$index"]="--- configure	2023-05-25 16:30:38.647142840 +0200
+++ configure_new	2023-05-25 16:34:54.017557895 +0200
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python${pythonVersion}
 
 import sys
 if not type(sys.version_info) is tuple and sys.version_info.major > 2:
"
patchfile_01["$group-$index"]="configure"
builder["$group-$index"]="configure"
dependencies["$group-$index"]="$mpi_dep python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cmake/$compilo/3.20.5 lapack-blas/$compilo/3.9.1 boost/$mpilib/$pythonlib/$compilo/1.72.0 hypre/$mpilib/$compilo/2.11.1"
args["$group-$index"]="--with-python --with-debugging=0 --known-mpi-shared-libraries=1 --with-c-support=1 --with-c++-support=1 --with-shared-libraries=1 --with-mpi=1 --with-lapack-lib=$prefix/lapack-blas/$compilo/3.9.1/lib/liblapack.so --with-blas-lib=$prefix/lapack-blas/$compilo/3.9.1/lib/libblas.so --download-suitesparse=1 --download-ml --download-blacs --download-scalapack --download-mumps --download-ptscotch --with-fortran-interfaces=1 --download-prometheus --download-parmetis --download-metis --with-hypre=1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$pythonlib/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$pythonlib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
setenv PETSC_DIR $prefix/${dirinstall["$group-$index"]}
"

fi # end-MPI-only

# Cgal 6.1
index=32
name["$group-$index"]=cgal
version["$group-$index"]=6.1
details["$group-$index"]=""
url["$group-$index"]="https://github.com/CGAL/cgal/archive/refs/tags/v6.1.tar.gz -O cgal-6.1.tar.gz"
filename["$group-$index"]=cgal-6.1.tar.gz
dirname["$group-$index"]=cgal-6.1
builder["$group-$index"]="cmake"
if [ "$mpilib" == "none" ]; then 
    dependencies["$group-$index"]="cmake/$compilo/3.20.5 boost/$pythonlib/$compilo/1.76.0 gmp/$compilo/6.2.1 mpfr/$compilo/4.1.0"
else
    dependencies["$group-$index"]="cmake/$compilo/3.20.5 boost/$mpilib/$pythonlib/$compilo/1.76.0 gmp/$compilo/6.2.1 mpfr/$compilo/4.1.0"
fi
args["$group-$index"]="-DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=TRUE -DGMP_INCLUDE_DIR=$prefix/gmp/$compilo/6.2.1/include -DGMP_LIBRARIES=$prefix/gmp/$compilo/6.2.1/lib -DMPFR_INCLUDE_DIR=$prefix/mpfr/$compilo/4.1.0/include -DMPFR_LIBRARIES=$prefix/mpfr/$compilo/4.1.0/lib"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
setenv CGAL_DIR $prefix/${dirinstall["$group-$index"]}
"

# GDAL 3.12.1
index=33
name["$group-$index"]=gdal
version["$group-$index"]=3.12.1
details["$group-$index"]="(needed by GMT)"
url["$group-$index"]="https://github.com/OSGeo/gdal/releases/download/v3.12.1/gdal-3.12.1.tar.gz"
filename["$group-$index"]=gdal-3.12.1.tar.gz
dirname["$group-$index"]=gdal-3.12.1
builder["$group-$index"]="cmake"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="cmake/$compilo/3.31.8 zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.8.0 udunits/$compilo/2.2.28 sqlite/$compilo/3.36.0 proj/$compilo/8.0.1 geos/$compilo/3.10.3 tiff/$compilo/4.4.0"
	args["$group-$index"]="-DPROJ_LIBRARY_RELEASE=$prefix/proj/$compilo/8.0.1/lib/libproj.so -DTIFF_LIBRARY_RELEASE=$prefix/tiff/$compilo/4.4.0/lib/libtiff.so"
else
	dependencies["$group-$index"]="cmake/$compilo/3.31.8 $mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 udunits/$compilo/2.2.28 sqlite/$compilo/3.36.0 proj/$compilo/8.0.1 geos/$compilo/3.10.3 tiff/$compilo/4.4.0"
	args["$group-$index"]="-DPROJ_LIBRARY_RELEASE=$prefix/proj/$compilo/8.0.1/lib/libproj.so -DTIFF_LIBRARY_RELEASE=$prefix/tiff/$compilo/4.4.0/lib/libtiff.so"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include  
"




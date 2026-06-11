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
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="zlib/__COMPILO__/1.2.11 hdf5/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28"
else
	dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="zlib/__COMPILO__/1.2.11 hdf5/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 antlr/__COMPILO__/2.7.7"
else
	dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 antlr/__COMPILO__/2.7.7"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="ANTLR_ROOT=$prefix/antlr/__COMPILO__/2.7.7"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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

# geos 3.14.1
index=4
name["$group-$index"]=geos
version["$group-$index"]=3.14.1
details["$group-$index"]="(needed by GDAL)"
url["$group-$index"]=http://download.osgeo.org/geos/geos-3.14.1.tar.bz2
filename["$group-$index"]=geos-3.14.1.tar.bz2
dirname["$group-$index"]=geos-3.14.1
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="cmake/3.31.8"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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

# Proj 9.7.1
index=5
name["$group-$index"]=proj
version["$group-$index"]=9.7.1
details["$group-$index"]="(needed by GDAL)"
url["$group-$index"]=https://download.osgeo.org/proj/proj-9.7.1.tar.gz
filename["$group-$index"]=proj-9.7.1.tar.gz
dirname["$group-$index"]=proj-9.7.1
builder["$group-$index"]="cmake"
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="zlib/__COMPILO__/1.2.11 hdf5/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 sqlite/__COMPILO__/3.36.0 tiff/__COMPILO__/4.4.0"
else
	dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 sqlite/__COMPILO__/3.36.0 tiff/__COMPILO__/4.4.0"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="-DTIFF_INCLUDE_DIR=$prefix/tiff/__COMPILO__/4.4.0/include -DTIFF_LIBRARY_RELEASE=$prefix/tiff/__COMPILO__/4.4.0/lib/libtiff.so"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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


# pyproj 3.1.0
index=6
name["$group-$index"]=pyproj
version["$group-$index"]=3.1.0
constraints["$group-$index"]='[ "$pythonInterpreter" != "none" ]'
details["$group-$index"]="(version Python)"
url["$group-$index"]="https://files.pythonhosted.org/packages/7c/1d/20ea3b603db61ccc60f45064a9e00ba2e6263f1de560e33306f6f3d42fcb/pyproj-3.1.0.tar.gz"
filename["$group-$index"]=pyproj-3.1.0.tar.gz
dirname["$group-$index"]=pyproj-3.1.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__ proj/__COMPILO__/9.7.1"
dirinstall["$group-$index"]="python-modules/__COMPILO__"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# GDAL 3.4.1
index=7
name["$group-$index"]=gdal
version["$group-$index"]=3.4.1
details["$group-$index"]="(needed by GMT)"
url["$group-$index"]="https://github.com/OSGeo/gdal/releases/download/v3.4.1/gdal-3.4.1.tar.gz"
filename["$group-$index"]=gdal-3.4.1.tar.gz
dirname["$group-$index"]=gdal-3.4.1
builder["$group-$index"]="configure"
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="zlib/__COMPILO__/1.2.11 hdf5/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 sqlite/__COMPILO__/3.36.0 proj/__COMPILO__/9.7.1 geos/__COMPILO__/3.14.1"
	args["$group-$index"]="--with-sqlite3=$prefix/sqlite/__COMPILO__/3.36.0 --with-proj=$prefix/proj/__COMPILO__/9.7.1"
else
	dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 sqlite/__COMPILO__/3.36.0 proj/__COMPILO__/9.7.1 geos/__COMPILO__/3.14.1"
	args["$group-$index"]="--with-sqlite3=$prefix/sqlite/__COMPILO__/3.36.0 --with-proj=$prefix/proj/__COMPILO__/9.7.1 LDFLAGS=-lmpi_cxx"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
# pygdal 3.4.1.10
index=8
name["$group-$index"]=gdal
version["$group-$index"]=3.4.1.10
constraints["$group-$index"]='pythonInterpreter != none'
details["$group-$index"]="(version Python - need GDAL 3.4.1)"
url["$group-$index"]=https://files.pythonhosted.org/packages/05/ba/0891004164c7d596f46e721cb6ef6a5f7530fff1a25e9fd98337ca57d503/pygdal-3.4.1.10.tar.gz
filename["$group-$index"]=pygdal-3.4.1.10.tar.gz
dirname["$group-$index"]=pygdal-3.4.1.10
builder["$group-$index"]="python"
dependencies["$group-$index"]="gdal/__COMPILO__/3.4.1 python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__"
dirinstall["$group-$index"]="python-modules/__COMPILO__"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# GDAL 2.4.2
index=9
name["$group-$index"]=gdal
version["$group-$index"]=2.4.2
details["$group-$index"]="(need Netcdf-C 4.4.1.1)"
url["$group-$index"]="https://download.osgeo.org/gdal/2.4.2/gdal-2.4.2.tar.gz"
filename["$group-$index"]=gdal-2.4.2.tar.gz
dirname["$group-$index"]=gdal-2.4.2
builder["$group-$index"]="configure"
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="zlib/__COMPILO__/1.2.11 hdf5/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__COMPILO__/4.4.1.1 udunits/__COMPILO__/2.2.28 proj/__COMPILO__/9.7.1"
else
	dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.4.1.1 udunits/__COMPILO__/2.2.28 proj/__COMPILO__/9.7.1"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="--with-proj=$prefix/proj/__COMPILO__/9.7.1 LDFLAGS=-lmpi_cxx"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
#dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
#dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="zlib/__COMPILO__/1.2.11 hdf5/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 proj/__COMPILO__/9.7.1 gdal/__COMPILO__/3.3.0 lapack-blas/__COMPILO__/3.9.1"
else
	dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 parallel-netcdf/__MPI_LIB__/__COMPILO__/1.13.0 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 proj/__COMPILO__/9.7.1 gdal/__COMPILO__/3.3.0 lapack-blas/__COMPILO__/3.9.1"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="-DGSHHG_PATH=$prefix/gshhg-gmt/__COMPILO__/2.3.7 -DDCW_PATH=$prefix/dcw-gmt/__COMPILO__/2.1.0"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="zlib/__COMPILO__/1.2.11 hdf5/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 proj/__COMPILO__/9.7.1"
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/__COMPILO__/1.14.6/ --with-netcdf=$prefix/netcdf/hdf5.146/__COMPILO__/c/4.9.3/ --with-udunits2=$prefix/udunits/__COMPILO__/2.2.28 --with-proj=$prefix/proj/__COMPILO__/9.7.1/"
else
	dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 proj/__COMPILO__/9.7.1"
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/__MPI_LIB__/__COMPILO__/1.14.6/ --with-netcdf=$prefix/netcdf/hdf5.146/__MPI_LIB__/__COMPILO__/c/4.9.3/ --with-udunits2=$prefix/udunits/__COMPILO__/2.2.28 --with-proj=$prefix/proj/__COMPILO__/9.7.1/"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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


# MED-6.0.1
index=14
name["$group-$index"]=med
version["$group-$index"]=6.0.1
constraints["$group-$index"]='mpilib != none' # MPI-only
details["$group-$index"]=""
url["$group-$index"]=https://mirror.snale.net/med-6.0.1.tar.gz
filename["$group-$index"]=med-6.0.1.tar.gz
dirname["$group-$index"]=med-6.0.1
builder["$group-$index"]="configure"
dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 hdf5/__MPI_LIB__/__COMPILO__/1.14.6"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
if [[ "$mpi" == "intelmpi" ]] ; then
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/__MPI_LIB__/__COMPILO__/1.14.6 --disable-python CC=mpiicc CXX=mpiicpc F77=mpiifort FC=mpiifort"
elif [[ "$mpi" == "mpich" ]] ; then
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/__MPI_LIB__/__COMPILO__/1.14.6 --disable-python CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"	
elif [[ "$mpi" == "openmpi" ]] ; then	
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/__MPI_LIB__/__COMPILO__/1.14.6 --disable-python CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"	
fi
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
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
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
dependencies["$group-$index"]="cmake/3.31.8"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tMetis ${version["$group-$index"]}\"
}
 
module-whatis \"Metis ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# ParMetis 4.0.3
index=17
name["$group-$index"]=parmetis
version["$group-$index"]=4.0.3
constraints["$group-$index"]='mpilib != none' # MPI-only
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
dependencies["$group-$index"]="__MPI_MODULE__ cmake/3.31.8"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
if [[ "$mpi" == "intelmpi" ]] ; then
	args["$group-$index"]="cc=mpiicc cxx=mpiicpc"
elif [[ "$mpi" == "mpich" ]] ; then
	args["$group-$index"]="cc=mpicc cxx=mpic++"	
elif [[ "$mpi" == "openmpi" ]] ; then	
	args["$group-$index"]="cc=mpicc cxx=mpic++"	
fi
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
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

# Scotch 6.0.9
index=18
name["$group-$index"]=scotch
version["$group-$index"]=6.0.9
details["$group-$index"]="(sequential version)"
url["$group-$index"]="--no-check-certificate https://gforge.inria.fr/frs/download.php/file/38187/scotch_6.0.9.tar.gz"
filename["$group-$index"]=scotch_6.0.9.tar.gz
dirname["$group-$index"]=scotch_6.0.9
builder["$group-$index"]="scotch"
dependencies["$group-$index"]="metis/__COMPILO__/5.1.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
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
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
constraints["$group-$index"]='mpilib != none' # MPI-only
details["$group-$index"]=""
url["$group-$index"]="--no-check-certificate https://gforge.inria.fr/frs/download.php/file/38187/scotch_6.0.9.tar.gz"
filename["$group-$index"]=scotch_6.0.9.tar.gz
dirname["$group-$index"]=scotch_6.0.9
builder["$group-$index"]="ptscotch"
dependencies["$group-$index"]="__MPI_MODULE__ parmetis/__MPI_LIB__/__COMPILO__/4.0.3"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
configfilename["$group-$index"]="src/Makefile.inc"
#if [[ $compiler == "intel" ]]; then
#configfile["$group-$index"]="EXE		=
#LIB		= .so
#OBJ		= .o
#
#MAKE		= make
#AR		= \$(MPICC)
#ARFLAGS	= -shared -fPIC -o 
#CAT		= cat
#CCS		= \$(MPICC)
#CCP		= \$(MPICC)
#MPI_INC         = \$(shell \$(MPICC) -show | sed -e 's/.*\(\-I.*include\).*/\1/')
#CCD		= \$(MPICC) \$(MPI_INC)
#CFLAGS		= -O3 -fPIC -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_PTHREAD -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DSCOTCH_PTHREAD -DSCOTCH_METIS_VERSION=0 -restrict -DIDXSIZE64
#CLIBFLAGS	=
#LDFLAGS	= -lz -lm -lrt -pthread
#CP		= cp
#LEX		= flex -Pscotchyy -olex.yy.c
#LN		= ln
#MKDIR		= mkdir -p
#MV		= mv
#RANLIB		= chmod +x
#YACC		= bison -pscotchyy -y -b y
#"
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
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
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

# MUMPS 5.7.3
index=20
name["$group-$index"]=mumps
version["$group-$index"]=5.7.3
constraints["$group-$index"]='mpilib != none' # MPI-only
url["$group-$index"]=https://distfiles.macports.org/mumps/MUMPS_5.7.3.tar.gz
filename["$group-$index"]=MUMPS_5.7.3.tar.gz
dirname["$group-$index"]=MUMPS_5.7.3
builder["$group-$index"]="mumps"
dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 lapack-blas/__COMPILO__/3.9.1 scalapack/__MPI_LIB__/__COMPILO__/2.1.0 parmetis/__MPI_LIB__/__COMPILO__/4.0.3 ptscotch/__MPI_LIB__/__COMPILO__/6.0.9"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
configfilename["$group-$index"]="Makefile.inc"
if [[ $compiler == "intel" ]]; then
details["$group-$index"]="(dynamic lib - require Intel MKL)"
configfile["$group-$index"]="#
#  This file is part of MUMPS 5.7.3, released
#  on Fri Jun 14 14:46:05 UTC 2019
#
#Begin orderings

SCOTCHDIR  = $prefix/scotch/__COMPILO__/6.0.9
PTSCOTCHDIR  = $prefix/ptscotch/__MPI_LIB__/__COMPILO__/6.0.9
ISCOTCH    = -I\$(SCOTCHDIR)/include -I\$(PTSCOTCHDIR)/include
LSCOTCH    = -L\$(PTSCOTCHDIR)/lib -lesmumps -lptscotch -lptscotcherr -L\$(SCOTCHDIR)/lib  -lptesmumps -lscotch -lscotcherr

LPORDDIR = \$(topdir)/PORD/lib/
IPORD    = -I\$(topdir)/PORD/include/
LPORD    = -L\$(LPORDDIR) -lpord

LMETISDIR = $prefix/metis/__COMPILO__/5.1.0
LPARMETISDIR = $prefix/parmetis/__MPI_LIB__/__COMPILO__/4.0.3
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
#  This file is part of MUMPS 5.7.3, released
#  on Fri Jun 14 14:46:05 UTC 2019
#Begin orderings

SCOTCHDIR  = $prefix/scotch/__COMPILO__/6.0.9
PTSCOTCHDIR  = $prefix/ptscotch/__MPI_LIB__/__COMPILO__/6.0.9
ISCOTCH    = -I\$(SCOTCHDIR)/include -I\$(PTSCOTCHDIR)/include
LSCOTCH    = -L\$(SCOTCHDIR)/lib -lesmumps -lscotch -lscotcherr -L\$(PTSCOTCHDIR)/lib -lptesmumps -lptscotch -lptscotcherr

LPORDDIR = \$(topdir)/PORD/lib/
IPORD    = -I\$(topdir)/PORD/include/
LPORD    = -L\$(LPORDDIR) -lpord

LMETISDIR = $prefix/metis/__COMPILO__/5.1.0
LPARMETISDIR = $prefix/parmetis/__MPI_LIB__/__COMPILO__/4.0.3
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
OPTF    = -O -fopenmp -fPIC -fallow-argument-mismatch
OPTL    = -O -fopenmp -fPIC
OPTC    = -O -fopenmp -fPIC
#End Optimized options
 
INCS = \$(INCPAR)
LIBS = \$(LIBPAR)
LIBSEQNEEDED =
"
fi
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
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
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
dependencies["$group-$index"]="gmp/__COMPILO__/6.2.1"
args["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
dependencies["$group-$index"]="cmake/3.31.8 lapack-blas/__COMPILO__/3.9.1 metis/__COMPILO__/5.1.0 mpfr/__COMPILO__/4.1.0"
args["$group-$index"]="MY_METIS_LIB=\"-L$prefix/metis/__COMPILO__/5.1.0/lib -lmetis\" MY_METIS_INC=$prefix/metis/__COMPILO__/5.1.0/include LAPACK=\"-L$prefix/lapack-blas/__COMPILO__/3.9.1/lib -llapack\" BLAS=\"-L$prefix/lapack-blas/__COMPILO__/3.9.1/lib -lblas\" LDFLAGS=\"-L$prefix/${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}/lib -L$prefix/mpfr/__COMPILO__/4.1.0/lib -lmpfr -L$prefix/gmp/__COMPILO__/6.2.1/lib -lgmp\""
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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


# Boost 1.72.0
index=24
name["$group-$index"]=boost
version["$group-$index"]=1.72.0
constraints["$group-$index"]='pythonInterpreter != none'
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
    args["$group-$index"]="--toolset=intel --with-python=__PYTHON_INTERPRETER__"
else
    args["$group-$index"]="--with-python=__PYTHON_INTERPRETER__"
fi
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__"    
    dirinstall["$group-$index"]="${name["$group-$index"]}/__PYTHON_LIB__/__COMPILO__/${version["$group-$index"]}"   
    dirmodule["$group-$index"]="${name["$group-$index"]}/__PYTHON_LIB__/__COMPILO__"
else
	dependencies["$group-$index"]="__MPI_MODULE__ python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__"
    dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__/${version["$group-$index"]}"	
	dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__"
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

# Boost 1.90.0
index=25
name["$group-$index"]=boost
version["$group-$index"]=1.90.0
constraints["$group-$index"]='pythonInterpreter != none'
details["$group-$index"]=""
url["$group-$index"]="https://archives.boost.io/release/1.90.0/source/boost_1_90_0.tar.gz"
filename["$group-$index"]=boost_1_90_0.tar.gz
dirname["$group-$index"]=boost_1_90_0
builder["$group-$index"]="boost"
if [[ "$compiler" == "intel" ]] ; then
    args["$group-$index"]="--toolset=intel --with-python=__PYTHON_INTERPRETER__"
else
    args["$group-$index"]="--with-python=__PYTHON_INTERPRETER__"
fi
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__"    
    dirinstall["$group-$index"]="${name["$group-$index"]}/__PYTHON_LIB__/__COMPILO__/${version["$group-$index"]}"   
    dirmodule["$group-$index"]="${name["$group-$index"]}/__PYTHON_LIB__/__COMPILO__"
else
	dependencies["$group-$index"]="__MPI_MODULE__ python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__"
    dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__/${version["$group-$index"]}"	
	dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__"
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

# Cgal 5.5.2
index=26
name["$group-$index"]=cgal
version["$group-$index"]=5.5.2
details["$group-$index"]=""
url["$group-$index"]="https://github.com/CGAL/cgal/archive/refs/tags/v5.5.2.tar.gz -O cgal-5.5.2.tar.gz"
filename["$group-$index"]=cgal-5.5.2.tar.gz
dirname["$group-$index"]=cgal-5.5.2
builder["$group-$index"]="cmake"
if [ "__MPI_LIB__" == "none" ]; then 
    dependencies["$group-$index"]="cmake/3.31.8 boost/__PYTHON_LIB__/__COMPILO__/1.90.0 gmp/__COMPILO__/6.2.1 mpfr/__COMPILO__/4.1.0"
else
    dependencies["$group-$index"]="cmake/3.31.8 boost/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__/1.90.0 gmp/__COMPILO__/6.2.1 mpfr/__COMPILO__/4.1.0"
fi
args["$group-$index"]="-DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=TRUE -DGMP_INCLUDE_DIR=$prefix/gmp/__COMPILO__/6.2.1/include -DGMP_LIBRARIES=$prefix/gmp/__COMPILO__/6.2.1/lib -DMPFR_INCLUDE_DIR=$prefix/mpfr/__COMPILO__/4.1.0/include -DMPFR_LIBRARIES=$prefix/mpfr/__COMPILO__/4.1.0/lib"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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

# petsc 3.24.6
index=27
name["$group-$index"]=petsc
version["$group-$index"]=3.24.6
options["$group-$index"]="+openmp+mpi+hdf5+netcdf+pnetcdf+metis+parmetis+ptscotch+mumps+scalapack+suitesparse+boot+med+python+zoltan"
constraints["$group-$index"]='mpilib != none' # MPI-only
details["$group-$index"]=""
url["$group-$index"]="https://web.cels.anl.gov/projects/petsc/download/release-snapshots/petsc-3.24.6.tar.gz"
filename["$group-$index"]=petsc-3.24.6.tar.gz
dirname["$group-$index"]=petsc-3.24.6
builder["$group-$index"]="configure"
dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 lapack-blas/__COMPILO__/3.9.1 scalapack/__MPI_LIB__/__COMPILO__/2.1.0 med/__MPI_LIB__/__COMPILO__/6.0.1 parmetis/__MPI_LIB__/__COMPILO__/4.0.3 scotch/__COMPILO__/6.0.9 ptscotch/__MPI_LIB__/__COMPILO__/6.0.9 suitesparse/__COMPILO__/5.10.1 python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__ boost/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__/1.72.0 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.9.3 netcdf-fortran/hdf5.146/__MPI_LIB__/__COMPILO__/4.5.3 parallel-netcdf/__MPI_LIB__/__COMPILO__/1.13.0 mumps/__MPI_LIB__/__COMPILO__/5.7.3 zoltan/__MPI_LIB__/__COMPILO__/3.83"
args["$group-$index"]="--with-debugging=0 --with-shared-libraries=1 --with-strict-petscerrorcode --COPTFLAGS='-O3 -march=native -mtune=native' --CXXOPTFLAGS='-O3 -march=native -mtune=native' --FOPTFLAGS='-O3 -march=native -mtune=native'  --with-openmp=1 --with-zlib=1 --with-hdf5=1 --with-netcdf=1 --with-pnetcdf=1 --with-metis=1 --with-parmetis=1 --with-ptscotch=1 --with-mumps=1 --with-scalapack=1 --with-suitesparse=1 --with-boost=1 --with-med=1 --with-python --with-zoltan=1 --download-petsc4py=1 --with-valgrind=0 --with-mpi4py=0"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__"
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

# gmsh 4.15.2
index=28
name["$group-$index"]=gmsh
version["$group-$index"]=4.15.2
constraints["$group-$index"]='mpilib != none' # MPI-only
options["$group-$index"]="+lapack+metis+openmp+med+mumps"
details["$group-$index"]=""
url["$group-$index"]="https://gmsh.info/src/gmsh-4.15.2-source.tgz"
filename["$group-$index"]=gmsh-4.15.2-source.tgz
dirname["$group-$index"]=gmsh-4.15.2-source
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="cmake/3.31.8 zlib/__COMPILO__/1.2.11 lapack-blas/__COMPILO__/3.9.1 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.9.3 netcdf-fortran/hdf5.146/__MPI_LIB__/__COMPILO__/4.5.3 metis/__COMPILO__/5.1.0 parmetis/__MPI_LIB__/__COMPILO__/4.0.3 med/__MPI_LIB__/__COMPILO__/6.0.1 mumps/__MPI_LIB__/__COMPILO__/5.7.3"
args["$group-$index"]="-DENABLE_BLAS_LAPACK=1 -DENABLE_METIS=1 -DENABLE_OPENMP=1 -DENABLE_MED=1 -DENABLE_MUMPS=1 -DENABLE_FLTK=0"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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

# GMT 6.5.0
index=29
name["$group-$index"]=gmt
version["$group-$index"]=6.5.0
details["$group-$index"]=""
url["$group-$index"]="https://github.com/GenericMappingTools/gmt/archive/refs/tags/6.5.0.tar.gz -O gmt-6.5.0.tar.gz"
filename["$group-$index"]=gmt-6.5.0.tar.gz
dirname["$group-$index"]=gmt-6.5.0
builder["$group-$index"]="gmt6"
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="zlib/__COMPILO__/1.2.11 hdf5/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 proj/__COMPILO__/9.7.1 gdal/__COMPILO__/3.4.1 lapack-blas/__COMPILO__/3.9.1"
else
	dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 parallel-netcdf/__MPI_LIB__/__COMPILO__/1.13.0 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 proj/__COMPILO__/9.7.1 gdal/__COMPILO__/3.4.1 lapack-blas/__COMPILO__/3.9.1"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="-DGSHHG_PATH=$prefix/gshhg-gmt/__COMPILO__/2.3.7 -DDCW_PATH=$prefix/dcw-gmt/__COMPILO__/2.1.0"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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

# hypre 2.11.1
index=30
name["$group-$index"]=hypre
version["$group-$index"]=2.11.1
constraints["$group-$index"]='mpilib != none' # MPI-only
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
dependencies["$group-$index"]="__MPI_MODULE__"
args["$group-$index"]="--enable-shared"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
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
constraints["$group-$index"]='mpilib != none' # MPI-only
details["$group-$index"]="(with parallel)"
url["$group-$index"]="https://bitbucket.org/tferma/petsc/get/tferma-v1.0.tar.gz -O petsc-tferma-v1.0.tar.gz"
filename["$group-$index"]=petsc-tferma-v1.0.tar.gz
dirname["$group-$index"]=tferma-petsc-111ef2698fa5
patch_01["$group-$index"]="--- configure	2023-05-25 16:30:38.647142840 +0200
+++ configure_new	2023-05-25 16:34:54.017557895 +0200
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python__PYTHON_VERSION__
 
 import sys
 if not type(sys.version_info) is tuple and sys.version_info.major > 2:
"
patchfile_01["$group-$index"]="configure"
builder["$group-$index"]="configure"
dependencies["$group-$index"]="__MPI_MODULE__ python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__ cmake/3.31.8 lapack-blas/__COMPILO__/3.9.1 boost/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__/1.72.0 hypre/__MPI_LIB__/__COMPILO__/2.11.1"
args["$group-$index"]="--with-python --with-debugging=0 --known-mpi-shared-libraries=1 --with-c-support=1 --with-c++-support=1 --with-shared-libraries=1 --with-mpi=1 --with-lapack-lib=$prefix/lapack-blas/__COMPILO__/3.9.1/lib/liblapack.so --with-blas-lib=$prefix/lapack-blas/__COMPILO__/3.9.1/lib/libblas.so --download-suitesparse=1 --download-ml --download-blacs --download-scalapack --download-mumps --download-ptscotch --with-fortran-interfaces=1 --download-prometheus --download-parmetis --download-metis --with-hypre=1"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__"
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

# Cgal 6.1
index=32
name["$group-$index"]=cgal
version["$group-$index"]=6.1
details["$group-$index"]=""
url["$group-$index"]="https://github.com/CGAL/cgal/archive/refs/tags/v6.1.tar.gz -O cgal-6.1.tar.gz"
filename["$group-$index"]=cgal-6.1.tar.gz
dirname["$group-$index"]=cgal-6.1
builder["$group-$index"]="cmake"
if [ "__MPI_LIB__" == "none" ]; then 
    dependencies["$group-$index"]="cmake/3.31.8 boost/__PYTHON_LIB__/__COMPILO__/1.90.0 gmp/__COMPILO__/6.2.1 mpfr/__COMPILO__/4.1.0"
else
    dependencies["$group-$index"]="cmake/3.31.8 boost/__MPI_LIB__/__PYTHON_LIB__/__COMPILO__/1.90.0 gmp/__COMPILO__/6.2.1 mpfr/__COMPILO__/4.1.0"
fi
args["$group-$index"]="-DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=TRUE -DGMP_INCLUDE_DIR=$prefix/gmp/__COMPILO__/6.2.1/include -DGMP_LIBRARIES=$prefix/gmp/__COMPILO__/6.2.1/lib -DMPFR_INCLUDE_DIR=$prefix/mpfr/__COMPILO__/4.1.0/include -DMPFR_LIBRARIES=$prefix/mpfr/__COMPILO__/4.1.0/lib"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
if [ "__MPI_LIB__" == "none" ]; then 
	dependencies["$group-$index"]="cmake/3.31.8 zlib/__COMPILO__/1.2.11 hdf5/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 sqlite/__COMPILO__/3.36.0 proj/__COMPILO__/9.7.1 geos/__COMPILO__/3.14.1 tiff/__COMPILO__/4.4.0"
	args["$group-$index"]="-DPROJ_LIBRARY_RELEASE=$prefix/proj/__COMPILO__/9.7.1/lib/libproj.so -DTIFF_LIBRARY_RELEASE=$prefix/tiff/__COMPILO__/4.4.0/lib/libtiff.so"
else
	dependencies["$group-$index"]="cmake/3.31.8 __MPI_MODULE__ zlib/__COMPILO__/1.2.11 hdf5/__MPI_LIB__/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__MPI_LIB__/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 sqlite/__COMPILO__/3.36.0 proj/__COMPILO__/9.7.1 geos/__COMPILO__/3.14.1 tiff/__COMPILO__/4.4.0"
	args["$group-$index"]="-DPROJ_LIBRARY_RELEASE=$prefix/proj/__COMPILO__/9.7.1/lib/libproj.so -DTIFF_LIBRARY_RELEASE=$prefix/tiff/__COMPILO__/4.4.0/lib/libtiff.so"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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

# superlu 7.0.1
index=34
name["$group-$index"]=superlu
version["$group-$index"]=7.0.1
details["$group-$index"]=""
url["$group-$index"]="https://github.com/xiaoyeli/superlu/archive/refs/tags/v7.0.1.tar.gz -O superlu-7.0.1.tar.gz"
filename["$group-$index"]=superlu-7.0.1.tar.gz
dirname["$group-$index"]=superlu-7.0.1
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="cmake/3.31.8 lapack-blas/__COMPILO__/3.9.1 metis/__COMPILO__/5.1.0"
args["$group-$index"]="-DTPL_ENABLE_METISLIB=ON -DTPL_METIS_INCLUDE_DIRS=$prefix/metis/__COMPILO__/5.1.0/include -DTPL_METIS_LIBRARIES=$prefix/metis/__COMPILO__/5.1.0/lib/libmetis.so"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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

# zoltan 3.83
index=35
name["$group-$index"]=zoltan
version["$group-$index"]=3.83
constraints["$group-$index"]='mpilib != none' # MPI-only
details["$group-$index"]="(with parallel)"
url["$group-$index"]="https://github.com/sandialabs/Zoltan/archive/refs/tags/v3.83.tar.gz -O zoltan-3.83.tar.gz"
filename["$group-$index"]=zoltan-3.83.tar.gz
dirname["$group-$index"]=Zoltan-3.83
builder["$group-$index"]="zoltan"
dependencies["$group-$index"]="__MPI_MODULE__ parmetis/__MPI_LIB__/__COMPILO__/4.0.3 scotch/__COMPILO__/6.0.9 ptscotch/__MPI_LIB__/__COMPILO__/6.0.9"
args["$group-$index"]="--with-mpi-compilers=yes --with-fcflags=-fallow-argument-mismatch --enable-f90interface --with-parmetis --with-parmetis-incdir=$prefix/parmetis/__MPI_LIB__/__COMPILO__/4.0.3/include --with-parmetis-libdir=$prefix/parmetis/__MPI_LIB__/__COMPILO__/4.0.3/lib --with-scotch --with-scotch-incdir=$prefix/scotch/__COMPILO__/6.0.9/include --with-scotch-libdir=$prefix/scotch/__COMPILO__/6.0.9/lib CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"	
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
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
"

# petsc 3.18.6
index=28
name["$group-$index"]=petsc
version["$group-$index"]=3.18.6
options["$group-$index"]="+mpi+hdf5+metis+parmetis+lapack+hypre+zoltan"
constraints["$group-$index"]='mpi == openmpi' # MPI-only
details["$group-$index"]=""
url["$group-$index"]="https://web.cels.anl.gov/projects/petsc/download/release-snapshots/petsc-3.18.6.tar.gz"
filename["$group-$index"]=petsc-3.18.6.tar.gz
dirname["$group-$index"]=petsc-3.18.6
builder["$group-$index"]="configure"
dependencies["$group-$index"]="__MPI_MODULE__ zlib/__COMPILO__/1.2.11"
args["$group-$index"]="--with-cc=mpicc --with-cxx=mpicxx --with-fc=mpif90 --with-c2html=0 --with-debugging=0 --with-fortran-bindings=0 --with-shared-libraries=1 --with-strict-petscerrorcode --COPTFLAGS='-O3 -march=native -mtune=native' --CXXOPTFLAGS='-O3 -march=native -mtune=native' --FOPTFLAGS='-O3 -march=native -mtune=native' --with-mpi=1 ---with-zlib=1 --download-fblaslapack --download-hdf5 --download-metis --download-parmetis --download-hypre --with-zoltan"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
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




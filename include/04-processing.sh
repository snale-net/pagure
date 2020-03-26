#!/bin/bash

#################################################################
#Group 4 : Processing
group=4
groupname[$group]="Processing librairies"

# Udunits 2.2.25
index=1
name["$group$index"]=udunits
version["$group$index"]=2.2.25
details["$group$index"]="(required for Ncview)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/udunits/udunits-2.2.25.tar.gz
filename["$group$index"]=udunits-2.2.25.tar.gz
dirname["$group$index"]=udunits-2.2.25
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tUdunits ${version["$group$index"]}\"
}
 
module-whatis \"Udunits ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# Ncview 2.1.7
index=2
name["$group$index"]=ncview
version["$group$index"]=2.1.7
details["$group$index"]=""
url["$group$index"]=ftp://cirrus.ucsd.edu/pub/ncview/ncview-2.1.7.tar.gz
filename["$group$index"]=ncview-2.1.7.tar.gz
dirname["$group$index"]=ncview-2.1.7
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.25"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.25"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNcview ${version["$group$index"]}\"
}
 
module-whatis \"Ncview ${version["$group$index"]}\"
module load udunits/$compilo/2.2.25
prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
"

# Antlr 2.7.7
index=3
name["$group$index"]=antlr
version["$group$index"]=2.7.7
details["$group$index"]="(required for NCO)"
url["$group$index"]=http://www.antlr2.org/download/antlr-2.7.7.tar.gz
filename["$group$index"]=antlr-2.7.7.tar.gz
dirname["$group$index"]=antlr-2.7.7
patch["$group$index"]="--- antlr-2.7.7/scripts/../lib/cpp/antlr/CharScanner.hpp	2017-11-30 10:36:20.301172303 +0100
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
patchfile["$group$index"]="lib/cpp/antlr/CharScanner.hpp"
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.25"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.25"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tAntlr ${version["$group$index"]}\"
}
 
module-whatis \"Antlr ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# NCO 4.9.0
index=4
name["$group$index"]=nco
version["$group$index"]=4.9.0
details["$group$index"]=""
url["$group$index"]="https://github.com/nco/nco/archive/4.9.0.tar.gz -O nco-4.9.0.tar.gz"
filename["$group$index"]=nco-4.9.0.tar.gz
dirname["$group$index"]=nco-4.9.0
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.25 antlr/$compilo/2.7.7"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.25 antlr/$compilo/2.7.7"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="ANTLR_ROOT=$prefix/antlr/$compilo/2.7.7"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNco ${version["$group$index"]}\"
}
 
module-whatis \"Nco ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# Proj 6.1.1
index=5
name["$group$index"]=proj
version["$group$index"]=6.1.1
details["$group$index"]="(required for GDAL)"
url["$group$index"]=https://github.com/OSGeo/PROJ/releases/download/6.1.1/proj-6.1.1.tar.gz
filename["$group$index"]=proj-6.1.1.tar.gz
dirname["$group$index"]=proj-6.1.1
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.25"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.25"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="ANTLR_ROOT=$prefix/antlr/$compilo/2.7.7"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tProj ${version["$group$index"]}1\"
}
 
module-whatis \"Proj ${version["$group$index"]}\"

prepend-path PATH $prefix/p${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/p${dirinstall["$group$index"]}/include 
"

# GDAL 3.0.1
index=6
name["$group$index"]=gdal
version["$group$index"]=3.0.1
details["$group$index"]="(required for GMT)"
url["$group$index"]="https://github.com/OSGeo/gdal/releases/download/v3.0.1/gdal-3.0.1.tar.gz"
filename["$group$index"]=gdal-3.0.1.tar.gz
dirname["$group$index"]=gdal-3.0.1
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.25 proj/$compilo/6.1.1"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.25 proj/$compilo/6.1.1"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="--with-proj=$prefix/proj/$compilo/6.1.1 LDFLAGS=-lmpi_cxx"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tGdal ${version["$group$index"]}1\"
}
 
module-whatis \"Gdal ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include  
"

if [ "$showOldVersion" = "1" ]; then

# GDAL 2.4.2
index=7
name["$group$index"]=gdal
version["$group$index"]=2.4.2
details["$group$index"]="required Netcdf-C 4.4.1.1"
url["$group$index"]="https://download.osgeo.org/gdal/2.4.2/gdal-2.4.2.tar.gz"
filename["$group$index"]=gdal-2.4.2.tar.gz
dirname["$group$index"]=gdal-2.4.2
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.4.1.1 udunits/$compilo/2.2.25 proj/$compilo/6.1.1"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.4.1.1 udunits/$compilo/2.2.25 proj/$compilo/6.1.1"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="--with-proj=$prefix/proj/$compilo/6.1.1 LDFLAGS=-lmpi_cxx"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tGdal ${version["$group$index"]}1\"
}
 
module-whatis \"Gdal ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include  
"

fi # end-old-version

# gshhg-gmt 2.3.7
index=8
name["$group$index"]=gshhg-gmt
version["$group$index"]=2.3.7
details["$group$index"]="(required for GMT)"
url["$group$index"]="ftp://ftp.soest.hawaii.edu/gmt/gshhg-gmt-2.3.7.tar.gz"
filename["$group$index"]=gshhg-gmt-2.3.7.tar.gz
dirname["$group$index"]=gshhg-gmt-2.3.7
builder["$group$index"]=""
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# dcw-gmt 1.1.4
index=9
name["$group$index"]=dcw-gmt
version["$group$index"]=1.1.4
details["$group$index"]="(required for GMT)"
url["$group$index"]="ftp://ftp.soest.hawaii.edu/gmt/dcw-gmt-1.1.4.tar.gz"
filename["$group$index"]=dcw-gmt-1.1.4.tar.gz
dirname["$group$index"]=dcw-gmt-1.1.4
builder["$group$index"]=""
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# GMT 5.4.5
index=10
name["$group$index"]=gmt
version["$group$index"]=5.4.5
details["$group$index"]=""
url["$group$index"]="ftp://ftp.soest.hawaii.edu/gmt/gmt-5.4.5-src.tar.gz"
filename["$group$index"]=gmt-5.4.5-src.tar.gz
dirname["$group$index"]=gmt-5.4.5
builder["$group$index"]="gmt5"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.25 proj/$compilo/6.1.1 gdal/$compilo/3.0.1 lapack-blas/$compilo/3.9.0"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.25 proj/$compilo/6.1.1 gdal/$compilo/3.0.1 lapack-blas/$compilo/3.9.0"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="-DGSHHG_PATH=$prefix/src/gshhg-gmt-2.3.7 -DDCW_PATH=$prefix/src/dcw-gmt-1.1.4 "
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tGMT ${version["$group$index"]}1\"
}
 
module-whatis \"GMT ${version["$group$index"]}\"

module load gdal/$compilo/3.0.1

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include  
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
"

# CDO 1.9.7.1
index=11
name["$group$index"]=cdo
version["$group$index"]=1.9.7.1
details["$group$index"]=""
url["$group$index"]="https://code.mpimet.mpg.de/attachments/download/20124/cdo-1.9.7.1.tar.gz"
filename["$group$index"]=cdo-1.9.7.1.tar.gz
dirname["$group$index"]=cdo-1.9.7.1
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.25 proj/$compilo/6.1.1"
	args["$group$index"]="--with-hdf5=$prefix/hdf5/$compilo/1.10.5/ --with-netcdf=$prefix/netcdf/hdf5.110/$compilo/c/4.7.3/ -with-udunits2=$prefix/udunits/$compilo/2.2.25 --with-proj=$prefix/proj/$compilo/6.1.1/"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.25 proj/$compilo/6.1.1"
	args["$group$index"]="--with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5/ --with-netcdf=$prefix/netcdf/hdf5.110/$mpilib/$compilo/c/4.7.3/ -with-udunits2=$prefix/udunits/$compilo/2.2.25 --with-proj=$prefix/proj/$compilo/6.1.1/"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tCdo ${version["$group$index"]}\"
}
 
module-whatis \"Cdo ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"


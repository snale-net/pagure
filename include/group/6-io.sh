#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#################################################################
#Group 6 : I/O librairies
group=6
groupname[$group]="I/O librairies"

#----------------------------------------------------------------
# Parallel-netcdf 1.13.0
index=1
name["$group-$index"]=parallel-netcdf
version["$group-$index"]=1.13.0
constraints["$group-$index"]='mpilib != none' # MPI-only
details["$group-$index"]=""
url["$group-$index"]=https://parallel-netcdf.github.io/Release/pnetcdf-1.13.0.tar.gz
filename["$group-$index"]=pnetcdf-1.13.0.tar.gz
dirname["$group-$index"]=pnetcdf-1.13.0
builder["$group-$index"]="configure"
dependencies["$group-$index"]="openmpi"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="--enable-shared"
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# Parallel-netcdf 1.6.1 
index=2
name["$group-$index"]=parallel-netcdf
version["$group-$index"]=1.6.1
constraints["$group-$index"]='mpilib != none' # MPI-only
details["$group-$index"]=""
url["$group-$index"]=http://cucis.ece.northwestern.edu/projects/PnetCDF/Release/parallel-netcdf-1.6.1.tar.gz
filename["$group-$index"]=parallel-netcdf-1.6.1.tar.gz
dirname["$group-$index"]=parallel-netcdf-1.6.1
builder["$group-$index"]="configure"
dependencies["$group-$index"]="openmpi"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# HDF5 1.14.6
index=3
name["$group-$index"]=hdf5
version["$group-$index"]=1.14.6
url["$group-$index"]=https://github.com/HDFGroup/hdf5/releases/download/hdf5_1.14.6/hdf5-1.14.6.tar.gz
filename["$group-$index"]=hdf5-1.14.6.tar.gz
dirname["$group-$index"]=hdf5-1.14.6
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="cmake==3.31.8 zlib==1.2.11"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="-DHDF5_BUILD_FORTRAN=ON"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
prepend-path HDF5_DIR $prefix/${dirinstall["$group-$index"]}/
"

# Variant avec mpi
index=4
declare_variant "$group" $index 3
options["$group-$index"]="+mpi"
constraints["$group-$index"]='mpilib != none' # MPI-only
details["$group-$index"]="(with parallel I/O)"
dependencies["$group-$index"]="openmpi cmake==3.31.8 zlib==1.2.11"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="-DHDF5_ENABLE_PARALLEL=ON -DHDF5_BUILD_FORTRAN=ON"
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"

# Netcdf-C 4.9.3
index=5
name["$group-$index"]=netcdf
version["$group-$index"]=4.9.3
options["$group-$index"]="+hdf5"
details["$group-$index"]="(version C)"
url["$group-$index"]="https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.9.3.tar.gz -O netcdf-c-4.9.3.tar.gz"
filename["$group-$index"]=netcdf-c-4.9.3.tar.gz
dirname["$group-$index"]=netcdf-c-4.9.3
builder["$group-$index"]="configure"
dependencies["$group-$index"]="zlib==1.2.11 hdf5==1.14.6"
dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.146/__COMPILO__/c/${version["$group-$index"]}"	
args["$group-$index"]="--disable-parallel4 CFLAGS=-I$prefix/hdf5/__COMPILO__/1.14.6/include CXXFLAGS=-I$prefix/hdf5/__COMPILO__/1.14.6/include FCFLAGS=-I$prefix/hdf5/__COMPILO__/1.14.6/include LDFLAGS=-L$prefix/hdf5/__COMPILO__/1.14.6/lib"
dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.146/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Version C ${version["$group-$index"]}

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include"

# Variant avec mpi
index=6
declare_variant "$group" $index 5
options["$group-$index"]="+hdf5+mpi"
constraints["$group-$index"]='mpilib != none' # MPI-only
dependencies["$group-$index"]="openmpi zlib==1.2.11 hdf5==1.14.6+mpi parallel-netcdf==1.13.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.146/__MPI_LIB__/__COMPILO__/c/${version["$group-$index"]}"
args["$group-$index"]="--enable-pnetcdf CFLAGS=-I$prefix/hdf5/__MPI_LIB__/__COMPILO__/1.14.6/include CXXFLAGS=-I$prefix/hdf5/__MPI_LIB__/__COMPILO__/1.14.6/include FCFLAGS=-I$prefix/hdf5/__MPI_LIB__/__COMPILO__/1.14.6/include LDFLAGS=-L$prefix/hdf5/__MPI_LIB__/__COMPILO__/1.14.6/lib"
dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.146/__MPI_LIB__/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"

# Netcdf-Fortran 4.5.3
index=7
name["$group-$index"]=netcdf
version["$group-$index"]=4.5.3
options["$group-$index"]="+fortran+hdf5"
details["$group-$index"]="(version Fortran)"
url["$group-$index"]="https://github.com/Unidata/netcdf-fortran/archive/refs/tags/v4.5.3.tar.gz -O netcdf-fortran-4.5.3.tar.gz"
filename["$group-$index"]=netcdf-fortran-4.5.3.tar.gz
dirname["$group-$index"]=netcdf-fortran-4.5.3
builder["$group-$index"]="configure"
dependencies["$group-$index"]="zlib==1.2.11 hdf5==1.14.6 netcdf==4.9.3"
dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.146/__COMPILO__/fortran/${version["$group-$index"]}"	
args["$group-$index"]="LDFLAGS=\"-L$prefix/netcdf/hdf5.146/__COMPILO__/c/4.9.3/lib\""
dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.146/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Version Fortran ${version["$group-$index"]}

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include"

# Variant avec mpi
index=8
declare_variant "$group" $index 7
options["$group-$index"]="+fortran+hdf5+mpi"
constraints["$group-$index"]='mpilib != none' # MPI-only
dependencies["$group-$index"]="openmpi zlib==1.2.11 hdf5==1.14.6+mpi parallel-netcdf==1.13.0 netcdf==4.9.3+hdf5+mpi"
dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.146/__MPI_LIB__/__COMPILO__/fortran/${version["$group-$index"]}"
args["$group-$index"]="LDFLAGS=\"-L$prefix/netcdf/hdf5.146/__MPI_LIB__/__COMPILO__/c/4.9.3/lib\""
dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.146/__MPI_LIB__/__COMPILO__"


#------------------------------------------------------------------
# NetCDF C 4.4.1.1
# 
# compiled with HDF 1.14.6
index=9
name["$group-$index"]=netcdf
version["$group-$index"]=4.4.1.1
constraints["$group-$index"]='mpilib != none' # MPI-only
options["$group-$index"]="+hdf5+mpi"
details["$group-$index"]="(version C)"
url["$group-$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz
filename["$group-$index"]=netcdf-4.4.1.1.tar.gz
dirname["$group-$index"]=netcdf-4.4.1.1
builder["$group-$index"]="configure"
dependencies["$group-$index"]="openmpi zlib==1.2.11 hdf5==1.14.6+mpi"
dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.146/__MPI_LIB__/__COMPILO__/c/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.146/__MPI_LIB__/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Version C ${version["$group-$index"]}

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include"

#--------------------------------------------------------------
# NetCDF Fortran 4.4.4
#
# compiled with HDF 1.14.6
index=10
name["$group-$index"]=netcdf
options["$group-$index"]="+fortran+hdf5+mpi"
version["$group-$index"]=4.4.4
constraints["$group-$index"]='mpilib != none' # MPI-only
details["$group-$index"]="(version Fortran - need Netcdf-C 4.4.1.1 and HDF 1.14.6)"
url["$group-$index"]="https://github.com/Unidata/netcdf-fortran/archive/refs/tags/v4.4.4.tar.gz -O netcdf-fortran-4.4.4.tar.gz"
filename["$group-$index"]=netcdf-fortran-4.4.4.tar.gz
dirname["$group-$index"]=netcdf-fortran-4.4.4
builder["$group-$index"]="configure"
dependencies["$group-$index"]="openmpi zlib==1.2.11 hdf5==1.14.6+mpi netcdf==4.4.1.1+hdf5+mpi"
dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.146/__MPI_LIB__/__COMPILO__/fortran/${version["$group-$index"]}"
args["$group-$index"]="F77=mpif90 FC=mpif90"
dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.146/__MPI_LIB__/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Version Fortran ${version["$group-$index"]}

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include"


# Udunits 2.2.28
index=11
name["$group-$index"]=udunits
version["$group-$index"]=2.2.28
details["$group-$index"]="(needed by netcdf4-python / Ncview / VTK)"
url["$group-$index"]=https://mirror.snale.net/udunits-2.2.28.tar.gz
filename["$group-$index"]=udunits-2.2.28.tar.gz
dirname["$group-$index"]=udunits-2.2.28
builder["$group-$index"]="configure"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

#--------------------------------------------------------------
# NetCDF Python

# netcdf4-python 1.6.4
index=12
name["$group-$index"]=netCDF4
version["$group-$index"]=1.6.4
constraints["$group-$index"]='pythonInterpreter != none && mpilib == none'
details["$group-$index"]="(version Python)"
url["$group-$index"]="https://github.com/Unidata/netcdf4-python/archive/refs/tags/v1.6.4rel.tar.gz -O netcdf4-python-1.6.4.tar.gz"
filename["$group-$index"]=netcdf4-python-1.6.4.tar.gz
dirname["$group-$index"]=netcdf4-python-1.6.4rel
builder["$group-$index"]="python"
args["$group-$index-intel"]="LDSHARED=\"icc -shared\""
args["$group-$index-intelmpi"]="CPP=\"mpiicc -E\" CC=mpiicc MPICC=mpiicc F77=ifort FC=mpiifort LDSHARED=\"mpiicc -shared\""
dependencies["$group-$index"]="zlib/__COMPILO__/1.2.11 hdf5/__COMPILO__/1.14.6 netcdf-c/hdf5.146/__COMPILO__/4.9.3 udunits/__COMPILO__/2.2.28 python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__"
dirinstall["$group-$index"]="python-modules/__COMPILO__"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tPython MPI librairies\"
}
 
module-whatis \"Python MPI librairies\"

prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path PYTHONPATH $prefix/${dirinstall["$group-$index"]}/lib/$pythonInterpreter/site-packages
setenv PYTHONUSERBASE $prefix/${dirinstall["$group-$index"]}
"

# netCDF4 1.2.9
index=13
name["$group-$index"]=netCDF4
version["$group-$index"]=1.2.9
constraints["$group-$index"]='mpilib == none' # no MPI
details["$group-$index"]="(version Python - need NetCDF C 4.4.1.1)"
url["$group-$index"]=https://pypi.python.org/packages/6a/37/49fd7cc21af0fb173e40de5e15f7fdd48d521429922a90347219c77b0c36/netCDF4-1.2.9.tar.gz#md5=e320491d52c42e937e6df47b56a2579c
filename["$group-$index"]=netCDF4-1.2.9.tar.gz
dirname["$group-$index"]=netCDF4-1.2.9
configfile["$group-$index"]="# Rename this file to setup.cfg to set build options.
# Follow instructions below for editing.
[options]
use_ncconfig=True
use_cython=True
[directories]
netCDF4_dir = $prefix/netcdf/hdf5.146/__COMPILO__/c/4.4.1.1/
HDF5_dir = $prefix/hdf5/__COMPILO__/1.14.6/
HDF5_libdir = $prefix/hdf5/__COMPILO__/1.14.6/lib
HDF5_incdir = $prefix/hdf5/__COMPILO__/1.14.6/include
szip_libdir = $prefix/zlib/__COMPILO__/1.2.11/lib
"
configfilename["$group-$index"]="setup.cfg"
patch_01["$group-$index"]="--- setup.py	2017-06-18 22:38:30.000000000 +0200
+++ ../setup_fixed.py	2017-09-12 18:46:19.821782818 +0200
@@ -271,11 +271,7 @@
     else:
         if HDF5_incdir is None:
             HDF5_incdir = os.path.join(HDF5_dir, 'include')
-        hdf5_version = check_hdf5version(HDF5_incdir)
-        if hdf5_version is None:
-            raise ValueError('did not find HDF5 headers in %s' % HDF5_incdir)
-        elif hdf5_version[1:6] < '1.8.0':
-            raise ValueError('HDF5 version >= 1.8.0 is required')
+        hdf5_version = check_hdf5version(HDF5_incdir)       
 
     if netCDF4_incdir is None and netCDF4_dir is None:
         sys.stdout.write( \"\"\"
@@ -314,6 +310,7 @@
     if HDF5_libdir is not None: lib_dirs.append(HDF5_libdir)
     if netCDF4_incdir is not None: inc_dirs = [netCDF4_incdir]
     if HDF5_incdir is not None: inc_dirs.append(HDF5_incdir)
+    lib_dirs.append(szip_libdir)
 
     # add szip to link if desired.
     if szip_libdir is None and szip_dir is not None:
"
patchfile_01["$group-$index"]="setup.py"
builder["$group-$index"]="python"
dependencies["$group-$index"]="python zlib==1.2.11 hdf5==1.14.6 netcdf==4.4.1.1+hdf5 udunits==2.2.28"
dirinstall["$group-$index"]="python-modules/__COMPILO__"

# ecbuild 2021.05.0
index=14
name["$group-$index"]=ecbuild
version["$group-$index"]=2021.05.0
details["$group-$index"]="(Needed by Eccodes)"
url["$group-$index"]="https://github.com/ecmwf/ecbuild/archive/refs/tags/2021.05.0.tar.gz -O ecbuild-2021.05.0.tar.gz"
filename["$group-$index"]=ecbuild-2021.05.0.tar.gz
dirname["$group-$index"]=ecbuild-2021.05.0
builder["$group-$index"]="ecbuild"
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

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path ecbuild_DIR $prefix/${dirinstall["$group-$index"]}/cmake
"

# eccodes 2.22.1
index=15
name["$group-$index"]=eccodes
version["$group-$index"]=2.22.1
constraints["$group-$index"]='pythonInterpreter != none && mpilib != none' # MPI-only'
details["$group-$index"]="(Grib file)"
url["$group-$index"]="https://github.com/ecmwf/eccodes/archive/refs/tags/2.22.1.tar.gz -O eccodes-2.22.1.tar.gz"
filename["$group-$index"]=eccodes-2.22.1.tar.gz
dirname["$group-$index"]=eccodes-2.22.1
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="openmpi cmake==3.31.8 zlib==1.2.11 hdf5==1.14.6+mpi netcdf==4.9.3+hdf5+mpi netcdf==4.5.3+fortran+hdf5+mpi jasper/==2.0.26 ecbuild==2021.05.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="-DNETCDF_PATH=$prefix/netcdf/hdf5.146/__MPI_LIB__/__COMPILO__/c/4.9.3"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
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
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
"

#--------------------------------------------------------------
# GRIB Python

# cfgrib 0.9.7.7
index=16
name["$group-$index"]=cfgrib
version["$group-$index"]=0.9.7.7
constraints["$group-$index"]='pythonInterpreter != none && pythonVersion > 3.3'
details["$group-$index"]="(version Python - need ecCodes 2.22.1)"
url["$group-$index"]="https://github.com/ecmwf/cfgrib/archive/0.9.7.7.tar.gz -O cfgrib-0.9.7.7.tar.gz"
filename["$group-$index"]=cfgrib-0.9.7.7.tar.gz
dirname["$group-$index"]=cfgrib-0.9.7.7
builder["$group-$index"]="python"
dependencies["$group-$index"]="python eccodes==2.22.1"
dirinstall["$group-$index"]="python-modules/__COMPILO__"

# HDF5 1.8.21
index=17
name["$group-$index"]=hdf5
version["$group-$index"]=1.8.21
details["$group-$index"]=""
url["$group-$index"]=https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-1.8.21/src/hdf5-1.8.21.tar.gz
filename["$group-$index"]=hdf5-1.8.21.tar.gz
dirname["$group-$index"]=hdf5-1.8.21
builder["$group-$index"]="configure"
dependencies["$group-$index"]="zlib==1.2.11"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="--enable-fortran --enable-cxx"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
prepend-path HDF5_DIR $prefix/${dirinstall["$group-$index"]}/
"

# HDF5 1.12.1
index=18
name["$group-$index"]=hdf5
version["$group-$index"]=1.12.1
options["$group-$index"]="+mpi"
constraints["$group-$index"]='mpi == openmpi' # MPI-only
details["$group-$index"]="(with parallel I/O)"
url["$group-$index"]=https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.1/src/hdf5-1.12.1.tar.gz
filename["$group-$index"]=hdf5-1.12.1.tar.gz
dirname["$group-$index"]=hdf5-1.12.1
builder["$group-$index"]="configure"
dependencies["$group-$index"]="openmpi==3.1.6 zlib==1.2.11"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="CC=mpicc FC=mpif90 CXX=mpicxx --enable-parallel --with-zlib --enable-fortran"
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
modulefilename["$group-$index"]="${version["$group-$index"]}"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
prepend-path HDF5_DIR $prefix/${dirinstall["$group-$index"]}/
"




#!/bin/bash

#################################################################
#Group 3 : I/O librairies
group=3
groupname[$group]="I/O librairies"

#----------------------------------------------------------------
# Parallel-netcdf 1.12.1
index=1
name["$group$index"]=parallel-netcdf
version["$group$index"]=1.12.1
details["$group$index"]=""
url["$group$index"]=https://parallel-netcdf.github.io/Release/pnetcdf-1.12.1.tar.gz
filename["$group$index"]=pnetcdf-1.12.1.tar.gz
dirname["$group$index"]=pnetcdf-1.12.1
builder["$group$index"]="configure"
dependencies["$group$index"]="$mpi_dep"
dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#args["$group$index"]="--enable-shared"
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tParallel NetCDF ${version["$group$index"]}\"
}
 
module-whatis \"Parallel NetCDF ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

if [ "$showOldVersion" = "1" ]; then

#-----------------------------------------------------------------
# Parallel-netcdf 1.6.1 
# 
# compiled with OpenMPI 1.10.7
index=2
name["$group$index"]=parallel-netcdf
version["$group$index"]=1.6.1
details["$group$index"]=""
url["$group$index"]=http://cucis.ece.northwestern.edu/projects/PnetCDF/Release/parallel-netcdf-1.6.1.tar.gz
filename["$group$index"]=parallel-netcdf-1.6.1.tar.gz
dirname["$group$index"]=parallel-netcdf-1.6.1
builder["$group$index"]="configure"
dependencies["$group$index"]="$mpi_dep"
dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tParallel NetCDF ${version["$group$index"]}\"
}
 
module-whatis \"Parallel NetCDF ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

fi # end-old-version

#---------------------------------------------------------
# HDF5 1.10.5 en Parallel I/O 
index=3
name["$group$index"]=hdf5
version["$group$index"]=1.10.5
details["$group$index"]=""
url["$group$index"]=https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.5.tar.gz
filename["$group$index"]=hdf5-1.10.5.tar.gz
dirname["$group$index"]=hdf5-1.10.5
builder["$group$index"]="configure"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11"
dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
if [ "$mpilib" = "intel2017" ] ; then
	args["$group$index"]="--enable-parallel CC=mpiicc CXX=mpiicpc F77=mpiifort FC=mpiifort"
elif [ "$mpilib" = "openmpi*" ] ; then
	args["$group$index"]="--enable-parallel CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"
else
	args["$group$index"]="--enable-parallel"
fi
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tHDF5 ${version["$group$index"]}\"
}
 
module-whatis \"HDF5 ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
prepend-path HDF5_DIR $prefix/${dirinstall["$group$index"]}/
"

#------------------------------------------------------------------
# NetCDF C 4.7.3
# 
# compiled with HDF 1.10.5
index=4
name["$group$index"]=netcdf
version["$group$index"]=4.7.3
details["$group$index"]="(version C compiled with HDF 1.10.5"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-c-4.7.3.tar.gz
filename["$group$index"]=netcdf-c-4.7.3.tar.gz
dirname["$group$index"]=netcdf-c-4.7.3
builder["$group$index"]="configure"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}"
args["$group$index"]="--enable-pnetcdf --with-pnetcdf=$prefix/parallel-netcdf/$mpilib/$compilo/1.12.1/lib"
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNetCDF C ${version["$group$index"]} & NetCDF Fortran - 4.5.2\"
}
 
module-whatis \"NetCDF C - ${version["$group$index"]} & NetCDF Fortran - 4.5.2\"

# Version C ${version["$group$index"]}
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}/include 

#Version Fortran 4.5.2
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.5.2/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.5.2/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.5.2/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.5.2/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.5.2/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.5.2/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.5.2/include "

#--------------------------------------------------------------
# NetCDF Fortran 4.5.2
#
# compiled with HDF 1.10.5
index=5
name["$group$index"]=netcdf
version["$group$index"]=4.5.2
details["$group$index"]="(version Fortran compiled with HDF 1.10.5"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.5.2.tar.gz
filename["$group$index"]=netcdf-fortran-4.5.2.tar.gz
dirname["$group$index"]=netcdf-fortran-4.5.2
builder["$group$index"]="configure"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf/hdf5.110/$mpilib/$compilo/4.7.3"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group$index"]}"
if [ "$mpilib" == *"mpich"* ]; then
	args["$group$index"]="--enable-pnetcdf --with-pnetcdf=$prefix/parallel-netcdf/$mpilib/$compilo/1.12.1/lib F77=mpif90 FC=mpif90"
elif [ "$mpilib" == *"intel"* ]; then
	args["$group$index"]="--enable-pnetcdf --with-pnetcdf=$prefix/parallel-netcdf/$mpilib/$compilo/1.12.1/lib F77=mpiifort FC=mpiifort"
else
	#openmpi
	args["$group$index"]="--enable-pnetcdf --with-pnetcdf=$prefix/parallel-netcdf/$mpilib/$compilo/1.12.1/lib F77=mpif90 FC=mpif90"
fi
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo"
#modulefile["$group$index"]=""

if [ "$showOldVersion" = "1" ]; then

#--------------------------------------------------------------
# NetCDF C 4.4.1.1
# 
# compiled with HDF 1.10.5
index=6
name["$group$index"]=netcdf
version["$group$index"]=4.4.1.1
details["$group$index"]="(version C compiled with HDF 1.10.5)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz
filename["$group$index"]=netcdf-4.4.1.1.tar.gz
dirname["$group$index"]=netcdf-4.4.1.1
builder["$group$index"]="configure"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.6.1"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}"
args["$group$index"]="--enable-pnetcdf"
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNetCDF C 4.4.1.1 & NetCDF Fortran - 4.4.4\"
}
 
module-whatis \"NetCDF C - 4.4.1.1 & NetCDF Fortran - 4.4.4\"

# Version C 4.4.1.1
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/4.4.1.1/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/4.4.1.1/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/4.4.1.1/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/4.4.1.1/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/4.4.1.1/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/4.4.1.1/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/4.4.1.1/include 

#Version Fortran 4.4.4
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.4.4/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.4.4/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.4.4/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.4.4/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.4.4/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.4.4/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/4.4.4/include 
"

#-----------------------------------------------------------
# NetCDF Fortran 4.4.4
#
# compiled with HDF 1.10.5
index=7
name["$group$index"]=netcdf
version["$group$index"]=4.4.4
details["$group$index"]="(version Fortran compiled with HDF 1.10.5)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.4.tar.gz
filename["$group$index"]=netcdf-fortran-4.4.4.tar.gz
dirname["$group$index"]=netcdf-fortran-4.4.4
builder["$group$index"]="configure"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.6.1 netcdf/hdf5.110/$mpilib/$compilo/4.4.1.1"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo"
#modulefile["$group$index"]=""

fi # end-old-version




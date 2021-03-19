#!/bin/bash

#################################################################
#Group 6 : I/O librairies
group=6
groupname[$group]="I/O librairies"

if [ "$mpilib" != "none" ]; then # MPI-only

#----------------------------------------------------------------
# Parallel-netcdf 1.12.1
index=1
name["$group-$index"]=parallel-netcdf
version["$group-$index"]=1.12.1
details["$group-$index"]=""
url["$group-$index"]=https://parallel-netcdf.github.io/Release/pnetcdf-1.12.1.tar.gz
filename["$group-$index"]=pnetcdf-1.12.1.tar.gz
dirname["$group-$index"]=pnetcdf-1.12.1
builder["$group-$index"]="configure"
dependencies["$group-$index"]="$mpi_dep"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
if [[ $mpilib == mpich* ]] ; then
	args["$group-$index"]="--enable-shared CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"
else
	args["$group-$index"]="--enable-shared"
fi
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load ${dependencies["$group-$index"]}

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

if [ "$showOldVersion" = "1" ]; then # old-version

#-----------------------------------------------------------------
# Parallel-netcdf 1.6.1 
# 
# compiled with OpenMPI 1.10.7
index=2
name["$group-$index"]=parallel-netcdf
version["$group-$index"]=1.6.1
details["$group-$index"]=""
url["$group-$index"]=http://cucis.ece.northwestern.edu/projects/PnetCDF/Release/parallel-netcdf-1.6.1.tar.gz
filename["$group-$index"]=parallel-netcdf-1.6.1.tar.gz
dirname["$group-$index"]=parallel-netcdf-1.6.1
builder["$group-$index"]="configure"
dependencies["$group-$index"]="$mpi_dep"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load ${dependencies["$group-$index"]}

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

fi # old-version
fi # MPI-only

#---------------------------------------------------------
# HDF5 1.10.5
index=3
name["$group-$index"]=hdf5
version["$group-$index"]=1.10.5
if [ "$mpilib" == "none" ]; then
	details["$group-$index"]=""
else
	details["$group-$index"]="(with parallel I/O)"
fi
url["$group-$index"]=https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.5.tar.gz
filename["$group-$index"]=hdf5-1.10.5.tar.gz
dirname["$group-$index"]=hdf5-1.10.5
builder["$group-$index"]="configure"
if [[ $mpilib == intel* ]] ; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11"
	dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
	args["$group-$index"]="--enable-parallel CC=mpiicc CXX=mpiicpc F77=mpiifort FC=mpiifort"
	dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
elif [[ $mpilib == mpich* ]] ; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11"
	dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
	args["$group-$index"]="--enable-parallel CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"
	dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
elif [[ $mpilib == openmpi* ]] ; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11"
	dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
	args["$group-$index"]="--enable-parallel CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"
	dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
else
	dependencies["$group-$index"]="zlib/$compilo/1.2.11"
	dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
	args["$group-$index"]=""
	dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
fi
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load ${dependencies["$group-$index"]}

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
prepend-path HDF5_DIR $prefix/${dirinstall["$group-$index"]}/
"

#------------------------------------------------------------------
# NetCDF C 4.7.3
# 
# compiled with HDF 1.10.5
index=4
name["$group-$index"]=netcdf
version["$group-$index"]=4.7.3
if [ "$mpilib" == "none" ]; then
	details["$group-$index"]="(version C - required HDF 1.10.5)"
else
	details["$group-$index"]="(version C - required HDF 1.10.5 and Parallel-Netcdf 1.12.1)"
fi
url["$group-$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-c-4.7.3.tar.gz
filename["$group-$index"]=netcdf-c-4.7.3.tar.gz
dirname["$group-$index"]=netcdf-c-4.7.3
builder["$group-$index"]="configure"
if [[ $mpilib == openmpi* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group-$index"]}"
	args["$group-$index"]="--enable-pnetcdf --with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 F77=mpif90 FC=mpif90 LDFLAGS=-L$prefix/hdf5/$mpilib/$compilo/1.10.5/lib"
	dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == mpich* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group-$index"]}"
	args["$group-$index"]="--enable-pnetcdf --with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 F77=mpif90 FC=mpif90 LDFLAGS=-L$prefix/hdf5/$mpilib/$compilo/1.10.5/lib"
	dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == intel* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group-$index"]}"
	args["$group-$index"]="--enable-pnetcdf --with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 F77=mpiifort FC=mpiifort LDFLAGS=-L$prefix/hdf5/$mpilib/$compilo/1.10.5/lib"
	dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.110/$mpilib/$compilo"
else
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$compilo/c/${version["$group-$index"]}"	
	args["$group-$index"]="--disable-parallel4 --with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 LDFLAGS=-L$prefix/hdf5/$mpilib/$compilo/1.10.5/lib"
	dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.110/$compilo"
fi
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Version C ${version["$group-$index"]}

# Dependencies
module load ${dependencies["$group-$index"]}

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include"

#--------------------------------------------------------------
# NetCDF Fortran 4.5.2
#
# compiled with HDF 1.10.5
index=5
name["$group-$index"]=netcdf
version["$group-$index"]=4.5.2
if [ "$mpilib" == "none" ]; then
	details["$group-$index"]="(version Fortran - required Netcdf-C 4.7.3 and HDF 1.10.5)"
else
	details["$group-$index"]="(version Fortran - required Netcdf-C 4.7.3, HDF 1.10.5 and Parallel-Netcdf 1.12.1)"
fi
url["$group-$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.5.2.tar.gz
filename["$group-$index"]=netcdf-fortran-4.5.2.tar.gz
dirname["$group-$index"]=netcdf-fortran-4.5.2
builder["$group-$index"]="configure"
if [[ $mpilib == openmpi* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group-$index"]}"
	args["$group-$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == mpich* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group-$index"]}"
	args["$group-$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == intel* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group-$index"]}"
	args["$group-$index"]="F77=mpiifort FC=mpiifort"
	dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.110/$mpilib/$compilo"
else
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$compilo/fortran/${version["$group-$index"]}"	
	args["$group-$index"]=""
	dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.110/$compilo"
fi
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Version Fortran ${version["$group-$index"]}

# Dependencies
module load ${dependencies["$group-$index"]}

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include"

if [ "$showOldVersion" = "1" ]; then # old-version

#------------------------------------------------------------------
# NetCDF C 4.4.1.1
# 
# compiled with HDF 1.10.5
index=6
name["$group-$index"]=netcdf
version["$group-$index"]=4.4.1.1
if [ "$mpilib" == "none" ]; then
	details["$group-$index"]="(version C - required HDF 1.10.5)"
else
	details["$group-$index"]="(version C - required HDF 1.10.5)"
fi
url["$group-$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz
filename["$group-$index"]=netcdf-4.4.1.1.tar.gz
dirname["$group-$index"]=netcdf-4.4.1.1
builder["$group-$index"]="configure"
if [[ $mpilib == openmpi* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group-$index"]}"
	args["$group-$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == mpich* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group-$index"]}"
	args["$group-$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == intel* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group-$index"]}"
	args["$group-$index"]="F77=mpiifort FC=mpiifort"
	dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.110/$mpilib/$compilo"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$compilo/c/${version["$group-$index"]}"	
	args["$group-$index"]=""
	dirmodule["$group-$index"]="${name["$group-$index"]}-c/hdf5.110/$compilo"
fi
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Version C ${version["$group-$index"]}

# Dependencies
module load ${dependencies["$group-$index"]}

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include"

#--------------------------------------------------------------
# NetCDF Fortran 4.4.4
#
# compiled with HDF 1.10.5
index=7
name["$group-$index"]=netcdf
version["$group-$index"]=4.4.4
if [ "$mpilib" == "none" ]; then
	details["$group-$index"]="(version Fortran - required Netcdf-C 4.4.1.1 and HDF 1.10.5)"
else
	details["$group-$index"]="(version Fortran - required Netcdf-C 4.4.1.1, HDF 1.10.5)"
fi
url["$group-$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.4.tar.gz
filename["$group-$index"]=netcdf-fortran-4.4.4.tar.gz
dirname["$group-$index"]=netcdf-fortran-4.4.4
builder["$group-$index"]="configure"
if [[ $mpilib == openmpi* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.4.1.1"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group-$index"]}"
	args["$group-$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == mpich* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.4.1.1"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group-$index"]}"
	args["$group-$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == intel* ]]; then
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.4.1.1"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group-$index"]}"
	args["$group-$index"]="F77=mpiifort FC=mpiifort"
	dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.110/$mpilib/$compilo"
else
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.4.1.1"
	dirinstall["$group-$index"]="${name["$group-$index"]}/hdf5.110/$compilo/fortran/${version["$group-$index"]}"	
	args["$group-$index"]=""
	dirmodule["$group-$index"]="${name["$group-$index"]}-fortran/hdf5.110/$compilo"
fi
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Version Fortran ${version["$group-$index"]}

# Dependencies
module load ${dependencies["$group-$index"]}

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include"

fi # old-version

#--------------------------------------------------------------
# NetCDF Python
if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# netcdf4-python 1.5.3
index=8
name["$group-$index"]=netcdf4-python
version["$group-$index"]=1.5.3
if [ "$mpilib" == "none" ]; then 
	details["$group-$index"]="(version Python - require HDF5 1.10.5 / NetCDF C 7.4.3 / Cython 0.29.17 / cftime 1.0.4.2 / udunits 2.2.28 )"
else
	details["$group-$index"]="(version Python - require HDF5 1.10.5 / NetCDF C 7.4.3 / Pnetcdf 1.12.1 / Cython 0.29.17 / cftime 1.0.4.2 / udunits 2.2.28)"
fi
url["$group-$index"]="https://github.com/Unidata/netcdf4-python/archive/v1.5.3rel.tar.gz -O netcdf4-python-1.5.3.tar.gz"
filename["$group-$index"]=netcdf4-python-1.5.3.tar.gz
dirname["$group-$index"]=netcdf4-python-1.5.3rel
builder["$group-$index"]="python"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.28 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
	dirinstall["$group-$index"]="python-modules/$compilo"
	#dirmodule["$group-$index"]=""
	#modulefile["$group-$index"]=""
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.28 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} python-modules/$mpilib/$compilo/${pythonVersion}"
	dirinstall["$group-$index"]="python-modules/$mpilib/$compilo"
	dirmodule["$group-$index"]="python-modules/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tPython MPI librairies\"
}
 
module-whatis \"Python MPI librairies\"

prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path PYTHONPATH $prefix/${dirinstall["$group-$index"]}/lib/$pythonInterpreter/site-packages
"
fi
args["$group-$index"]=""

if [ "$showOldVersion" = "1" ] && [ "$mpilib" == "none" ]; then

# netCDF4 1.2.9
index=9
name["$group-$index"]=netCDF4
version["$group-$index"]=1.2.9
details["$group-$index"]="(version Python - require NetCDF C 4.4.1.1)"
url["$group-$index"]=https://pypi.python.org/packages/6a/37/49fd7cc21af0fb173e40de5e15f7fdd48d521429922a90347219c77b0c36/netCDF4-1.2.9.tar.gz#md5=e320491d52c42e937e6df47b56a2579c
filename["$group-$index"]=netCDF4-1.2.9.tar.gz
dirname["$group-$index"]=netCDF4-1.2.9
configfile["$group-$index"]="# Rename this file to setup.cfg to set build options.
# Follow instructions below for editing.
[options]
use_ncconfig=True
use_cython=True
[directories]
netCDF4_dir = $prefix/netcdf/hdf5.110/$compilo/c/4.4.1.1/
HDF5_dir = $prefix/hdf5/$compilo/1.10.5/
HDF5_libdir = $prefix/hdf5/$compilo/1.10.5/lib
HDF5_incdir = $prefix/hdf5/$compilo/1.10.5/include
szip_libdir = $prefix/zlib/$compilo/1.2.11/lib
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
dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.4.1.1 udunits/$compilo/2.2.28 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi # end-old-version && no MPI
fi  # end-only-if-Python

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python (Jasper need)

# eccodes 2.16.0
index=10
name["$group-$index"]=eccodes
version["$group-$index"]=2.16.0
details["$group-$index"]="(Grib file)"
url["$group-$index"]=https://confluence.ecmwf.int/download/attachments/45757960/eccodes-2.16.0-Source.tar.gz
filename["$group-$index"]=eccodes-2.16.0-Source.tar.gz
dirname["$group-$index"]=eccodes-2.16.0-Source
builder["$group-$index"]="cmake"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 netcdf-fortran/hdf5.110/$compilo/4.5.2 jasper/$compilo/2.0.26"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 netcdf-fortran/hdf5.110/$mpilib/$compilo/4.5.2 jasper/$compilo/2.0.26"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-DNETCDF_PATH=$prefix/netcdf/hdf5.110/$mpilib/$compilo/c/4.7.3"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load ${dependencies["$group-$index"]}

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
"
fi  # end-only-if-Python

#--------------------------------------------------------------
# GRIB Python
if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# cfgrib 0.9.7.7
index=11
name["$group-$index"]=cfgrib
version["$group-$index"]=0.9.7.7
details["$group-$index"]="(version Python - require ecCodes 2.16.0)"
url["$group-$index"]="https://github.com/ecmwf/cfgrib/archive/0.9.7.7.tar.gz -O cfgrib-0.9.7.7.tar.gz"
filename["$group-$index"]=cfgrib-0.9.7.7.tar.gz
dirname["$group-$index"]=cfgrib-0.9.7.7
builder["$group-$index"]="python"
dependencies["$group-$index"]="eccodes/$compilo/2.16.0 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python




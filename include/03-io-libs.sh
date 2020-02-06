#!/bin/bash

#################################################################
#Group 3 : I/O librairies
group=3
groupname[$group]="I/O librairies"

if [ "$mpilib" != "none" ]; then # MPI-only

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
args["$group$index"]="--enable-shared"
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

if [ "$showOldVersion" = "1" ]; then # old-version

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

fi # old-version
fi # MPI-only

#---------------------------------------------------------
# HDF5 1.10.5
index=3
name["$group$index"]=hdf5
version["$group$index"]=1.10.5
if [ "$mpilib" == "none" ]; then
	details["$group$index"]=""
else
	details["$group$index"]="(with parallel I/O)"
fi
url["$group$index"]=https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.5.tar.gz
filename["$group$index"]=hdf5-1.10.5.tar.gz
dirname["$group$index"]=hdf5-1.10.5
builder["$group$index"]="configure"
if [[ $mpilib == intel* ]] ; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11"
	dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
	args["$group$index"]="--enable-parallel CC=mpiicc CXX=mpiicpc F77=mpiifort FC=mpiifort"
	dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
elif [[ $mpilib == openmpi* ]] ; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11"
	dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
	args["$group$index"]="--enable-parallel CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"
	dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
else
	dependencies["$group$index"]="zlib/$compilo/1.2.11"
	dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
	args["$group$index"]=""
	dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
fi
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
if [ "$mpilib" == "none" ]; then
	details["$group$index"]="(version C - required HDF 1.10.5)"
else
	details["$group$index"]="(version C - required HDF 1.10.5 and Parallel-Netcdf 1.12.1)"
fi
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-c-4.7.3.tar.gz
filename["$group$index"]=netcdf-c-4.7.3.tar.gz
dirname["$group$index"]=netcdf-c-4.7.3
builder["$group$index"]="configure"
if [[ $mpilib == openmpi* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}"
	args["$group$index"]="--enable-pnetcdf F77=mpif90 FC=mpif90"
	dirmodule["$group$index"]="${name["$group$index"]}-c/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == mpich* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}"
	args["$group$index"]="--enable-pnetcdf F77=mpif90 FC=mpif90"
	dirmodule["$group$index"]="${name["$group$index"]}-c/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == intel* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}"
	args["$group$index"]="--enable-pnetcdf F77=mpiifort FC=mpiifort"
	dirmodule["$group$index"]="${name["$group$index"]}-c/hdf5.110/$mpilib/$compilo"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$compilo/c/${version["$group$index"]}"	
	args["$group$index"]=""
	dirmodule["$group$index"]="${name["$group$index"]}-c/hdf5.110/$compilo"
fi
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNetCDF C ${version["$group$index"]}\"
}
 
module-whatis \"NetCDF C - ${version["$group$index"]}\"

# Version C ${version["$group$index"]}
prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include"

#--------------------------------------------------------------
# NetCDF Fortran 4.5.2
#
# compiled with HDF 1.10.5
index=5
name["$group$index"]=netcdf
version["$group$index"]=4.5.2
if [ "$mpilib" == "none" ]; then
	details["$group$index"]="(version Fortran - required Netcdf-C 4.7.3 and HDF 1.10.5)"
else
	details["$group$index"]="(version Fortran - required Netcdf-C 4.7.3, HDF 1.10.5 and Parallel-Netcdf 1.12.1)"
fi
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.5.2.tar.gz
filename["$group$index"]=netcdf-fortran-4.5.2.tar.gz
dirname["$group$index"]=netcdf-fortran-4.5.2
builder["$group$index"]="configure"
if [[ $mpilib == openmpi* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group$index"]}"
	args["$group$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group$index"]="${name["$group$index"]}-fortran/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == mpich* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group$index"]}"
	args["$group$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group$index"]="${name["$group$index"]}-fortran/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == intel* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group$index"]}"
	args["$group$index"]="F77=mpiifort FC=mpiifort"
	dirmodule["$group$index"]="${name["$group$index"]}-fortran/hdf5.110/$mpilib/$compilo"
else
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$compilo/fortran/${version["$group$index"]}"	
	args["$group$index"]=""
	dirmodule["$group$index"]="${name["$group$index"]}-fortran/hdf5.110/$compilo"
fi
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNetCDF Fortran ${version["$group$index"]}\"
}
 
module-whatis \"NetCDF Fortran - ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include"

if [ "$showOldVersion" = "1" ]; then # old-version

#------------------------------------------------------------------
# NetCDF C 4.4.1.1
# 
# compiled with HDF 1.10.5
index=6
name["$group$index"]=netcdf
version["$group$index"]=4.4.1.1
if [ "$mpilib" == "none" ]; then
	details["$group$index"]="(version C - required HDF 1.10.5)"
else
	details["$group$index"]="(version C - required HDF 1.10.5)"
fi
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz
filename["$group$index"]=netcdf-4.4.1.1.tar.gz
dirname["$group$index"]=netcdf-4.4.1.1
builder["$group$index"]="configure"
if [[ $mpilib == openmpi* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}"
	args["$group$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group$index"]="${name["$group$index"]}-c/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == mpich* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}"
	args["$group$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group$index"]="${name["$group$index"]}-c/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == intel* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/c/${version["$group$index"]}"
	args["$group$index"]="F77=mpiifort FC=mpiifort"
	dirmodule["$group$index"]="${name["$group$index"]}-c/hdf5.110/$mpilib/$compilo"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$compilo/c/${version["$group$index"]}"	
	args["$group$index"]=""
	dirmodule["$group$index"]="${name["$group$index"]}-c/hdf5.110/$compilo"
fi
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNetCDF C ${version["$group$index"]}\"
}
 
module-whatis \"NetCDF C - ${version["$group$index"]}\"

# Version C ${version["$group$index"]}
prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include"

#--------------------------------------------------------------
# NetCDF Fortran 4.4.4
#
# compiled with HDF 1.10.5
index=7
name["$group$index"]=netcdf
version["$group$index"]=4.4.4
if [ "$mpilib" == "none" ]; then
	details["$group$index"]="(version Fortran - required Netcdf-C 4.4.1.1 and HDF 1.10.5)"
else
	details["$group$index"]="(version Fortran - required Netcdf-C 4.4.1.1, HDF 1.10.5)"
fi
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.4.tar.gz
filename["$group$index"]=netcdf-fortran-4.4.4.tar.gz
dirname["$group$index"]=netcdf-fortran-4.4.4
builder["$group$index"]="configure"
if [[ $mpilib == openmpi* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.4.1.1"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group$index"]}"
	args["$group$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group$index"]="${name["$group$index"]}-fortran/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == mpich* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.4.1.1"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group$index"]}"
	args["$group$index"]="F77=mpif90 FC=mpif90"
	dirmodule["$group$index"]="${name["$group$index"]}-fortran/hdf5.110/$mpilib/$compilo"
elif [[ $mpilib == intel* ]]; then
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.4.1.1"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$mpilib/$compilo/fortran/${version["$group$index"]}"
	args["$group$index"]="F77=mpiifort FC=mpiifort"
	dirmodule["$group$index"]="${name["$group$index"]}-fortran/hdf5.110/$mpilib/$compilo"
else
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.4.1.1"
	dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/$compilo/fortran/${version["$group$index"]}"	
	args["$group$index"]=""
	dirmodule["$group$index"]="${name["$group$index"]}-fortran/hdf5.110/$compilo"
fi
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNetCDF Fortran ${version["$group$index"]}\"
}
 
module-whatis \"NetCDF Fortran - ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include"

fi # old-version




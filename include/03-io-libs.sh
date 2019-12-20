#!/bin/bash

#################################################################
#Group 3 : I/O librairies
group=3
groupname[$group]="I/O librairies"

#-------------------------------------------------------------------------------
# Parallel-netcdf 1.6.1 
# 1/2
# compiled with OpenMPI 1.10.7
index=1
name["$group$index"]=parallel-netcdf
version["$group$index"]=1.6.1
details["$group$index"]="(compiled with OpenMPI 1.10.7)"
url["$group$index"]=http://cucis.ece.northwestern.edu/projects/PnetCDF/Release/parallel-netcdf-1.6.1.tar.gz
filename["$group$index"]=parallel-netcdf-1.6.1.tar.gz
dirname["$group$index"]=parallel-netcdf-1.6.1
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi110/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/openmpi110/$compilo"
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

#-------------------------------------------------------------------------------
# Parallel-netcdf 1.12.1
# 2/2
# compiled with OpenMPI 1.10.7
index=2
name["$group$index"]=parallel-netcdf
version["$group$index"]=1.12.1
details["$group$index"]="(compiled with OpenMPI 1.10.7)"
url["$group$index"]=https://parallel-netcdf.github.io/Release/pnetcdf-1.12.1.tar.gz
filename["$group$index"]=pnetcdf-1.12.1.tar.gz
dirname["$group$index"]=pnetcdf-1.12.1
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi110/$compilo/${version["$group$index"]}"
args["$group$index"]="--enable-shared"
dirmodule["$group$index"]="${name["$group$index"]}/openmpi110/$compilo"
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

#-------------------------------------------------------------------------------
# Parallel-netcdf 1.6.1
# 2/2
# compiled with Mpich 3.2.1
index=3
name["$group$index"]=parallel-netcdf
version["$group$index"]=1.6.1
details["$group$index"]="(compiled with Mpich 3.2.1)"
url["$group$index"]=http://cucis.ece.northwestern.edu/projects/PnetCDF/Release/parallel-netcdf-1.6.1.tar.gz
filename["$group$index"]=parallel-netcdf-1.6.1.tar.gz
dirname["$group$index"]=parallel-netcdf-1.6.1
builder["$group$index"]="configure"
dependencies["$group$index"]="mpich/$compilo/3.2.1"
dirinstall["$group$index"]="${name["$group$index"]}/mpich321/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/mpich321/$compilo"
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

#-------------------------------------------------------------------------------
# Parallel-netcdf 1.9.0
# 1/1
# compiled with OpenMPI 3.0.0
index=4
name["$group$index"]=parallel-netcdf
version["$group$index"]=1.9.0
details["$group$index"]="(compiled with OpenMPI 3.0.0)"
url["$group$index"]=http://cucis.ece.northwestern.edu/projects/PnetCDF/Release/parallel-netcdf-1.9.0.tar.gz
filename["$group$index"]=parallel-netcdf-1.9.0.tar.gz
dirname["$group$index"]=parallel-netcdf-1.9.0
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/3.0.0"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi300/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/openmpi300/$compilo"
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



#-------------------------------------------------------------------------------
# HDF5 1.10.5 en Parallel I/O 
# 1/3
# compiled with OpenMPI 1.10.7
index=5
name["$group$index"]=hdf5
version["$group$index"]=1.10.5
details["$group$index"]="(compiled with OpenMPI 1.10.7)"
url["$group$index"]=https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.5.tar.gz
filename["$group$index"]=hdf5-1.10.5.tar.gz
dirname["$group$index"]=hdf5-1.10.5
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7 zlib/$compilo/1.2.11"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi110/$compilo/${version["$group$index"]}"
args["$group$index"]="--enable-parallel"
dirmodule["$group$index"]="${name["$group$index"]}/openmpi110/$compilo"
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

#-------------------------------------------------------------------------------
# HDF5 1.10.5 en Parallel I/O
# 2/3
# compiled with OpenMPI 3.0.0
index=6
name["$group$index"]=hdf5
version["$group$index"]=1.10.5
details["$group$index"]="(compiled with OpenMPI 3.0.0)"
url["$group$index"]=https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.5.tar.gz
filename["$group$index"]=hdf5-1.10.5.tar.gz
dirname["$group$index"]=hdf5-1.10.5
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/3.0.0 zlib/$compilo/1.2.11"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi300/$compilo/${version["$group$index"]}"
args["$group$index"]="--enable-parallel"
dirmodule["$group$index"]="${name["$group$index"]}/openmpi300/$compilo"
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

#-------------------------------------------------------------------------------
# HDF5 1.10.5 en Parallel I/O
# 3/3
# compiled with Mpich 3.2.1
index=7
name["$group$index"]=hdf5
version["$group$index"]=1.10.5
details["$group$index"]="(compiled with Mpich 3.2.1)"
url["$group$index"]=https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.5.tar.gz
filename["$group$index"]=hdf5-1.10.5.tar.gz
dirname["$group$index"]=hdf5-1.10.5
builder["$group$index"]="configure"
dependencies["$group$index"]="mpich/$compilo/3.2.1 zlib/$compilo/1.2.11"
dirinstall["$group$index"]="${name["$group$index"]}/mpich321/$compilo/${version["$group$index"]}"
args["$group$index"]="--enable-parallel"
dirmodule["$group$index"]="${name["$group$index"]}/mpich321/$compilo"
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

#-------------------------------------------------------------------------------
# NetCDF C 4.4.1.1
# 1/2
# compiled with HDF 1.10.5
# compiled with OpenMPI 1.10.7
index=8
name["$group$index"]=netcdf
version["$group$index"]=4.4.1.1
details["$group$index"]="(Version C compiled with HDF 1.10.5 and OpenMPI 1.10.7)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz
filename["$group$index"]=netcdf-4.4.1.1.tar.gz
dirname["$group$index"]=netcdf-4.4.1.1
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7 zlib/$compilo/1.2.11 hdf5/openmpi110/$compilo/1.10.5 parallel-netcdf/openmpi110/$compilo/1.6.1"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/${version["$group$index"]}"
args["$group$index"]="--enable-pnetcdf"
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi110/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNetCDF C 4.4.1.1 & NetCDF Fortran - 4.4.4\"
}
 
module-whatis \"NetCDF C - 4.4.1.1 & NetCDF Fortran - 4.4.4\"

# Version C 4.4.1.1
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/4.4.1.1/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/4.4.1.1/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/4.4.1.1/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/4.4.1.1/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/4.4.1.1/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/4.4.1.1/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/4.4.1.1/include 

#Version Fortran 4.4.4
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.4.4/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.4.4/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.4.4/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.4.4/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.4.4/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.4.4/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.4.4/include 
"

#-------------------------------------------------------------------------------
# NetCDF Fortran 4.4.4
# compiled with HDF 1.10.5
# compiled with OpenMPI 1.10.7
index=9
name["$group$index"]=netcdf
version["$group$index"]=4.4.4
details["$group$index"]="(version Fortran compiled with HDF 1.10.5 and OpenMPI 1.10.7)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.4.tar.gz
filename["$group$index"]=netcdf-fortran-4.4.4.tar.gz
dirname["$group$index"]=netcdf-fortran-4.4.4
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7 zlib/$compilo/1.2.11 hdf5/openmpi110/$compilo/1.10.5 parallel-netcdf/openmpi110/$compilo/1.6.1 netcdf/hdf5.110/openmpi110/$compilo/4.4.1.1"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi110/$compilo"
#modulefile["$group$index"]=""

#-------------------------------------------------------------------------------
# NetCDF C 4.4.1.1
# 1/1
# compiled with HDF 1.10.5
# compiled with OpenMPI 3.0.0
index=10
name["$group$index"]=netcdf
version["$group$index"]=4.4.1.1
details["$group$index"]="(Version C compiled with HDF 1.10.5 and OpenMPI 3.0.0)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz
filename["$group$index"]=netcdf-4.4.1.1.tar.gz
dirname["$group$index"]=netcdf-4.4.1.1
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/3.0.0 zlib/$compilo/1.2.11 hdf5/openmpi300/$compilo/1.10.5 parallel-netcdf/openmpi300/$compilo/1.9.0"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi300/$compilo/c/${version["$group$index"]}"
args["$group$index"]="--enable-pnetcdf"
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi300/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNetCDF C 4.4.1.1 & NetCDF Fortran - 4.4.4\"
}
 
module-whatis \"NetCDF C - 4.4.1.1 & NetCDF Fortran - 4.4.4\"

# Version C 4.4.1.1
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/c/4.4.1.1/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/c/4.4.1.1/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/c/4.4.1.1/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/c/4.4.1.1/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/c/4.4.1.1/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/c/4.4.1.1/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/c/4.4.1.1/include 

#Version Fortran 4.4.4
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/fortran/4.4.4/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/fortran/4.4.4/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/fortran/4.4.4/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/fortran/4.4.4/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/fortran/4.4.4/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/fortran/4.4.4/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi300/$compilo/fortran/4.4.4/include 
"

#-------------------------------------------------------------------------------
# NetCDF Fortran 4.4.4
# compiled with HDF 1.10.5
# compiled with OpenMPI 3.0.0
index=11
name["$group$index"]=netcdf
version["$group$index"]=4.4.4
details["$group$index"]="(version Fortran compiled with HDF 1.10.5 and OpenMPI 3.0.0)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.4.tar.gz
filename["$group$index"]=netcdf-fortran-4.4.4.tar.gz
dirname["$group$index"]=netcdf-fortran-4.4.4
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/3.0.0 zlib/$compilo/1.2.11 hdf5/openmpi300/$compilo/1.10.5 parallel-netcdf/openmpi300/$compilo/1.9.0 netcdf/hdf5.110/openmpi300/$compilo/4.4.1.1"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi300/$compilo/fortran/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi300/$compilo"
#modulefile["$group$index"]=""

#-------------------------------------------------------------------------------
# NetCDF C 4.4.1.1
# compiled with HDF 1.10.5
# compiled with Mpich 3.2.1
index=12
name["$group$index"]=netcdf
version["$group$index"]=4.4.1.1
details["$group$index"]="(Version C compiled with HDF 1.10.5 and Mpich 3.2.1)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz
filename["$group$index"]=netcdf-4.4.1.1.tar.gz
dirname["$group$index"]=netcdf-4.4.1.1
builder["$group$index"]="configure"
dependencies["$group$index"]="mpich/$compilo/3.2.1 zlib/$compilo/1.2.11 hdf5/mpich321/$compilo/1.10.5 parallel-netcdf/mpich321/$compilo/1.9.0"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/mpich321/$compilo/c/${version["$group$index"]}"
args["$group$index"]="--enable-pnetcdf"
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/mpich321/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNetCDF C 4.4.1.1 & NetCDF Fortran - 4.4.4\"
}
 
module-whatis \"NetCDF C - 4.4.1.1 & NetCDF Fortran - 4.4.4\"

# Version C 4.4.1.1
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/c/4.4.1.1/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/c/4.4.1.1/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/c/4.4.1.1/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/c/4.4.1.1/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/c/4.4.1.1/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/c/4.4.1.1/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/c/4.4.1.1/include 

#Version Fortran 4.4.4
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/fortran/4.4.4/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/fortran/4.4.4/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/fortran/4.4.4/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/fortran/4.4.4/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/fortran/4.4.4/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/fortran/4.4.4/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/mpich321/$compilo/fortran/4.4.4/include 
"

#-------------------------------------------------------------------------------
# NetCDF Fortran 4.4.4
# compiled with HDF 1.10.5
# compiled with Mpich 3.2.1
index=13
name["$group$index"]=netcdf
version["$group$index"]=4.4.4
details["$group$index"]="(version Fortran compiled with HDF 1.10.5 and Mpich 3.2.1)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.4.tar.gz
filename["$group$index"]=netcdf-fortran-4.4.4.tar.gz
dirname["$group$index"]=netcdf-fortran-4.4.4
builder["$group$index"]="configure"
dependencies["$group$index"]="mpich/$compilo/3.2.1 zlib/$compilo/1.2.11 hdf5/mpich321/$compilo/1.10.5 parallel-netcdf/mpich321/$compilo/1.9.0 netcdf/hdf5.110/mpich321/$compilo/4.4.1.1"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/mpich321/$compilo/fortran/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/mpich321/$compilo"
#modulefile["$group$index"]=""

#-------------------------------------------------------------------------------
# NetCDF C 4.7.3
# 1/2
# compiled with HDF 1.10.5
# compiled with OpenMPI 1.10.7
index=14
name["$group$index"]=netcdf
version["$group$index"]=4.7.3
details["$group$index"]="(Version C compiled with HDF 1.10.5 and OpenMPI 1.10.7)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-c-4.7.3.tar.gz
filename["$group$index"]=netcdf-c-4.7.3.tar.gz
dirname["$group$index"]=netcdf-c-4.7.3
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7 zlib/$compilo/1.2.11 hdf5/openmpi110/$compilo/1.10.5 parallel-netcdf/openmpi110/$compilo/1.12.1"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/${version["$group$index"]}"
args["$group$index"]="--enable-pnetcdf --with-pnetcdf=$prefix/parallel-netcdf/openmpi110/$compilo/1.12.1/lib"
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi110/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNetCDF C ${version["$group$index"]} & NetCDF Fortran - 4.5.2\"
}
 
module-whatis \"NetCDF C - ${version["$group$index"]} & NetCDF Fortran - 4.5.2\"

# Version C ${version["$group$index"]}
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/${version["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/${version["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/${version["$group$index"]}/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/${version["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/${version["$group$index"]}/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/${version["$group$index"]}/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/c/${version["$group$index"]}/include 

#Version Fortran 4.5.2
prepend-path PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.5.2/bin
prepend-path LD_LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.5.2/lib
prepend-path LIBRARY_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.5.2/lib
prepend-path MANPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.5.2/share/man
prepend-path C_INCLUDE_PATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.5.2/include
prepend-path INCLUDE $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.5.2/include 
prepend-path CPATH $prefix/${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/4.5.2/include "

#-------------------------------------------------------------------------------
# NetCDF Fortran 4.5.2
# compiled with HDF 1.10.5
# compiled with OpenMPI 1.10.7
index=15
name["$group$index"]=netcdf
version["$group$index"]=4.5.2
details["$group$index"]="(version Fortran compiled with HDF 1.10.5 and OpenMPI 1.10.7)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.5.2.tar.gz
filename["$group$index"]=netcdf-fortran-4.5.2.tar.gz
dirname["$group$index"]=netcdf-fortran-4.5.2
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7 zlib/$compilo/1.2.11 hdf5/openmpi110/$compilo/1.10.5 parallel-netcdf/openmpi110/$compilo/1.12.1 netcdf/hdf5.110/openmpi110/$compilo/4.4.1.1"
dirinstall["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi110/$compilo/fortran/${version["$group$index"]}"
args["$group$index"]="--enable-pnetcdf --with-pnetcdf=$prefix/parallel-netcdf/openmpi110/$compilo/1.12.1/lib"
dirmodule["$group$index"]="${name["$group$index"]}/hdf5.110/openmpi110/$compilo"
#modulefile["$group$index"]=""


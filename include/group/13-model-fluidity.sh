#!/bin/bash

#################################################################
#Group 13 : Model FLUIDITY
group="13"
groupname[$group]="Model FLUIDITY"

# Spud snapshot from main branch
index=1
name["$group-$index"]=spud
version["$group-$index"]=snapshot
details["$group-$index"]="(contains Diamond graphic tool)"
url["$group-$index"]="https://github.com/FluidityProject/spud/archive/refs/heads/main.zip -O spud-main.zip"
filename["$group-$index"]=spud-main.zip
dirname["$group-$index"]=spud-main
builder["$group-$index"]="configure"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} gtk/$compilo/3.24.29 gtksourceview/$compilo/3.24.11 libxml2/$compilo/snapshot libxslt/$compilo/snapshot"
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
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
setenv SPUD_DIR $prefix/${dirinstall["$group-$index"]}
prepend-path PYTHONPATH $prefix/${dirinstall["$group-$index"]}/lib/$pythonInterpreter/site-packages
prepend-path PYTHONUSERBASE $prefix/${dirinstall["$group-$index"]}
"

if [ "$mpilib" != "none" ]; then # MPI-only

# fluidity snapshot
index=2
name["$group-$index"]=fluidity
version["$group-$index"]=snapshot
details["$group-$index"]=""
url["$group-$index"]="https://github.com/FluidityProject/fluidity/archive/refs/heads/main.zip -O fluidity-master.zip"
filename["$group-$index"]=fluidity-master.zip
dirname["$group-$index"]=fluidity-main
builder["$group-$index"]="fluidity"
dependencies["$group-$index"]="$mpi_dep petsc/$mpilib/$compilo/3.12.5 vtk/$mpilib/$compilo/8.2.0 zlib/$compilo/1.2.11 lapack-blas/$compilo/3.9.0 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 netcdf-fortran/hdf5.110/$mpilib/$compilo/4.5.3 gmsh/$mpilib/$compilo/4.8.4 spud/$compilo/snapshot"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
args["$group-$index"]="CPPFLAGS=\"-I$prefix/vtk/$compilo/8.2.0/include/vtk-8.2 -I$prefix/netcdf/hdf5.110/$mpilib/$compilo/c/4.8.0/include -I$prefix/netcdf/hdf5.110/$mpilib/$compilo/fortran/4.5.3/include \" --enable-2d-adaptivity  --enable-openmp --enable-vtk --with-hdf5=yes --with-netcdf --with-libspud-root=$prefix/spud/$compilo/snapshot"
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
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
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path PYTHONPATH $prefix/${dirinstall["$group-$index"]}/lib/$pythonInterpreter/site-packages
prepend-path PYTHONUSERBASE $prefix/${dirinstall["$group-$index"]}
prepend-path DIAMOND_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/diamond/schemata
"

fi # end-MPI-only






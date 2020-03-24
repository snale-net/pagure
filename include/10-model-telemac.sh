#!/bin/bash

#################################################################
#Group 6 : Model TELEMAC
group=6
groupname[$group]="Model TELEMAC"

# MED-4.0.0
index=1
name["$group$index"]=med
version["$group$index"]=4.0.0
details["$group$index"]=""
url["$group$index"]=http://files.salome-platform.org/Salome/other/med-4.0.0.tar.gz
filename["$group$index"]=med-4.0.0.tar.gz
dirname["$group$index"]=med-4.0.0
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 python/$compilo/${pythonVersion}"
	dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
	args["$group$index"]="--with-hdf5=$prefix/hdf5/$compilo/1.10.5"
	dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 python/$compilo/${pythonVersion} python/$mpilib/$compilo/${pythonVersion}"
	dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
	args["$group$index"]="--with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 --disable-python"
	dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
fi
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tMED ${version["$group$index"]}\"
}
 
module-whatis \"MED ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# AED2-1.3.0
index=2
name["$group$index"]=aed2
version["$group$index"]=1.3.0
details["$group$index"]=""
url["$group$index"]="https://github.com/AquaticEcoDynamics/libaed2/archive/v1.3.0.tar.gz -O aed2-1.3.0.tar.gz"
filename["$group$index"]=aed2-1.3.0.tar.gz
dirname["$group$index"]=libaed2-1.3.0
builder["$group$index"]="aed2" 
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tAED2 ${version["$group$index"]}\"
}
 
module-whatis \"AED2 ${version["$group$index"]}\"

prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# Metis 5.1.0
index=3
name["$group$index"]=metis
version["$group$index"]=5.1.0
details["$group$index"]="(dynamic lib)"
url["$group$index"]=http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz
filename["$group$index"]=metis-5.1.0.tar.gz
dirname["$group$index"]=metis-5.1.0
builder["$group$index"]="metis"
dependencies["$group$index"]="$mpi_dep"
dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
args["$group$index"]="-DSHARED=TRUE"
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tMetis ${version["$group$index"]}\"
}
 
module-whatis \"Metis ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"



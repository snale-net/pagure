#!/bin/bash

#################################################################
#Group 1 : MPI
group=1
groupname[$group]="MPI librairies"

if [ "$mpilib" == "openmpi110" ]; then
#OpenMPI 1.10.7
index=1
name["$group$index"]=openmpi
version["$group$index"]=1.10.7
details["$group$index"]=""
url["$group$index"]=https://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-1.10.7.tar.gz
filename["$group$index"]=openmpi-1.10.7.tar.gz
dirname["$group$index"]=openmpi-1.10.7
builder["$group$index"]="configure"
#dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="--enable-mpi-cxx"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t${name["$group$index"]} ${version["$group$index"]}\"
}

module-whatis \"${name["$group$index"]} ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include
setenv MPI_HOME $prefix/${dirinstall["$group$index"]}/
setenv MPI_RUN $prefix/${dirinstall["$group$index"]}/bin/mpirun
"	
fi

if [ "$mpilib" == "openmpi300" ]; then
#OpenMPI 3.0.0
index=2
name["$group$index"]=openmpi
version["$group$index"]=3.0.0
details["$group$index"]=""
url["$group$index"]=https://www.open-mpi.org/software/ompi/v3.0/downloads/openmpi-3.0.0.tar.gz
filename["$group$index"]=openmpi-3.0.0.tar.gz
dirname["$group$index"]=openmpi-3.0.0
builder["$group$index"]="configure"
#dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="--enable-mpi-cxx --disable-io-ompio"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t${name["$group$index"]} ${version["$group$index"]}\"
}

module-whatis \"${name["$group$index"]} ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include
setenv MPI_HOME $prefix/${dirinstall["$group$index"]}/
setenv MPI_RUN $prefix/${dirinstall["$group$index"]}/bin/mpirun
"
fi

if [ "$mpilib" == "mpich321" ]; then
# Mpich 3.2.1
index=3
name["$group$index"]=mpich
version["$group$index"]=3.2.1
details["$group$index"]=""
url["$group$index"]=http://www.mpich.org/static/downloads/3.2.1/mpich-3.2.1.tar.gz
filename["$group$index"]=mpich-3.2.1.tar.gz
dirname["$group$index"]=mpich-3.2.1
builder["$group$index"]="configure"
#dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t${name["$group$index"]} ${version["$group$index"]}\"
}

module-whatis \"${name["$group$index"]} ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include
setenv MPI_HOME $prefix/${dirinstall["$group$index"]}/
setenv MPI_RUN $prefix/${dirinstall["$group$index"]}/bin/mpirun
"
fi

if [ "$mpilib" == "mpich332" ]; then
# Mpich 3.3.2
index=3
name["$group$index"]=mpich
version["$group$index"]=3.3.2
details["$group$index"]=""
url["$group$index"]=http://www.mpich.org/static/downloads/3.3.2/mpich-3.3.2.tar.gz
filename["$group$index"]=mpich-3.3.2.tar.gz
dirname["$group$index"]=mpich-3.3.2
builder["$group$index"]="configure"
#dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t${name["$group$index"]} ${version["$group$index"]}\"
}

module-whatis \"${name["$group$index"]} ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include
setenv MPI_HOME $prefix/${dirinstall["$group$index"]}/
setenv MPI_RUN $prefix/${dirinstall["$group$index"]}/bin/mpirun
"
fi

#!/bin/bash

#################################################################
#Group 15 : Model LaMEM
group="15"
groupname[$group]="Model LaMEM"

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

if [ "$mpilib" != "none" ]; then # MPI-only

# LaMEM 2.1.1
index=1
name["$group-$index"]=lamem
version["$group-$index"]=2.1.1
details["$group-$index"]=""
url["$group-$index"]="https://github.com/UniMainzGeo/LaMEM/archive/refs/tags/v2.1.1.tar.gz -O lamem-2.1.1.tar.gz"
filename["$group-$index"]=lamem-2.1.1.tar.gz
dirname["$group-$index"]="LaMEM-2.1.1/src"
builder["$group-$index"]="lamem"
dependencies["$group-$index"]="$mpi_dep petsc/$mpilib/$pythonlib/$compilo/3.18.6"
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
module load dependencies_modules

prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"

fi # end-MPI-only

fi # end-Python-only


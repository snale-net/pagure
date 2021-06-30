#!/bin/bash

#################################################################
#Group 13 : Model FLUIDITY
group="13"
groupname[$group]="Model FLUIDITY"

# Spud snapshot from main branch
index=1
name["$group$index"]=spud
version["$group$index"]=snapshot
details["$group$index"]=""
url["$group$index"]="https://github.com/FluidityProject/spud/archive/refs/heads/main.zip -O spud-main.zip"
filename["$group$index"]=spud-main.zip
dirname["$group$index"]=spud-main
builder["$group$index"]="configure"
dependencies["$group$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
setenv SPUD_DIR $prefix/${dirinstall["$group$index"]}
"

if [ "$mpilib" != "none" ]; then # MPI-only
    echo "hi"
fi # end-MPI-only



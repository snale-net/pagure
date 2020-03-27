#!/bin/bash

if [ "$installedPython" == "0"  ]; then # only-if-not-Python

#################################################################
#Group 5 : Python
group=5
groupname[$group]="Python"

if (( $(echo "$pythonVersion == 3.7" |bc -l) )); then # only Python==3.7

#Python-3.7.7.tgz
index=1
name["$group$index"]=python
version["$group$index"]=3.7
details["$group$index"]=""
url["$group$index"]=https://www.python.org/ftp/python/3.7.7/Python-3.7.7.tgz
filename["$group$index"]=Python-3.7.7.tgz
dirname["$group$index"]=Python-3.7.7
builder["$group$index"]="python-builder"
#dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="--enable-shared"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0                                                                                                                                                                                                                                 
proc ModulesHelp { } {                                                                                                                                                                                                                      
global dotversion
 
puts stderr \"\tPython ${version["$group$index"]}\"
}
 
module-whatis \"Python ${version["$group$index"]}\"
prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include
"

fi # end-only Python==3.7

fi  # end-only-if-not-Python


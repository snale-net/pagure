#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#################################################################
#Group 9 : Web
group=9
groupname[$group]="Web librairies"

# nodejs 26.13.1
index=1
name["$group-$index"]=nodejs
version["$group-$index"]=26.13.1
constraints["$group-$index"]='pythonInterpreter != none'
details["$group-$index"]=""
url["$group-$index"]="https://nodejs.org/dist/v26.13.1/node-v26.13.1.tar.gz"
filename["$group-$index"]=node-v26.13.1.tar.gz
dirname["$group-$index"]=node-v26.13.1
builder["$group-$index"]="nodejs"
dependencies["$group-$index"]="python"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}"
modulefilename["$group-$index"]="${version["$group-$index"]}"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNodeJS ${version["$group-$index"]}\"
}
 
module-whatis \"NodeJS ${version["$group-$index"]}\"

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
"

# yarn 4.18.1
index=2
name["$group-$index"]=yarn
version["$group-$index"]=4.18.1
constraints["$group-$index"]='pythonInterpreter != none'
details["$group-$index"]=""
url["$group-$index"]="https://github.com/yarnpkg/berry/archive/refs/tags/@yarnpkg/cli/4.18.1.tar.gz -O yarn-4.18.1.tar.gz"
filename["$group-$index"]=yarn-4.18.1.tar.gz
dirname["$group-$index"]=yarn-4.18.1
builder["$group-$index"]="yarn"
dependencies["$group-$index"]="nodejs==26.13.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}"
modulefilename["$group-$index"]="${version["$group-$index"]}"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t${name["$group-$index"]} ${version["$group-$index"]}\"
}
 
module-whatis \"${name["$group-$index"]} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"





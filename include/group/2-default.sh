#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#################################################################
#Group 2 : Default
group=2
groupname[$group]="Default librairies"

# cmake 3.31.8
index=1
name["$group-$index"]=cmake
version["$group-$index"]=3.31.8
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.kitware.com/cmake/cmake/-/archive/v3.31.8/cmake-v3.31.8.zip"
filename["$group-$index"]=cmake-v3.31.8.zip
dirname["$group-$index"]=cmake-v3.31.8
builder["$group-$index"]="cmake-builder"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0                                                                                                                                                                                                                                 
proc ModulesHelp { } {                                                                                                                                                                                                                      
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
setenv CMAKE_DIR $prefix/${dirinstall["$group-$index"]}
"

# bison 3.7
index=2
name["$group-$index"]=bison
version["$group-$index"]=3.7
details["$group-$index"]=""
url["$group-$index"]="http://ftp.gnu.org/gnu/bison/bison-3.7.tar.xz"
filename["$group-$index"]=bison-3.7.tar.xz
dirname["$group-$index"]=bison-3.7
builder["$group-$index"]="configure"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
"

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# meson 1.4.2
index=3
name["$group-$index"]=meson
version["$group-$index"]=1.4.2
mandatory["$group-$index"]=1
details["$group-$index"]="(Python tool)"
url["$group-$index"]="https://github.com/mesonbuild/meson/archive/refs/tags/1.4.2.tar.gz -O meson-1.4.2.tar.gz"
filename["$group-$index"]=meson-1.4.2.tar.gz
dirname["$group-$index"]=meson-1.4.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# scikit-build 0.11.1
index=4
name["$group-$index"]=scikit-build
version["$group-$index"]=0.11.1
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/71/02/1e94506b7bee5739317f2d141cebab7dab5bb5731b377e718fddd3b3e7e7/scikit-build-0.11.1.tar.gz"
filename["$group-$index"]=scikit-build-0.11.1.tar.gz
dirname["$group-$index"]=scikit-build-0.11.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# ninja 1.10.0.post2
index=5
name["$group-$index"]=ninja
version["$group-$index"]=1.10.0.post2
mandatory["$group-$index"]=1
details["$group-$index"]="(Python tool)"
url["$group-$index"]="https://files.pythonhosted.org/packages/55/a3/56376f09d6be4be5b7ebfc492d3e89cb05206a61f8c5f695a5d1e8cc49b7/ninja-1.10.0.post2.tar.gz"
filename["$group-$index"]=ninja-1.10.0.post2.tar.gz
dirname["$group-$index"]=ninja-1.10.0.post2
builder["$group-$index"]="python"
dependencies["$group-$index"]="cmake/$compilo/3.31.8 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python

#Lapack & Blas 3.9.1 Dynamic lib
index=6
name["$group-$index"]=lapack-blas
version["$group-$index"]=3.9.1
mandatory["$group-$index"]=1
if [[ $compiler == "intel" ]]; then
	details["$group-$index"]="(dynamic lib - requires Intel MKL)"
else
	details["$group-$index"]="(static & dynamic lib)"
fi
url["$group-$index"]="https://github.com/Reference-LAPACK/lapack/archive/refs/tags/v3.9.1.tar.gz -O lapack-3.9.1.tar.gz"
filename["$group-$index"]=lapack-3.9.1.tar.gz
dirname["$group-$index"]=lapack-3.9.1
builder["$group-$index"]="lapack"
if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
dependencies["$group-$index"]="cmake/$compilo/3.31.8 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
else
dependencies["$group-$index"]="cmake/$compilo/3.31.8"
fi 
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path LAPACK $prefix/${dirinstall["$group-$index"]}
prepend-path BLAS $prefix/${dirinstall["$group-$index"]}
"

if [ "$showOldVersion" = "1" ]; then # old-version

#Lapack & Blas 3.8.0 Dynamic lib
index=7
name["$group-$index"]=lapack-blas
version["$group-$index"]=3.8.0
details["$group-$index"]="(static & dynamic lib)"
url["$group-$index"]=http://www.netlib.org/lapack/lapack-3.8.0.tar.gz
filename["$group-$index"]=lapack-3.8.0.tar.gz
dirname["$group-$index"]=lapack-3.8.0
builder["$group-$index"]="lapack"
dependencies["$group-$index"]="cmake/$compilo/3.31.8"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path LAPACK $prefix/${dirinstall["$group-$index"]}
prepend-path BLAS $prefix/${dirinstall["$group-$index"]}
"

fi # old-version

# bazel 4.2.2
index=8
name["$group-$index"]=bazel
version["$group-$index"]=4.2.2
details["$group-$index"]=""
url["$group-$index"]="https://github.com/bazelbuild/bazel/releases/download/4.2.2/bazel-4.2.2-dist.zip -O bazel-4.2.2-dist.all-in-root.zip"
filename["$group-$index"]=bazel-4.2.2-dist.all-in-root.zip
dirname["$group-$index"]=bazel-4.2.2-dist
builder["$group-$index"]="bazel"
dependencies["$group-$index"]="python/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"



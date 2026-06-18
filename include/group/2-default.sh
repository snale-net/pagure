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
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}"
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
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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

# meson 1.9.2
index=3
name["$group-$index"]=meson
version["$group-$index"]=1.9.2
constraints["$group-$index"]='pythonInterpreter != none' # only-if-Python
mandatory["$group-$index"]=1
details["$group-$index"]="(Python tool)"
url["$group-$index"]="https://files.pythonhosted.org/packages/18/ca/0e3c232fb20f0707bbddf7bb639882a3dba8684bf2f9f4eced266775fcbc/meson-1.9.2.tar.gz"
filename["$group-$index"]=meson-1.9.2.tar.gz
dirname["$group-$index"]=meson-1.9.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__"
dirinstall["$group-$index"]="python-modules/__COMPILO__"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# scikit-build 0.13.1
index=4
name["$group-$index"]=scikit-build
version["$group-$index"]=0.13.1
constraints["$group-$index"]='pythonInterpreter != none' # only-if-Python
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/a5/e6/2d32573ff027be7b9e9aec560afe2a20ffc4f9d631e69c5cce252695f33b/scikit-build-0.13.1.tar.gz"
filename["$group-$index"]=scikit-build-0.13.1.tar.gz
dirname["$group-$index"]=scikit-build-0.13.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__"
dirinstall["$group-$index"]="python-modules/__COMPILO__"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# ninja 1.10.2.4
index=5
name["$group-$index"]=ninja
version["$group-$index"]=1.10.2.4
constraints["$group-$index"]='pythonInterpreter != none' # only-if-Python
mandatory["$group-$index"]=1
details["$group-$index"]="(Python tool)"
url["$group-$index"]="https://files.pythonhosted.org/packages/c6/3e/f14cc8da437224acea3bdb9a82bc9c128638211ca08ac029ed5c8716b7e9/ninja-1.10.2.4.tar.gz"
filename["$group-$index"]=ninja-1.10.2.4.tar.gz
dirname["$group-$index"]=ninja-1.10.2.4
builder["$group-$index"]="python"
dependencies["$group-$index"]="cmake/3.31.8 python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__"
dirinstall["$group-$index"]="python-modules/__COMPILO__"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""


#Lapack & Blas 3.9.1 Dynamic lib
index=6
name["$group-$index"]=lapack-blas
version["$group-$index"]=3.9.1
options["$group-$index"]=""
mandatory["$group-$index"]=1
if [[ $compiler == "intel" ]]; then
	details["$group-$index"]="(static & dynamic lib - requires Intel MKL)"
else
	details["$group-$index"]="(static & dynamic lib)"
fi
url["$group-$index"]="https://github.com/Reference-LAPACK/lapack/archive/refs/tags/v3.9.1.tar.gz -O lapack-3.9.1.tar.gz"
filename["$group-$index"]=lapack-3.9.1.tar.gz
dirname["$group-$index"]=lapack-3.9.1
builder["$group-$index"]="lapack"
dependencies["$group-$index"]="cmake/3.31.8"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path LAPACK $prefix/${dirinstall["$group-$index"]}
prepend-path BLAS $prefix/${dirinstall["$group-$index"]}
"

#Lapack & Blas 3.9.1 Dynamic lib
index=7
name["$group-$index"]=lapack-blas
version["$group-$index"]=3.9.1
options["$group-$index"]="+python"
mandatory["$group-$index"]=1
#if [[ $compiler == "intel" ]]; then
#	details["$group-$index"]="(static & dynamic lib - requires Intel MKL)"
#else
#	details["$group-$index"]="(static & dynamic lib)"
#fi
details["$group-$index"]="(static & dynamic lib)"
url["$group-$index"]="https://github.com/Reference-LAPACK/lapack/archive/refs/tags/v3.9.1.tar.gz -O lapack-3.9.1.tar.gz"
filename["$group-$index"]=lapack-3.9.1.tar.gz
dirname["$group-$index"]=lapack-3.9.1
builder["$group-$index"]="lapack"
dependencies["$group-$index"]="cmake/3.31.8 python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path LAPACK $prefix/${dirinstall["$group-$index"]}
prepend-path BLAS $prefix/${dirinstall["$group-$index"]}
"

#Lapack & Blas 3.8.0 Dynamic lib
index=8
name["$group-$index"]=lapack-blas
version["$group-$index"]=3.8.0
details["$group-$index"]="(static & dynamic lib)"
url["$group-$index"]=http://www.netlib.org/lapack/lapack-3.8.0.tar.gz
filename["$group-$index"]=lapack-3.8.0.tar.gz
dirname["$group-$index"]=lapack-3.8.0
builder["$group-$index"]="lapack"
dependencies["$group-$index"]="cmake/3.31.8"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path LAPACK $prefix/${dirinstall["$group-$index"]}
prepend-path BLAS $prefix/${dirinstall["$group-$index"]}
"


# bazel 4.2.2
index=9
name["$group-$index"]=bazel
version["$group-$index"]=4.2.2
details["$group-$index"]=""
url["$group-$index"]="https://github.com/bazelbuild/bazel/releases/download/4.2.2/bazel-4.2.2-dist.zip -O bazel-4.2.2-dist.all-in-root.zip"
filename["$group-$index"]=bazel-4.2.2-dist.all-in-root.zip
dirname["$group-$index"]=bazel-4.2.2-dist
builder["$group-$index"]="bazel"
dependencies["$group-$index"]="python/__COMPILO__/__PYTHON_VERSION__"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"

# OpenBLAS 0.3.33
index=10
name["$group-$index"]=openblas
version["$group-$index"]=0.3.33
options["$group-$index"]=""
details["$group-$index"]=""
url["$group-$index"]="https://github.com/OpenMathLib/OpenBLAS/archive/refs/tags/v0.3.33.zip -O openblas-0.3.33.zip"
filename["$group-$index"]=openblas-0.3.33.zip
dirname["$group-$index"]=OpenBLAS-0.3.33
builder["$group-$index"]="cmake"
args["$group-$index"]="-DBUILD_SHARED_LIBS=ON -DDYNAMIC_ARCH=ON -DUSE_OPENMP=ON"
dependencies["$group-$index"]="cmake/3.31.8"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path OPENBLAS $prefix/${dirinstall["$group-$index"]}
"


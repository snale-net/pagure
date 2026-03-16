#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#################################################################
#Group 5 : Common
group=5
groupname[$group]="Common librairies"

if [ "$mpilib" != "none" ]; then # MPI-only

#Scalapack 2.1.0
index=1
name["$group-$index"]=scalapack
version["$group-$index"]=2.1.0
if [[ $compiler == "intel" ]]; then
	details["$group-$index"]="(requires Intel MKL)"
fi
details["$group-$index"]=""
url["$group-$index"]="https://github.com/Reference-ScaLAPACK/scalapack/archive/v2.1.0.tar.gz -O scalapack-2.1.0.tar.gz"
filename["$group-$index"]=scalapack-2.1.0.tar.gz
dirname["$group-$index"]=scalapack-2.1.0
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="$mpi_dep cmake/$compilo/3.31.8 lapack-blas/$compilo/3.9.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
patch_01["$group-$index"]="--- CMakeLists_original.txt	2019-11-26 21:37:04.000000000 +0100
+++ CMakeLists.txt	2021-03-07 17:10:22.775977865 +0100
@@ -93,9 +93,9 @@
 # Testing
 SET(DART_TESTING_TIMEOUT 600)
 
-enable_testing()
-include(CTest)
-enable_testing()
+#enable_testing()
+#include(CTest)
+#enable_testing()
 # --------------------------------------------------
 
 # Organize output files.  On Windows this also keeps .dll files next
"
patchfile_01["$group-$index"]="CMakeLists.txt"
args["$group-$index"]="-DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=ON -DLAPACK_LIBRARIES=$prefix/lapack-blas/$compilo/3.9.1/lib/liblapack.so -DBLAS_LIBRARIES=$prefix/lapack-blas/$compilo/3.9.1/lib/libblas.so"
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
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
"

fi # MPI-only

#Zlib 1.2.11
index=2
name["$group-$index"]=zlib
version["$group-$index"]=1.2.11
details["$group-$index"]="(needed by HDF5)"
url["$group-$index"]="https://github.com/madler/zlib/archive/refs/tags/v1.2.11.tar.gz -O zlib-1.2.11.tar.gz"
filename["$group-$index"]=zlib-1.2.11.tar.gz
dirname["$group-$index"]=zlib-1.2.11
builder["$group-$index"]="configure"
#dependencies["$group-$index"]=""
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
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

#musl 1.2.0
index=3
name["$group-$index"]=musl
version["$group-$index"]=1.2.0
details["$group-$index"]="(needed by StaticX)"
url["$group-$index"]=https://musl.libc.org/releases/musl-1.2.0.tar.gz
filename["$group-$index"]=musl-1.2.0.tar.gz
dirname["$group-$index"]=musl-1.2.0
builder["$group-$index"]="configure"
#dependencies["$group-$index"]=""
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
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
setenv BOOTLOADER_CC $prefix/${dirinstall["$group-$index"]}/bin/musl-gcc
"

#ruby 2.7.2
index=4
name["$group-$index"]=ruby
version["$group-$index"]=2.7.2
details["$group-$index"]=""
url["$group-$index"]=https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.2.tar.gz
filename["$group-$index"]=ruby-2.7.2.tar.gz
dirname["$group-$index"]=ruby-2.7.2
builder["$group-$index"]="configure"
#dependencies["$group-$index"]=""
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
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
"

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

#jasper 2.0.26
index=5
name["$group-$index"]=jasper
version["$group-$index"]=2.0.26
details["$group-$index"]="(needed by Eccodes)"
url["$group-$index"]="https://github.com/jasper-software/jasper/archive/version-2.0.26.tar.gz -O jasper-2.0.26.tar.gz"
filename["$group-$index"]=jasper-2.0.26.tar.gz
dirname["$group-$index"]=jasper-version-2.0.26
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="cmake/$compilo/3.31.8 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
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
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
"

fi  # end-only-if-Python


# sqlite 3.36.0
index=6
name["$group-$index"]=sqlite
version["$group-$index"]=3.36.0
details["$group-$index"]="(needed by proj)"
url["$group-$index"]="https://www.sqlite.org/2021/sqlite-autoconf-3360000.tar.gz"
filename["$group-$index"]=sqlite-autoconf-3360000.tar.gz
dirname["$group-$index"]=sqlite-autoconf-3360000
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

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
"



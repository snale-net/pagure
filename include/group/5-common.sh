#!/bin/bash

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
url["$group-$index"]="https://github.com/Reference-ScaLAPACK/scalapack/archive/refs/heads/master.zip -O scalapack-master.zip"
filename["$group-$index"]=scalapack-master.zip
dirname["$group-$index"]=scalapack-master
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="$mpi_dep lapack-blas/$compilo/3.9.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
patch_01["$group-$index"]="--- CMakeLists_original.txt	2021-07-12 17:09:20.242765000 +0200
+++ CMakeLists.txt	2021-07-12 17:09:56.707114417 +0200
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
args["$group-$index"]="-DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=ON -DLAPACK_LIBRARIES=$prefix/lapack-blas/$compilo/3.9.0/lib/liblapack.so -DBLAS_LIBRARIES=$prefix/lapack-blas/$compilo/3.9.0/lib/libblas.so"
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
details["$group-$index"]="(required by HDF5)"
url["$group-$index"]=http://zlib.net/zlib-1.2.11.tar.gz
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
details["$group-$index"]="(required by StaticX)"
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
details["$group-$index"]="(require by Eccodes)"
url["$group-$index"]="https://github.com/jasper-software/jasper/archive/version-2.0.26.tar.gz -O jasper-2.0.26.tar.gz"
filename["$group-$index"]=jasper-2.0.26.tar.gz
dirname["$group-$index"]=jasper-version-2.0.26
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
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



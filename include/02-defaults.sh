#!/bin/bash

#################################################################
#Group 2 : Default
group=2
groupname[$group]="Default librairies"

#Lapack & Blas 3.9.0 Dynamic lib
index=1
name["$group$index"]=lapack-blas
version["$group$index"]=3.9.0
if [[ $compiler == "intel" ]]; then
	details["$group$index"]="(dynamic lib - requires Intel MKL)"
else
	details["$group$index"]="(dynamic lib)"
fi
url["$group$index"]="https://github.com/Reference-LAPACK/lapack/archive/v3.9.0.tar.gz -O lapack-3.9.0.tar.gz"
filename["$group$index"]=lapack-3.9.0.tar.gz
dirname["$group$index"]=lapack-3.9.0
builder["$group$index"]="cmake"
#dependencies["$group$index"]=""
patch_01["$group$index"]="--- CMakeLists_original.txt	2019-11-21 08:57:43.000000000 +0100
+++ CMakeLists.txt	2020-03-26 17:09:08.519176145 +0100
@@ -73,10 +73,10 @@
 
 if(UNIX)
   if(CMAKE_Fortran_COMPILER_ID STREQUAL Intel)
-    list(APPEND CMAKE_Fortran_FLAGS -fp-model strict)
+    string(APPEND CMAKE_Fortran_FLAGS -fp-model strict)
   endif()
   if(CMAKE_Fortran_COMPILER_ID STREQUAL XL)
-    list(APPEND CMAKE_Fortran_FLAGS -qnosave -qstrict=none)
+    string(APPEND CMAKE_Fortran_FLAGS -qnosave -qstrict=none)
   endif()
 # Delete libmtsk in linking sequence for Sun/Oracle Fortran Compiler.
 # This library is not present in the Sun package SolarisStudio12.3-linux-x86-bin
@@ -443,4 +443,4 @@
   DESTINATION \${CMAKE_INSTALL_LIBDIR}/cmake/lapack-\${LAPACK_VERSION}
   COMPONENT Development
   )
-  
\ Pas de fin de ligne à la fin du fichier
+  
"
patchfile_01["$group$index"]="CMakeLists.txt"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="-DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=ON -DLAPACKE=ON"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tLapack & Blas ${version["$group$index"]}\"
}
 
module-whatis \"Lapack & Blas ${version["$group$index"]}\"
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include
prepend-path LAPACK $prefix/${dirinstall["$group$index"]}
prepend-path BLAS $prefix/${dirinstall["$group$index"]}
"

#Lapack & Blas 3.9.0 Static lib
index=2
name["$group$index"]=lapack-blas
version["$group$index"]=3.9.0
if [[ $compiler == "intel" ]]; then
	details["$group$index"]="(static lib - requires Intel MKL)"
else
	details["$group$index"]="(static lib)"
fi
url["$group$index"]="https://github.com/Reference-LAPACK/lapack/archive/v3.9.0.tar.gz -O lapack-3.9.0.tar.gz"
filename["$group$index"]=lapack-3.9.0.tar.gz
dirname["$group$index"]=lapack-3.9.0
builder["$group$index"]="cmake"
patch_01["$group$index"]="--- CMakeLists_original.txt	2019-11-21 08:57:43.000000000 +0100
+++ CMakeLists.txt	2020-03-26 17:09:08.519176145 +0100
@@ -73,10 +73,10 @@
 
 if(UNIX)
   if(CMAKE_Fortran_COMPILER_ID STREQUAL Intel)
-    list(APPEND CMAKE_Fortran_FLAGS -fp-model strict)
+    string(APPEND CMAKE_Fortran_FLAGS -fp-model strict)
   endif()
   if(CMAKE_Fortran_COMPILER_ID STREQUAL XL)
-    list(APPEND CMAKE_Fortran_FLAGS -qnosave -qstrict=none)
+    string(APPEND CMAKE_Fortran_FLAGS -qnosave -qstrict=none)
   endif()
 # Delete libmtsk in linking sequence for Sun/Oracle Fortran Compiler.
 # This library is not present in the Sun package SolarisStudio12.3-linux-x86-bin
@@ -443,4 +443,4 @@
   DESTINATION \${CMAKE_INSTALL_LIBDIR}/cmake/lapack-\${LAPACK_VERSION}
   COMPONENT Development
   )
-  
\ Pas de fin de ligne à la fin du fichier
+  
"
patchfile_01["$group$index"]="CMakeLists.txt"
#dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="-DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=OFF -DLAPACKE=ON"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

if [ "$showOldVersion" = "1" ]; then # old-version

#Lapack & Blas 3.8.0 Dynamic lib
index=3
name["$group$index"]=lapack-blas
version["$group$index"]=3.8.0
details["$group$index"]="(dynamic lib)"
url["$group$index"]=http://www.netlib.org/lapack/lapack-3.8.0.tar.gz
filename["$group$index"]=lapack-3.8.0.tar.gz
dirname["$group$index"]=lapack-3.8.0
builder["$group$index"]="cmake"
#dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="-DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=ON -DLAPACKE=ON"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tLapack & Blas ${version["$group$index"]}\"
}
 
module-whatis \"Lapack & Blas ${version["$group$index"]}\"
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include
prepend-path LAPACK $prefix/${dirinstall["$group$index"]}
prepend-path BLAS $prefix/${dirinstall["$group$index"]}
"

#Lapack & Blas 3.8.0 Static lib
index=4
name["$group$index"]=lapack-blas
version["$group$index"]=3.8.0
details["$group$index"]="(static lib)"
url["$group$index"]=http://www.netlib.org/lapack/lapack-3.8.0.tar.gz
filename["$group$index"]=lapack-3.8.0.tar.gz
dirname["$group$index"]=lapack-3.8.0
builder["$group$index"]="cmake"
#dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="-DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=OFF -DLAPACKE=ON"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""


#Automake 1.16
#index=4
#name["$group$index"]=automake
#version["$group$index"]=1.16
#details["$group$index"]=""
#url["$group$index"]=http://ftp.gnu.org/gnu/automake/automake-1.16.tar.gz
#filename["$group$index"]=automake-1.16.tar.gz
#dirname["$group$index"]=automake-1.16
#builder["$group$index"]="configure"
#dependencies["$group$index"]=""
#dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
#args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]="#%Module1.0
#proc ModulesHelp { } {
#global dotversion
# 
#puts stderr \"\tAutomake ${version["$group$index"]}\"
#}
# 
#module-whatis \"Autoake ${version["$group$index"]}\"
#prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
#prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
#"

fi # old-version

if [ "$mpilib" != "none" ]; then # MPI-only

#Scalapack 2.1.0
index=5
name["$group$index"]=scalapack
version["$group$index"]=2.1.0
if [[ $compiler == "intel" ]]; then
	details["$group$index"]="(requires Intel MKL)"
fi
details["$group$index"]=""
url["$group$index"]="https://github.com/Reference-ScaLAPACK/scalapack/archive/v2.1.0.tar.gz -O scalapack-2.1.0.tar.gz"
filename["$group$index"]=scalapack-2.1.0.tar.gz
dirname["$group$index"]=scalapack-2.1.0
builder["$group$index"]="cmake"
dependencies["$group$index"]="$mpi_dep lapack-blas/$compilo/3.9.0"
dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
args["$group$index"]="-DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=ON -DLAPACK_LIBRARIES=$prefix/lapack-blas/$compilo/3.9.0/lib/liblapack.so"
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tScalapack ${version["$group$index"]}\"
}
 
module-whatis \"Scalapack ${version["$group$index"]}\"
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
"

fi # MPI-only

#Zlib 1.2.11
index=6
name["$group$index"]=zlib
version["$group$index"]=1.2.11
details["$group$index"]="(required by NetCDF)"
url["$group$index"]=http://zlib.net/zlib-1.2.11.tar.gz
filename["$group$index"]=zlib-1.2.11.tar.gz
dirname["$group$index"]=zlib-1.2.11
builder["$group$index"]="configure"
#dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0                                                                                                                                                                                                                                 
proc ModulesHelp { } {                                                                                                                                                                                                                      
global dotversion
 
puts stderr \"\tZlib ${version["$group$index"]}\"
}
 
module-whatis \"Zlib ${version["$group$index"]}\"
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include
"

#musl 1.2.0
index=7
name["$group$index"]=musl
version["$group$index"]=1.2.0
details["$group$index"]="(required by StaticX)"
url["$group$index"]=https://musl.libc.org/releases/musl-1.2.0.tar.gz
filename["$group$index"]=musl-1.2.0.tar.gz
dirname["$group$index"]=musl-1.2.0
builder["$group$index"]="configure"
#dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0                                                                                                                                                                                                                                 
proc ModulesHelp { } {                                                                                                                                                                                                                      
global dotversion
 
puts stderr \"\tMusl ${version["$group$index"]}\"
}
 
module-whatis \"Musl ${version["$group$index"]}\"
prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include
setenv BOOTLOADER_CC $prefix/${dirinstall["$group$index"]}/bin/musl-gcc
"



#!/bin/bash

#################################################################
#Group 2 : Default
group=2
groupname[$group]="Default librairies"

#Lapack & Blas 3.9.0 Dynamic lib
index=1
name["$group-$index"]=lapack-blas
version["$group-$index"]=3.9.0
mandatory["$group-$index"]=1
if [[ $compiler == "intel" ]]; then
	details["$group-$index"]="(dynamic lib - requires Intel MKL)"
else
	details["$group-$index"]="(static & dynamic lib)"
fi
url["$group-$index"]="https://github.com/Reference-LAPACK/lapack/archive/v3.9.0.tar.gz -O lapack-3.9.0.tar.gz"
filename["$group-$index"]=lapack-3.9.0.tar.gz
dirname["$group-$index"]=lapack-3.9.0
builder["$group-$index"]="lapack"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
patch_01["$group-$index"]="--- CMakeLists_original.txt	2019-11-21 08:57:43.000000000 +0100
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
patchfile_01["$group-$index"]="CMakeLists.txt"
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
index=2
name["$group-$index"]=lapack-blas
version["$group-$index"]=3.8.0
details["$group-$index"]="(static & dynamic lib)"
url["$group-$index"]=http://www.netlib.org/lapack/lapack-3.8.0.tar.gz
filename["$group-$index"]=lapack-3.8.0.tar.gz
dirname["$group-$index"]=lapack-3.8.0
builder["$group-$index"]="lapack"
#dependencies["$group-$index"]=""
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

# cmake 3.20.5
index=3
name["$group-$index"]=cmake
version["$group-$index"]=3.20.5
details["$group-$index"]=""
url["$group-$index"]="https://github.com/Kitware/CMake/releases/download/v3.20.5/cmake-3.20.5.tar.gz"
filename["$group-$index"]=cmake-3.20.5.tar.gz
dirname["$group-$index"]=cmake-3.20.5
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
index=4
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

# meson 0.58.1
index=5
name["$group-$index"]=meson
version["$group-$index"]=0.58.1
mandatory["$group-$index"]=1
details["$group-$index"]="(Python tool)"
url["$group-$index"]="https://github.com/mesonbuild/meson/archive/refs/tags/0.58.1.tar.gz -O meson-0.58.1.tar.gz"
filename["$group-$index"]=meson-0.58.1.tar.gz
dirname["$group-$index"]=meson-0.58.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# scikit-build 0.11.1
index=6
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
index=7
name["$group-$index"]=ninja
version["$group-$index"]=1.10.0.post2
mandatory["$group-$index"]=1
details["$group-$index"]="(Python tool)"
url["$group-$index"]="https://files.pythonhosted.org/packages/55/a3/56376f09d6be4be5b7ebfc492d3e89cb05206a61f8c5f695a5d1e8cc49b7/ninja-1.10.0.post2.tar.gz"
filename["$group-$index"]=ninja-1.10.0.post2.tar.gz
dirname["$group-$index"]=ninja-1.10.0.post2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python



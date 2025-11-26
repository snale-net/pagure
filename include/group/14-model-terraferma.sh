#!/bin/bash

#################################################################
#Group 14 : Model TERRAFERMA
group="14"
groupname[$group]="Model TERRAFERMA"

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# ulf tferma-v1.0
index=1
name["$group-$index"]=ulf
version["$group-$index"]=tferma-v1.0
details["$group-$index"]=""
url["$group-$index"]="https://bitbucket.org/tferma/ufl/get/tferma-v1.0.tar.gz -O ulf-tferma-v1.0.tar.gz"
filename["$group-$index"]=ulf-tferma-v1.0.tar.gz
dirname["$group-$index"]=tferma-ufl-4be59a69a0e3
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# sympy 1.1
index=2
name["$group-$index"]=sympy
version["$group-$index"]=1.1
details["$group-$index"]=""
url["$group-$index"]="https://github.com/sympy/sympy/releases/download/sympy-1.1/sympy-1.1.tar.gz"
filename["$group-$index"]=sympy-1.1.tar.gz
dirname["$group-$index"]=sympy-1.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# fiat tferma-v1.0
index=3
name["$group-$index"]=fiat
version["$group-$index"]=tferma-v1.0
details["$group-$index"]=""
url["$group-$index"]="https://bitbucket.org/tferma/fiat/get/tferma-v1.0.tar.gz -O fiat-tferma-v1.0.tar.gz"
filename["$group-$index"]=fiat-tferma-v1.0.tar.gz
dirname["$group-$index"]=tferma-fiat-1bc440ca34d4
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# fdijitso tferma-v1.0
index=4
name["$group-$index"]=fdijitso
version["$group-$index"]=tferma-v1.0
details["$group-$index"]=""
url["$group-$index"]="https://bitbucket.org/tferma/dijitso/get/tferma-v1.0.tar.gz -O fdijitso-tferma-v1.0.tar.gz"
filename["$group-$index"]=fdijitso-tferma-v1.0.tar.gz
dirname["$group-$index"]=tferma-dijitso-b2870d6aa72d
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# instant tferma-v1.0
index=5
name["$group-$index"]=instant
version["$group-$index"]=tferma-v1.0
details["$group-$index"]=""
url["$group-$index"]="https://bitbucket.org/tferma/instant/get/tferma-v1.0.tar.gz -O instant-tferma-v1.0.tar.gz"
filename["$group-$index"]=instant-tferma-v1.0.tar.gz
dirname["$group-$index"]=tferma-instant-fe9d528dc3ad
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# ffc tferma-v1.0
index=6
name["$group-$index"]=ffc
version["$group-$index"]=tferma-v1.0
details["$group-$index"]=""
url["$group-$index"]="https://bitbucket.org/tferma/ffc/get/tferma-v1.0.tar.gz -O ffc-tferma-v1.0.tar.gz"
filename["$group-$index"]=ffc-tferma-v1.0.tar.gz
dirname["$group-$index"]=tferma-ffc-7617aa4b0a2a
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# ply 3.11
index=7
name["$group-$index"]=ply
version["$group-$index"]=3.11
details["$group-$index"]=""
url["$group-$index"]="https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da/ply-3.11.tar.gz"
filename["$group-$index"]=ply-3.11.tar.gz
dirname["$group-$index"]=ply-3.11
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python

# Swig 3.0.12
index=8
name["$group-$index"]=swig
version["$group-$index"]=3.0.12
details["$group-$index"]=""
url["$group-$index"]="https://github.com/swig/swig/archive/refs/tags/v3.0.12.tar.gz -O swig-3.0.12.tar.gz" 
filename["$group-$index"]=swig-3.0.12.tar.gz
dirname["$group-$index"]=swig-3.0.12
builder["$group-$index"]="autogen"
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

prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"

if [ "$mpilib" != "none" ]; then # MPI-only

# Eigen 3.2.3
index=9
name["$group-$index"]=eigen
version["$group-$index"]=3.2.3
details["$group-$index"]="(with parallel)"
url["$group-$index"]="https://gitlab.com/libeigen/eigen/-/archive/3.2.3/eigen-3.2.3.tar.gz" 
filename["$group-$index"]=eigen-3.2.3.tar.gz
dirname["$group-$index"]=eigen-3.2.3
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cmake/$compilo/3.20.5 lapack-blas/$compilo/3.9.1 vtk/$compilo/7.1.1 boost/$mpilib/$pythonlib/$compilo/1.72.0 petsc/$mpilib/$pythonlib/$compilo/tferma-v1.0"
# flex/2.6.4 swig/3.0.11 VTK/7.1.1 hwloc/1.11.2 boost/openmpi/1.61.0
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-DMETIS_LIBRARIES=${PETSC_DIR}/lib/libmetis.so -DSCOTCH_LIBRARIES=${PETSC_DIR}/lib/libscotch.a"
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

#Dolfin tferma-v1.0
index=10
name["$group-$index"]=dolfin
version["$group-$index"]=tferma-v1.0
details["$group-$index"]="(with Petsc tferma-v1.0)"
url["$group-$index"]="https://bitbucket.org/tferma/dolfin/get/tferma-v1.0.tar.gz -O dolphin-tferma-v1.0.tar.gz"
filename["$group-$index"]=dolphin-tferma-v1.0.tar.gz
dirname["$group-$index"]=tferma-dolfin-75dc693dce68
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="$mpi_dep python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cmake/$compilo/3.20.5 swig/$compilo/3.0.12 lapack-blas/$compilo/3.9.1 vtk/$compilo/7.1.1 boost/$mpilib/$pythonlib/$compilo/1.72.0 petsc/$mpilib/$pythonlib/$compilo/tferma-v1.0 eigen/$mpilib/$compilo/3.2.3"
# flex/2.6.4 swig/3.0.11 hwloc/1.11.2
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-DCMAKE_BUILD_TYPE=RelWithDebInfo -DDOLFIN_ENABLE_CHOLMOD:BOOL=OFF -DDOLFIN_ENABLE_UMFPACK:BOOL=OFF -DDOLFIN_ENABLE_TRILINOS:BOOL=OFF -DDOLFIN_ENABLE_SLEPC:BOOL=OFF -DDOLFIN_ENABLE_TESTING:BOOL=OFF -DBOOST_ROOT=$prefix/boost/$mpilib/$pythonlib/$compilo/1.72.0 -DEIGEN3_INCLUDE_DIR=$prefix/eigen/$mpilib/$compilo/3.2.3/include/eigen3"
# PETSC4PY_INCLUDE_DIRS
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path PYTHONPATH $prefix/${dirinstall["$group-$index"]}/lib/python${pythonVersion}/site-packages:$prefix/${dirinstall["$group-$index"]}/lib/python${pythonVersion}/site-packages
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path DOLFIN_DIR $prefix/${dirinstall["$group-$index"]}
"

# Spud tferma-v1.0
index=11
name["$group-$index"]=spud
version["$group-$index"]=tferma-v1.0
details["$group-$index"]=""
url["$group-$index"]="https://github.com/FluidityProject/spud/archive/last-merge-into-fluidity-pre-subtree.tar.gz -O spud-9f53a5f.tar.gz"
filename["$group-$index"]=spud-9f53a5f.tar.gz
dirname["$group-$index"]=spud-last-merge-into-fluidity-pre-subtree
builder["$group-$index"]="spud-tferma-v1.0"
dependencies["$group-$index"]="$mpi_dep python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cmake/$compilo/3.20.5 swig/$compilo/3.0.12 lapack-blas/$compilo/3.9.1 vtk/$compilo/7.1.1 boost/$mpilib/$pythonlib/$compilo/1.72.0 petsc/$mpilib/$pythonlib/$compilo/tferma-v1.0 eigen/$mpilib/$compilo/3.2.3"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tSpud ${version["$group-$index"]}\"
}
 
module-whatis \"Spud ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
prepend-path SPUD_DIR $prefix/${dirinstall["$group-$index"]}
"

# TerraFerma 1.0.1
index=12
name["$group-$index"]=terraferma
version["$group-$index"]=1.0.1
details["$group-$index"]=""
url["$group-$index"]="https://github.com/TerraFERMA/TerraFERMA/archive/refs/tags/v1.0.1.tar.gz -O terraferma-1.0.1.tar.gz"
filename["$group-$index"]=terraferma-1.0.1.tar.gz
dirname["$group-$index"]=TerraFERMA-1.0.1
patch_01["$group-$index"]="*** buckettools/cpp/CMakeLists.txt.old	2019-08-05 17:35:56.846437189 +0200
--- buckettools/cpp/CMakeLists.txt	2019-08-05 17:36:35.771568717 +0200
***************
*** 57,66 ****
             ERROR_STRIP_TRAILING_WHITESPACE
             )
          if(GIT_ERR)
!            set(GIT_SHA git_log_not_found)
          endif(GIT_ERR)
      else(HAVE_GIT)
!         set(GIT_SHA git_not_found)
      endif(HAVE_GIT)
      configure_file(\${SRC} \${DST})
      \"
--- 57,66 ----
             ERROR_STRIP_TRAILING_WHITESPACE
             )
          if(GIT_ERR)
!            set(GIT_SHA "")
          endif(GIT_ERR)
      else(HAVE_GIT)
!         set(GIT_SHA "")
      endif(HAVE_GIT)
      configure_file(\${SRC} \${DST})
      \"

"
patchfile_01["$group-$index"]="buckettools/cpp/CMakeLists.txt"
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="$mpi_dep python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cmake/$compilo/3.20.5 lapack-blas/$compilo/3.9.1 vtk/$compilo/7.1.1 spud/$compilo/tferma-v1.0 boost/$mpilib/$pythonlib/$compilo/1.72.0 petsc/$mpilib/$pythonlib/$compilo/tferma-v1.0 dolfin/$mpilib/$compilo/tferma-v1.0"
#  hwloc/1.11.2 flex/2.6.4 swig/3.0.11
dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-DSPUD_INCLUDE_DIRS=$prefix/spud/$compilo/tferma-v1.0/include -DSPUD_LIBRARIES=$prefix/spud/$compilo/tferma-v1.0/lib/libspud.so"
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

prepend-path TF_CMAKE_PATH $prefix/${dirinstall["$group-$index"]}/share/terraferma/cpp
prepend-path CMAKE_MODULE_PATH $prefix/${dirinstall["$group-$index"]}/share/buckettools/cmake/modules
prepend-path PYTHONPATH $prefix/${dirinstall["$group-$index"]}/lib/python${pythonVersion}/site-packages
prepend-path DIAMOND_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/buckettools/diamond
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"

fi # end-MPI-only

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# mpmath 1.3.0
index=13
name["$group-$index"]=mpmath
version["$group-$index"]=1.3.0
details["$group-$index"]=""
url["$group-$index"]="https://files.pythonhosted.org/packages/e0/47/dd32fa426cc72114383ac549964eecb20ecfd886d1e5ccf5340b55b02f57/mpmath-1.3.0.tar.gz"
filename["$group-$index"]=mpmath-1.3.0.tar.gz
dirname["$group-$index"]=mpmath-1.3.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi # end-MPI-only

#!/bin/bash

#################################################################
#Group 8 : Model TerraFERMA v1.0
group=8
groupname[$group]="Model TerraFERMA v1.0"

# Petsc tferma-v1.0 (dynamic lib)
# compiled with OpenMPI 1.10.7
index=1
name["$group$index"]=petsc
version["$group$index"]=tferma-v1.0
details["$group$index"]="(dynamic lib)"
url["$group$index"]="https://bitbucket.org/tferma/petsc/get/tferma-v1.0.tar.gz -O petsc-tferma-v1.0.tar.gz"
filename["$group$index"]=petsc-tferma-v1.0.tar.gz
dirname["$group$index"]=tferma-petsc-111ef2698fa5
builder["$group$index"]="configure"
dependencies["$group$index"]="$mpi_dep"
dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
args["$group$index"]="--with-python --with-debugging=0 --known-mpi-shared-libraries=1 --with-c-support=1 --with-c++-support=1 --with-shared-libraries=1 --with-mpi=1 --with-lapack-lib=$prefix/lapack-blas/$compilo/3.8.0/lib/liblapack.so --with-blas-lib=$prefix/lapack-blas/$compilo/3.8.0/lib/libblas.so --download-suitesparse=1 --download-ml --download-blacs --download-scalapack --download-mumps --download-ptscotch --with-fortran-interfaces=1 --download-prometheus --download-parmetis --download-metis"
dirmodule["$group$index"]="${name["$group$index"]}/openmpi110/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tPetsc ${version["$group$index"]}\"
}
 
module-whatis \"Petsc ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
setenv PETSC_DIR $prefix/${dirinstall["$group$index"]}/
"

# Eigen 3.2.3
# compiled with Petsc tferma-v1.0
index=2
name["$group$index"]=eigen
version["$group$index"]=3.2.3
details["$group$index"]="with Petsc tferma-v1.0"
url["$group$index"]="https://bitbucket.org/eigen/eigen/get/3.2.3.tar.gz -O eigen-3.2.3.tar.gz" 
filename["$group$index"]=eigen-3.2.3.tar.gz
dirname["$group$index"]=eigen-eigen-36fd1ba04c12
builder["$group$index"]="cmake"
dependencies["$group$index"]="petsc/$mpilib/$compilo/tferma-v1.0"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="-DMETIS_LIBRARIES=${PETSC_DIR}/lib/libmetis.so -DSCOTCH_LIBRARIES=${PETSC_DIR}/lib/libscotch.a"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tEigen ${version["$group$index"]}\"
}
 
module-whatis \"Eigen ${version["$group$index"]}\"

prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# Spud last merge
index=3
name["$group$index"]=spud
version["$group$index"]=9f53a5f
details["$group$index"]=""
url["$group$index"]="https://github.com/FluidityProject/spud/archive/last-merge-into-fluidity-pre-subtree.tar.gz -O spud-9f53a5f.tar.gz"
filename["$group$index"]=spud-9f53a5f.tar.gz
dirname["$group$index"]=spud-last-merge-into-fluidity-pre-subtree
builder["$group$index"]="configure"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tSpud ${version["$group$index"]}\"
}
 
module-whatis \"Spud ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
prepend-path SPUD_DIR $prefix/${dirinstall["$group$index"]}
"

# ulf tferma-v1.0
index=4
name["$group$index"]=ulf
version["$group$index"]=tferma-v1.0
details["$group$index"]=""
url["$group$index"]="https://bitbucket.org/tferma/ufl/get/tferma-v1.0.tar.gz -O ulf-tferma-v1.0.tar.gz"
filename["$group$index"]=ulf-tferma-v1.0.tar.gz
dirname["$group$index"]=tferma-ufl-4be59a69a0e3
builder["$group$index"]="python"
dependencies["$group$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group$index"]="python-modules/$compilo"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# fiat tferma-v1.0
index=5
name["$group$index"]=fiat
version["$group$index"]=tferma-v1.0
details["$group$index"]=""
url["$group$index"]="https://bitbucket.org/tferma/fiat/get/tferma-v1.0.tar.gz -O fiat-tferma-v1.0.tar.gz"
filename["$group$index"]=fiat-tferma-v1.0.tar.gz
dirname["$group$index"]=tferma-fiat-1bc440ca34d4
builder["$group$index"]="python"
dependencies["$group$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group$index"]="python-modules/$compilo"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# fdijitso tferma-v1.0
index=6
name["$group$index"]=fdijitso
version["$group$index"]=tferma-v1.0
details["$group$index"]=""
url["$group$index"]="https://bitbucket.org/tferma/dijitso/get/tferma-v1.0.tar.gz -O fdijitso-tferma-v1.0.tar.gz"
filename["$group$index"]=fdijitso-tferma-v1.0.tar.gz
dirname["$group$index"]=tferma-dijitso-b2870d6aa72d
builder["$group$index"]="python"
dependencies["$group$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group$index"]="python-modules/$compilo"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# instant tferma-v1.0
index=7
name["$group$index"]=instant
version["$group$index"]=tferma-v1.0
details["$group$index"]=""
url["$group$index"]="https://bitbucket.org/tferma/instant/get/tferma-v1.0.tar.gz -O instant-tferma-v1.0.tar.gz"
filename["$group$index"]=instant-tferma-v1.0.tar.gz
dirname["$group$index"]=tferma-instant-fe9d528dc3ad
builder["$group$index"]="python"
dependencies["$group$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group$index"]="python-modules/$compilo"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# ffc tferma-v1.0
index=8
name["$group$index"]=ffc
version["$group$index"]=tferma-v1.0
details["$group$index"]=""
url["$group$index"]="https://bitbucket.org/tferma/ffc/get/tferma-v1.0.tar.gz -O ffc-tferma-v1.0.tar.gz"
filename["$group$index"]=ffc-tferma-v1.0.tar.gz
dirname["$group$index"]=tferma-ffc-7617aa4b0a2a
builder["$group$index"]="python"
dependencies["$group$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group$index"]="python-modules/$compilo"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# sympy 1.1
index=9
name["$group$index"]=sympy
version["$group$index"]=1.1
details["$group$index"]=""
url["$group$index"]="https://github.com/sympy/sympy/releases/download/sympy-1.1/sympy-1.1.tar.gz"
filename["$group$index"]=sympy-1.1.tar.gz
dirname["$group$index"]=sympy-1.1
builder["$group$index"]="python"
dependencies["$group$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group$index"]="python-modules/$compilo"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""


#Dolfin tferma-v1.0
index=10
name["$group$index"]=dolfin
version["$group$index"]=tferma-v1.0
details["$group$index"]="(with Petsc tferma-v1.0)"
url["$group$index"]="https://bitbucket.org/tferma/dolfin/get/tferma-v1.0.tar.gz -O dolphin-tferma-v1.0.tar.gz"
filename["$group$index"]=dolphin-tferma-v1.0.tar.gz
dirname["$group$index"]=tferma-dolfin-75dc693dce68
builder["$group$index"]="cmake"
dependencies["$group$index"]="$mpi_dep petsc/$mpilib/$compilo/tferma-v1.0 eigen/gcc74/3.2.3"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="-DCMAKE_BUILD_TYPE=RelWithDebInfo       -DDOLFIN_ENABLE_CHOLMOD:BOOL=OFF       -DDOLFIN_ENABLE_UMFPACK:BOOL=OFF       -DDOLFIN_ENABLE_TRILINOS:BOOL=OFF       -DDOLFIN_ENABLE_SLEPC:BOOL=OFF        -DMETIS_LIBRARY=${PETSC_DIR}/lib/libmetis.so       -DPARMETIS_INCLUDE_DIRS=${PETSC_DIR}/include       -DPARMETIS_LIBRARY=${PETSC_DIR}/lib/libparmetis.so       -DDOLFIN_ENABLE_TESTING:BOOL=ON       -DEIGEN3_INCLUDE_DIR=$prefix/eigen/$compilo/3.2.3/include/eigen3"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tDolfin ${version["$group$index"]}\"
}
 
module-whatis \"Dolfin ${version["$group$index"]}\"
puts \"source $prefix/${dirinstall["$group$index"]}/share/dolfin/dolfin.conf\"
"


# TerraFerma
index=11
name["$group$index"]=terraferma
version["$group$index"]=1.0
details["$group$index"]=""
url["$group$index"]="https://github.com/TerraFERMA/TerraFERMA/archive/v1.0.tar.gz -O terraferma-1.0.tar.gz"
filename["$group$index"]=terraferma-1.0.tar.gz
dirname["$group$index"]=TerraFERMA-1.0
patch["$group$index"]="*** buckettools/cpp/CMakeLists.txt.old	2019-08-05 17:35:56.846437189 +0200
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
!            set(GIT_SHA 0)
          endif(GIT_ERR)
      else(HAVE_GIT)
!         set(GIT_SHA 0)
      endif(HAVE_GIT)
      configure_file(\${SRC} \${DST})
      \"

"
patchfile["$group$index"]="buckettools/cpp/CMakeLists.txt"
builder["$group$index"]="cmake"
dependencies["$group$index"]="$mpi_dep petsc/$mpilib/$compilo/tferma-v1.0 spud/$compilo/9f53a5f eigen/$compilo/3.2.3 dolfin/$compilo/tferma-v1.0"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="-DSPUD_INCLUDE_DIRS=$SPUD_DIR/include -DSPUD_LIBRARIES=$SPUD_DIR/lib/libspud.so"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tTerraFerma ${version["$group$index"]}\"
}
 
module-whatis \"TerraFerma ${version["$group$index"]}\"

puts \"source $prefix/${dirinstall["$group$index"]}/share/terraferma/terraferma.conf\"
"



#!/bin/bash

#################################################################
#Group 9 : Model FLUIDITY
group=9
groupname[$group]="Model FLUIDITY"

# Petsc 3.4.5 (static lib)
# compiled with OpenMPI 1.10.7
index=1
name["$group$index"]=petsc
version["$group$index"]=3.4.5
details["$group$index"]="(static lib - compiled with OpenMPI 1.10.7)"
url["$group$index"]=http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-3.4.5.tar.gz
filename["$group$index"]=petsc-3.4.5.tar.gz
dirname["$group$index"]=petsc-3.4.5
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi110/$compilo/${version["$group$index"]}"
args["$group$index"]="--with-python --with-debugging=0 --known-mpi-shared-libraries=1 --with-c-support=1 --with-c++-support=1 --with-shared-libraries=0 --with-pic=fpic --with-mpi=1 --with-lapack-lib=$prefix/lapack-blas/$compilo/3.8.0/lib/liblapack.so --with-blas-lib=$prefix/lapack-blas/$compilo/3.8.0/lib/libblas.so --download-suitesparse=1 --download-ml --download-blacs --download-scalapack --download-mumps --download-ptscotch --download-hypre --with-fortran-interfaces=1 --download-prometheus --download-parmetis --download-metis"
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

# Petsc 3.4.5 (dynamic lib)
# compiled with OpenMPI 1.10.7
index=2
name["$group$index"]=petsc
version["$group$index"]=3.4.5
details["$group$index"]="(dynamic lib - compiled with OpenMPI 1.10.7)"
url["$group$index"]=http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-3.4.5.tar.gz
filename["$group$index"]=petsc-3.4.5.tar.gz
dirname["$group$index"]=petsc-3.4.5
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi110/$compilo/${version["$group$index"]}"
args["$group$index"]="--with-python --with-debugging=0 --known-mpi-shared-libraries=1 --with-c-support=1 --with-c++-support=1 --with-shared-libraries=1 --with-mpi=1 --with-lapack-lib=$prefix/lapack-blas/$compilo/3.8.0/lib/liblapack.so --with-blas-lib=$prefix/lapack-blas/$compilo/3.8.0/lib/libblas.so --download-suitesparse=1 --download-ml --download-blacs --download-scalapack --download-mumps --download-ptscotch --download-hypre --with-fortran-interfaces=1 --download-prometheus --download-parmetis --download-metis"
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

# Petsc 3.11.3 (static lib)
# compiled with OpenMPI 1.10.7
index=3
name["$group$index"]=petsc
version["$group$index"]=3.11.3
details["$group$index"]="(static lib - compiled with OpenMPI 1.10.7)"
url["$group$index"]=http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-3.11.3.tar.gz
filename["$group$index"]=petsc-3.11.3.tar.gz
dirname["$group$index"]=petsc-3.11.3
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi110/$compilo/${version["$group$index"]}"
args["$group$index"]="--with-python --with-debugging=0 --known-mpi-shared-libraries=1 --with-c-support=1 --with-c++-support=1 --with-shared-libraries=0 --with-pic=fpic --with-mpi=1 --with-lapack-lib=$prefix/lapack-blas/$compilo/3.8.0/lib/liblapack.so --with-blas-lib=$prefix/lapack-blas/$compilo/3.8.0/lib/libblas.so --download-suitesparse=1 --download-ml --download-blacs --download-scalapack --download-mumps --download-ptscotch --download-hypre --with-fortran-interfaces=1 --download-prometheus --download-parmetis --download-metis"
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

# Petsc 3.11.3 (dynamic lib)
# compiled with OpenMPI 1.10.7
index=4
name["$group$index"]=petsc
version["$group$index"]=3.11.3
details["$group$index"]="(dynamic lib - compiled with OpenMPI 1.10.7)"
url["$group$index"]=http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-3.11.3.tar.gz
filename["$group$index"]=petsc-3.11.3.tar.gz
dirname["$group$index"]=petsc-3.11.3
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi110/$compilo/${version["$group$index"]}"
args["$group$index"]="--with-python --with-debugging=0 --known-mpi-shared-libraries=1 --with-c-support=1 --with-c++-support=1 --with-shared-libraries=1 --with-mpi=1 --with-lapack-lib=$prefix/lapack-blas/$compilo/3.8.0/lib/liblapack.so --with-blas-lib=$prefix/lapack-blas/$compilo/3.8.0/lib/libblas.so --download-suitesparse=1 --download-ml --download-blacs --download-scalapack --download-mumps --download-ptscotch --download-hypre --with-fortran-interfaces=1 --download-prometheus --download-parmetis --download-metis"
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

# Zoltan 3.83
# compiled with OpenMPI 1.10.7
# compiled with Petsc 3.4.5
index=5
name["$group$index"]=zoltan
version["$group$index"]=3.83
details["$group$index"]="(compiled with OpenMPI 1.10.7 and Petsc 3.4.5)"
url["$group$index"]=http://www.cs.sandia.gov/~kddevin/Zoltan_Distributions/zoltan_distrib_v3.83.tar.gz
filename["$group$index"]=zoltan_distrib_v3.83.tar.gz
dirname["$group$index"]=Zoltan_v3.83
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7 petsc/openmpi110/$compilo/3.4.5"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi110/petsc34/$compilo/${version["$group$index"]}"
args["$group$index"]="--enable-mpi --with-mpi-compilers  --with-gnumake --enable-f90interface --enable-zoltan-cppdriver --disable-examples --with-scotch --with-scotch-incdir=$prefix/petsc/openmpi110/$compilo/3.4.5/include --with-scotch-libdir=$prefix/petsc/openmpi110/$compilo/3.4.5/lib --with-parmetis --with-parmetis-incdir=$prefix/petsc/openmpi110/$compilo/3.4.5/include --with-parmetis-libdir=$prefix/petsc/openmpi110/$compilo/3.4.5/lib"
dirmodule["$group$index"]="${name["$group$index"]}/openmpi110/petsc34/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tZoltan ${version["$group$index"]}\"
}
 
module-whatis \"Zoltan ${version["$group$index"]}\"

prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# Zoltan 3.83
# compiled with OpenMPI 1.10.7
# compiled with Petsc 3.11.3
index=6
name["$group$index"]=zoltan
version["$group$index"]=3.83
details["$group$index"]="(compiled with OpenMPI 1.10.7 and Petsc 3.11.3)"
url["$group$index"]=http://www.cs.sandia.gov/~kddevin/Zoltan_Distributions/zoltan_distrib_v3.83.tar.gz
filename["$group$index"]=zoltan_distrib_v3.83.tar.gz
dirname["$group$index"]=Zoltan_v3.83
builder["$group$index"]="configure"
dependencies["$group$index"]="openmpi/$compilo/1.10.7 petsc/openmpi110/$compilo/3.11.3"
dirinstall["$group$index"]="${name["$group$index"]}/openmpi110/petsc311/$compilo/${version["$group$index"]}"
args["$group$index"]="--enable-mpi --with-mpi-compilers  --with-gnumake --enable-f90interface --enable-zoltan-cppdriver --disable-examples --with-scotch --with-scotch-incdir=$prefix/petsc/openmpi110/$compilo/3.11.3/include --with-scotch-libdir=$prefix/petsc/openmpi110/$compilo/3.11.3/lib --with-parmetis --with-parmetis-incdir=$prefix/petsc/openmpi110/$compilo/3.11.3/include --with-parmetis-libdir=$prefix/petsc/openmpi110/$compilo/3.11.3/lib"
dirmodule["$group$index"]="${name["$group$index"]}/openmpi110/petsc311/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tZoltan ${version["$group$index"]}\"
}
 
module-whatis \"Zoltan ${version["$group$index"]}\"

prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"



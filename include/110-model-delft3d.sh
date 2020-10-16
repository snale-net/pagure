#!/bin/bash

#################################################################
#Group 110 : Model Delft3D
group=110
groupname[$group]="Model Delft3D"

# Udunits 2.2.25
index=1
name["$group$index"]=udunits
version["$group$index"]=2.2.25
details["$group$index"]="(required for GDAL)"
url["$group$index"]=ftp://ftp.unidata.ucar.edu/pub/udunits/udunits-2.2.25.tar.gz
filename["$group$index"]=udunits-2.2.25.tar.gz
dirname["$group$index"]=udunits-2.2.25
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tUdunits ${version["$group$index"]}\"
}
 
module-whatis \"Udunits ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# Proj 6.3.1
index=2
name["$group$index"]=proj
version["$group$index"]=6.3.1
details["$group$index"]="(required for GDAL)"
url["$group$index"]="https://github.com/OSGeo/PROJ/archive/6.3.1.tar.gz -O proj-6.3.1.tar.gz"
filename["$group$index"]=proj-6.3.1.tar.gz
dirname["$group$index"]=PROJ-6.3.1
builder["$group$index"]="cmake"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]=""
else
	dependencies["$group$index"]="$mpi_dep"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tProj ${version["$group$index"]}1\"
}
 
module-whatis \"Proj ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/p${dirinstall["$group$index"]}/include 
"

# GDAL 3.0.4
index=3
name["$group$index"]=gdal
version["$group$index"]=3.0.4
details["$group$index"]=""
url["$group$index"]="https://github.com/OSGeo/gdal/releases/download/v3.0.4/gdal-3.0.4.tar.gz"
filename["$group$index"]=gdal-3.0.4.tar.gz
dirname["$group$index"]=gdal-3.0.4
builder["$group$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.25 proj/$compilo/6.3.1"
else
	dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.25 proj/$compilo/6.3.1"
fi
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]="--with-proj=$prefix/proj/$compilo/6.3.1" 
#LDFLAGS=-lmpi_cxx"
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tGdal ${version["$group$index"]}1\"
}
 
module-whatis \"Gdal ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include  
"

# Metis 5.1.0
index=4
name["$group$index"]=metis
version["$group$index"]=5.1.0
details["$group$index"]="(sequential version)"
url["$group$index"]=http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz
filename["$group$index"]=metis-5.1.0.tar.gz
dirname["$group$index"]=metis-5.1.0
builder["$group$index"]="metis"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tMetis ${version["$group$index"]}\"
}
 
module-whatis \"Metis ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

if [ "$mpilib" != "none" ]; then # MPI-only

# ParMetis 4.0.3
index=5
name["$group$index"]=parmetis
version["$group$index"]=4.0.3
details["$group$index"]="(parallel version)"
url["$group$index"]=http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/parmetis-4.0.3.tar.gz
filename["$group$index"]=parmetis-4.0.3.tar.gz
dirname["$group$index"]=parmetis-4.0.3
patch_01["$group$index"]="--- CMakeLists_original.txt	2013-03-30 17:24:50.000000000 +0100
+++ CMakeLists.txt	2020-03-26 13:00:59.542544000 +0100
@@ -31,10 +31,10 @@
 include_directories(\${MPI_INCLUDE_PATH})
 include_directories(\${GKLIB_PATH})
 include_directories(\${METIS_PATH}/include)
+link_directories(\${METIS_PATH}/lib)
 
 # List of directories that cmake will look for CMakeLists.txt
-add_subdirectory(\${METIS_PATH}/libmetis \${CMAKE_BINARY_DIR}/libmetis)
 add_subdirectory(include)
 add_subdirectory(libparmetis)
 add_subdirectory(programs)
"
patchfile_01["$group$index"]="CMakeLists.txt"
patch_02["$group$index"]="--- CMakeLists_original.txt	2020-03-26 14:13:03.666727000 +0100
+++ CMakeLists.txt	2020-03-26 14:16:28.082736398 +0100
@@ -5,7 +5,7 @@
 # Create libparmetis
 add_library(parmetis \${ParMETIS_LIBRARY_TYPE} \${parmetis_sources})
 # Link with metis and MPI libraries.
-target_link_libraries(parmetis metis \${MPI_LIBRARIES})
+target_link_libraries(parmetis metis \${MPI_LIBRARIES} m)
 set_target_properties(parmetis PROPERTIES LINK_FLAGS \"\${MPI_LINK_FLAGS}\")
 
 install(TARGETS parmetis
"
patchfile_02["$group$index"]="libparmetis/CMakeLists.txt"
builder["$group$index"]="parmetis"
dependencies["$group$index"]="$mpi_dep metis/$compilo/5.1.0"
dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
if [[ $mpilib == intel* ]] ; then
	args["$group$index"]="metis_path=$prefix/metis/$compilo/5.1.0 cc=mpiicc cxx=mpiicpc"
elif [[ $mpilib == mpich* ]] ; then
	args["$group$index"]="metis_path=$prefix/metis/$compilo/5.1.0 cc=mpicc cxx=mpic++"	
elif [[ $mpilib == openmpi* ]] ; then	
	args["$group$index"]="metis_path=$prefix/metis/$compilo/5.1.0 cc=mpicc cxx=mpic++"	
fi
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tParMetis ${version["$group$index"]}\"
}
 
module-whatis \"ParMetis ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

fi # MPI-only

# Petsc 3.4.5 (dynamic lib)
# compiled with OpenMPI 1.10.7
index=6
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

# Shapelib 1.5.0
index=7
name["$group$index"]=shapelib
version["$group$index"]=1.5.0
details["$group$index"]=""
url["$group$index"]="http://download.osgeo.org/shapelib/shapelib-1.5.0.zip"
filename["$group$index"]=shapelib-1.5.0.zip
dirname["$group$index"]=shapelib-1.5.0
builder["$group$index"]="configure"
dependencies["$group$index"]="proj/$compilo/6.3.1"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tShapelib ${version["$group$index"]}\"
}
 
module-whatis \"Shapelib ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# Delft3D v6.03
index=8
name["$group$index"]=delft3d
version["$group$index"]=6.03
details["$group$index"]=""
url["$group$index"]=localfile
filename["$group$index"]=delft3d-6.03.zip
dirname["$group$index"]=delft3d-6.03/src
if [ "$system" == "suse" ]; then
configfile["$group$index"]="#include \"meminfo.h\"
//#if HAVE_CONFIG_H
//#include <sys/sysctl.h>
//#endif

#ifdef WIN32

unsigned __int64 MemInfo::GetTotalMemSize()
{
  MEMORYSTATUSEX status;
  status.dwLength = sizeof(status);
  GlobalMemoryStatusEx(&status);
  return unsigned __int64 (status.ullTotalPhys);
}
#elif defined(_SC_PHYS_PAGES)
unsigned long long MemInfo::GetTotalMemSize()
{
long long pages = sysconf(_SC_PHYS_PAGES);
long long page_size = sysconf(_SC_PAGE_SIZE);
return (pages * page_size);
}

#else
unsigned long long MemInfo::GetTotalMemSize()
{
int mib[2];
size_t len;
long long totalphys64;

mib[0] = CTL_HW;
mib[1] = HW_MEMSIZE; /* gives a 64 bit int */
len = sizeof(totalphys64);
sysctl(mib, 2, &totalphys64, &len, NULL, 0);
return totalphys64;
}
#endif"
configfilename["$group$index"]="utils_lgpl/deltares_common/packages/deltares_common_c/src/meminfo.cpp"
fi
builder["$group$index"]="delft3d-builder"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 netcdf-fortran/hdf5.110/$mpilib/$compilo/4.5.2"
dirinstall["$group$index"]=${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}
args["$group$index"]="--with-netcdf --with-mpi"
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tDelft 3D ${version["$group$index"]}\"
}
 
module-whatis \"Delft 3D ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
"




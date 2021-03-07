#!/bin/bash

#################################################################
#Group 8 : Model TELEMAC
group=8
groupname[$group]="Model TELEMAC"

if [ "$mpilib" != "none" ]; then # MPI-only

# MED-4.0.0
index=1
name["$group$index"]=med
version["$group$index"]=4.0.0
details["$group$index"]=""
url["$group$index"]=http://files.salome-platform.org/Salome/other/med-4.0.0.tar.gz
filename["$group$index"]=med-4.0.0.tar.gz
dirname["$group$index"]=med-4.0.0
builder["$group$index"]="configure"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5"
dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
if [[ $mpilib == intel* ]] ; then
	args["$group$index"]="--with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 --disable-python CC=mpiicc CXX=mpiicpc F77=mpiifort FC=mpiifort"
elif [[ $mpilib == mpich* ]] ; then
	args["$group$index"]="--with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 --disable-python CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"	
elif [[ $mpilib == openmpi* ]] ; then	
	args["$group$index"]="--with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5 --disable-python CC=mpicc CXX=mpic++ F77=mpif90 FC=mpif90"	
fi
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tMED ${version["$group$index"]}\"
}
 
module-whatis \"MED ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

fi # MPI-only

# AED2-1.3.0
index=2
name["$group$index"]=aed2
version["$group$index"]=1.3.0
details["$group$index"]=""
url["$group$index"]="https://github.com/AquaticEcoDynamics/libaed2/archive/v1.3.0.tar.gz -O aed2-1.3.0.tar.gz"
filename["$group$index"]=aed2-1.3.0.tar.gz
dirname["$group$index"]=libaed2-1.3.0
builder["$group$index"]="aed2" 
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tAED2 ${version["$group$index"]}\"
}
 
module-whatis \"AED2 ${version["$group$index"]}\"

prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# Metis 5.1.0
index=3
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
index=4
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

# Scotch 6.0.9
index=5
name["$group$index"]=scotch
version["$group$index"]=6.0.9
details["$group$index"]="(sequential version)"
url["$group$index"]=https://gforge.inria.fr/frs/download.php/file/38187/scotch_6.0.9.tar.gz
filename["$group$index"]=scotch_6.0.9.tar.gz
dirname["$group$index"]=scotch_6.0.9
builder["$group$index"]="scotch"
dependencies["$group$index"]="metis/$compilo/5.1.0 parmetis/$mpilib/$compilo/4.0.3"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
configfilename["$group$index"]="src/Makefile.inc"
if [[ $compiler == "intel" ]]; then
configfile["$group$index"]="EXE		=
LIB		= .so
OBJ		= .o

MAKE		= make
AR		= icc
ARFLAGS	= -shared -fPIC -o
CAT		= cat
CCS		= icc
CCP		= mpiicc
MPI_INC         = \$(shell mpiicc -show | sed -e 's/.*\(\-I.*include\).*/\1/')
CCD		= icc \$(MPI_INC)
CFLAGS		= -O3 -fPIC -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_PTHREAD -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DSCOTCH_PTHREAD -DSCOTCH_METIS_VERSION=0 -restrict -DIDXSIZE64
CLIBFLAGS	=
LDFLAGS	= -lz -lm -lrt -pthread
CP		= cp
LEX		= flex -Pscotchyy -olex.yy.c
LN		= ln
MKDIR		= mkdir -p
MV		= mv
RANLIB		= chmod +x
YACC		= bison -pscotchyy -y -b y
"
else
configfile["$group$index"]="EXE		=
LIB		= .so
OBJ		= .o

MAKE		= make
AR		= gcc
ARFLAGS	= -shared -fPIC -o 
CAT		= cat
CCS		= gcc
CCP		= mpicc
CCD		= gcc
CFLAGS		= -O3 -fPIC -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_PTHREAD -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DSCOTCH_PTHREAD -DSCOTCH_METIS_VERSION=0 -Drestrict=__restrict -DIDXSIZE64
CLIBFLAGS	=
LDFLAGS	= -lz -lm -lrt -pthread
CP		= cp
LEX		= flex -Pscotchyy -olex.yy.c
LN		= ln
MKDIR		= mkdir -p
MV		= mv
RANLIB		= chmod +x
YACC		= bison -pscotchyy -y -b y
"
fi
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tSctoch ${version["$group$index"]}\"
}
 
module-whatis \"Sctoch ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

if [ "$mpilib" != "none" ]; then # MPI-only

# PtScotch 6.0.9
index=6
name["$group$index"]=ptscotch
version["$group$index"]=6.0.9
details["$group$index"]="(parallel version)"
url["$group$index"]=https://gforge.inria.fr/frs/download.php/file/38187/scotch_6.0.9.tar.gz
filename["$group$index"]=scotch_6.0.9.tar.gz
dirname["$group$index"]=scotch_6.0.9
builder["$group$index"]="ptscotch"
dependencies["$group$index"]="$mpi_dep metis/$compilo/5.1.0 parmetis/$mpilib/$compilo/4.0.3"
dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
configfilename["$group$index"]="src/Makefile.inc"
if [[ $compiler == "intel" ]]; then
configfile["$group$index"]="EXE		=
LIB		= .so
OBJ		= .o

MAKE		= make
AR		= \$(MPICC)
ARFLAGS	= -shared -fPIC -o 
CAT		= cat
CCS		= \$(MPICC)
CCP		= \$(MPICC)
MPI_INC         = \$(shell \$(MPICC) -show | sed -e 's/.*\(\-I.*include\).*/\1/')
CCD		= \$(MPICC) \$(MPI_INC)
CFLAGS		= -O3 -fPIC -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_PTHREAD -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DSCOTCH_PTHREAD -DSCOTCH_METIS_VERSION=0 -restrict -DIDXSIZE64
CLIBFLAGS	=
LDFLAGS	= -lz -lm -lrt -pthread
CP		= cp
LEX		= flex -Pscotchyy -olex.yy.c
LN		= ln
MKDIR		= mkdir -p
MV		= mv
RANLIB		= chmod +x
YACC		= bison -pscotchyy -y -b y
"
else
configfile["$group$index"]="EXE		=
LIB		= .so
OBJ		= .o

MAKE		= make
AR		= \$(MPICC)
ARFLAGS	= -shared -fPIC -o 
CAT		= cat
CCS		= \$(MPICC)
CCP		= \$(MPICC)
CCD		= \$(MPICC)
CFLAGS		= -O3 -fPIC -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_PTHREAD -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DSCOTCH_PTHREAD -DSCOTCH_METIS_VERSION=0 -Drestrict=__restrict -DIDXSIZE64
CLIBFLAGS	=
LDFLAGS	= -lz -lm -lrt -pthread
CP		= cp
LEX		= flex -Pscotchyy -olex.yy.c
LN		= ln
MKDIR		= mkdir -p
MV		= mv
RANLIB		= chmod +x
YACC		= bison -pscotchyy -y -b y
"
fi
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tPtSctoch ${version["$group$index"]}\"
}
 
module-whatis \"PtSctoch ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

fi # MPI-only

if [ "$mpilib" != "none" ]; then # MPI-only

# MUMPS 5.2.1
index=7
name["$group$index"]=mumps
version["$group$index"]=5.2.1
url["$group$index"]=http://mumps.enseeiht.fr/MUMPS_5.2.1.tar.gz
filename["$group$index"]=MUMPS_5.2.1.tar.gz
dirname["$group$index"]=MUMPS_5.2.1
builder["$group$index"]="mumps"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 lapack-blas/$compilo/3.9.0 scalapack/$mpilib/$compilo/2.1.0 metis/$compilo/5.1.0 parmetis/$mpilib/$compilo/4.0.3 scotch/$compilo/6.0.9 ptscotch/$mpilib/$compilo/6.0.9"
dirinstall["$group$index"]="${name["$group$index"]}/$mpilib/$compilo/${version["$group$index"]}"
configfilename["$group$index"]="Makefile.inc"
if [[ $compiler == "intel" ]]; then
details["$group$index"]="(dynamic lib - require Intel MKL)"
configfile["$group$index"]="#
#  This file is part of MUMPS 5.2.1, released
#  on Fri Jun 14 14:46:05 UTC 2019
#
#Begin orderings

SCOTCHDIR  = $prefix/scotch/$compilo/6.0.9
PTSCOTCHDIR  = $prefix/ptscotch/$mpilib/$compilo/6.0.9
ISCOTCH    = -I\$(SCOTCHDIR)/include -I\$(PTSCOTCHDIR)/include
LSCOTCH    = -L\$(PTSCOTCHDIR)/lib -lesmumps -lptscotch -lptscotcherr -L\$(SCOTCHDIR)/lib  -lptesmumps -lscotch -lscotcherr

LPORDDIR = \$(topdir)/PORD/lib/
IPORD    = -I\$(topdir)/PORD/include/
LPORD    = -L\$(LPORDDIR) -lpord

LMETISDIR = $prefix/metis/$compilo/5.1.0
LPARMETISDIR = $prefix/parmetis/$mpilib/$compilo/4.0.3
IMETIS    = -I\$(LMETISDIR)/include -I\$(LPARMETISDIR)/include

LMETIS    = -L\$(LMETISDIR)/lib -L\$(LPARMETISDIR)/lib -lparmetis -lmetis

ORDERINGSF = -Dscotch -Dmetis -Dpord -Dptscotch -Dparmetis
ORDERINGSC  = \$(ORDERINGSF)

LORDERINGS = \$(LMETIS) \$(LPORD) \$(LSCOTCH)
IORDERINGSF = \$(ISCOTCH)
IORDERINGSC = \$(IMETIS) \$(IPORD) \$(ISCOTCH)

#End orderings
########################################################################
################################################################################

PLAT    =
LIBEXT  = .so
OUTC    = -o 
OUTF    = -o 
RM = /bin/rm -f
CC = \$(MPICC)
FC = \$(MPIF90)
FL = \$(MPIF90)
AR = \$(MPICC) -shared -fPIC \$(LMETIS) \$(LSCOTCH) -o 
RANLIB  = chmod +x
# Make this variable point to the path where the Intel MKL library is
# installed. It is set to the default install directory for Intel MKL.
LAPACK = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core
SCALAP = -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64

LIBPAR = \$(SCALAP) \$(LAPACK)

INCSEQ = -I\$(topdir)/libseq
LIBSEQ  = \$(LAPACK) -L\$(topdir)/libseq -lmpiseq

LIBBLAS = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core 
LIBOTHERS = -lpthread -lz

#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
OPTF    = -O -nofor_main -DBLR_MT -qopenmp -DGEMMT_AVAILABLE -fPIC
OPTL    = -O -nofor_main -qopenmp -fPIC
OPTC    = -O -qopenmp -fPIC
#End Optimized options
 
INCS = \$(INCPAR)
LIBS = \$(LIBPAR)
LIBSEQNEEDED =
"
else
details["$group$index"]="(dynamic lib)"
configfile["$group$index"]="#
#  This file is part of MUMPS 5.2.1, released
#  on Fri Jun 14 14:46:05 UTC 2019
#Begin orderings

SCOTCHDIR  = $prefix/scotch/$compilo/6.0.9
PTSCOTCHDIR  = $prefix/ptscotch/$mpilib/$compilo/6.0.9
ISCOTCH    = -I\$(SCOTCHDIR)/include -I\$(PTSCOTCHDIR)/include
LSCOTCH    = -L\$(SCOTCHDIR)/lib -lesmumps -lscotch -lscotcherr -L\$(PTSCOTCHDIR)/lib -lptesmumps -lptscotch -lptscotcherr

LPORDDIR = \$(topdir)/PORD/lib/
IPORD    = -I\$(topdir)/PORD/include/
LPORD    = -L\$(LPORDDIR) -lpord

LMETISDIR = $prefix/metis/$compilo/5.1.0
LPARMETISDIR = $prefix/parmetis/$mpilib/$compilo/4.0.3
IMETIS    = -I\$(LMETISDIR)/include -I\$(LPARMETISDIR)/include

LMETIS    = -L\$(LMETISDIR)/lib -L\$(LPARMETISDIR)/lib -lparmetis -lmetis

ORDERINGSF = -Dscotch -Dmetis -Dpord -Dptscotch -Dparmetis
ORDERINGSC  = \$(ORDERINGSF)

LORDERINGS = \$(LMETIS) \$(LPORD) \$(LSCOTCH)
IORDERINGSF = \$(ISCOTCH)
IORDERINGSC = \$(IMETIS) \$(IPORD) \$(ISCOTCH)

#End orderings
################################################################################

PLAT    =
LIBEXT  = .so
OUTC    = -o 
OUTF    = -o 
RM = /bin/rm -f
CC = \$(MPICC)
FC = \$(MPIF90)
FL = \$(MPIF90)
AR = \$(MPICC) -shared -fPIC  \$(LMETIS) \$(LSCOTCH) -o 
RANLIB = chmod +x 
LAPACK = -llapack
SCALAP  = -lscalapack

INCPAR = # not needed with mpif90/mpicc:  -I/usr/include/openmpi

LIBPAR = \$(SCALAP) \$(LAPACK) # not needed with mpif90/mpicc: -lmpi_mpifh -lmpi

INCSEQ = -I\$(topdir)/libseq
LIBSEQ  = \$(LAPACK) -L\$(topdir)/libseq -lmpiseq

LIBBLAS = -lblas
LIBOTHERS = -lpthread -lz

#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
OPTF    = -O -fopenmp -fPIC
OPTL    = -O -fopenmp -fPIC
OPTC    = -O -fopenmp -fPIC
#End Optimized options
 
INCS = \$(INCPAR)
LIBS = \$(LIBPAR)
LIBSEQNEEDED =
"
fi
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tMUMPS ${version["$group$index"]}\"
}
 
module-whatis \"MUMPS ${version["$group$index"]}\"

prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

fi # MPI-only


#!/bin/bash

#################################################################
#Group 9 : Model SWAN
group=9
groupname[$group]="Model SWAN"

# SWAN
index=1
name["$group$index"]=swan
version["$group$index"]=41.31
details["$group$index"]=""
url["$group$index"]=http://swanmodel.sourceforge.net/download/zip/swan4131.tar.gz
filename["$group$index"]=swan4131.tar.gz
dirname["$group$index"]=swan4131
builder["$group$index"]="swan-builder"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 netcdf-fortran/hdf5.110/$mpilib/$compilo/4.5.2"
dirinstall["$group$index"]="src/swan4131"
configfilename["$group$index"]="macros.inc"
if [[ $compiler == "intel" ]]; then
configfile["$group$index"]="##############################################################################
# IA32_Intel/x86-64_Intel:      Intel Pentium with Linux using Intel compiler.
##############################################################################
F90_SER = ifort
F90_OMP = ifort
F90_MPI = \$(MPIF90)
FLAGS_OPT = -O2
FLAGS_MSC = -W0 -assume byterecl -traceback -diag-disable 8290 -diag-disable 8291
FLAGS90_MSC = \$(FLAGS_MSC)
FLAGS_DYN = -fPIC
FLAGS_SER = 
FLAGS_OMP = -qopenmp
NETCDFROOT = $prefix/netcdf/hdf5.110/$mpilib/$compilo/fortran/4.5.2
ifneq (\$(NETCDFROOT),)
  INCS_SER = -I\$(NETCDFROOT)/include
  INCS_OMP = -I\$(NETCDFROOT)/include
  INCS_MPI = -I\$(NETCDFROOT)/include
  LIBS_SER = -L\$(NETCDFROOT)/lib -lnetcdf -lnetcdff
  LIBS_OMP = -L\$(NETCDFROOT)/lib -lnetcdf -lnetcdff -static-libgcc
  LIBS_MPI = -L\$(NETCDFROOT)/lib -lnetcdf -lnetcdff
  NCF_OBJS = nctablemd.o agioncmd.o swn_outnc.o
else
  INCS_SER =
  INCS_OMP =
  INCS_MPI =
  LIBS_SER =
  LIBS_OMP = -static-libgcc
  LIBS_MPI =
  NCF_OBJS =
endif
O_DIR = ../work/odir4/
OUT = -o
EXTO = o
MAKE = make
RM = rm -f
ifneq (\$(NETCDFROOT),)
  swch = -unix -netcdf
else
  swch = -unix
endif
"
else
configfile["$group$index"]="##############################################################################
# IA32_GNU:             Intel Pentium with Linux using GNU compiler gfortran.
##############################################################################
F90_SER = gfortran
F90_OMP = gfortran
F90_MPI = \$(MPIF90)
FLAGS_OPT = -O
FLAGS_MSC = -w -fno-second-underscore
FLAGS90_MSC = \$(FLAGS_MSC) -ffree-line-length-none
FLAGS_DYN =
FLAGS_SER =
FLAGS_OMP = -fopenmp
FLAGS_MPI =
NETCDFROOT = $prefix/netcdf/hdf5.110/$mpilib/$compilo/fortran/4.5.2
ifneq (\$(NETCDFROOT),)
  INCS_SER = -I\$(NETCDFROOT)/include
  INCS_OMP = -I\$(NETCDFROOT)/include
  INCS_MPI = -I\$(NETCDFROOT)/include
  LIBS_SER = -L\$(NETCDFROOT)/lib -lnetcdf -lnetcdff
  LIBS_OMP = -L\$(NETCDFROOT)/lib -lnetcdf -lnetcdff -static-libgcc
  LIBS_MPI = -L\$(NETCDFROOT)/lib -lnetcdf -lnetcdff
  NCF_OBJS = nctablemd.o agioncmd.o swn_outnc.o
else
  INCS_SER =
  INCS_OMP =
  INCS_MPI =
  LIBS_SER =
  LIBS_OMP = -static-libgcc
  LIBS_MPI =
  NCF_OBJS =
endif
O_DIR = ../work/odir4/
OUT = -o
EXTO = o
MAKE = make
RM = rm -f
ifneq (\$(NETCDFROOT),)
  swch = -unix -netcdf
else
  swch = -unix
endif
"
fi
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$mpilib/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tSwan ${version["$group$index"]}\"
}
 
module-whatis \"Swan ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}
"




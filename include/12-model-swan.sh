#!/bin/bash

#################################################################
#Group 8 : Model SWAN
group=8
groupname[$group]="Model SWAN"

# SWAN
# compiled with OpenMPI 1.10.7
index=1
name["$group$index"]=swan
version["$group$index"]=41.31
details["$group$index"]="(compiled with OpenMPI 1.10.7)"
url["$group$index"]=http://swanmodel.sourceforge.net/download/zip/swan4131.tar.gz
filename["$group$index"]=swan4131.tar.gz
dirname["$group$index"]=swan4131
builder["$group$index"]="swan-builder"
dependencies["$group$index"]="openmpi/$compilo/1.10.7 netcdf/hdf5.110/openmpi110/gcc74/4.4.1.1"
dirinstall["$group$index"]="src/swan4131"
configfilename["$group$index"]="macros.inc"
configfile["$group$index"]="##############################################################################
# IA32_GNU:             Intel Pentium with Linux using GNU compiler gfortran.
##############################################################################
F90_SER = gfortran
F90_OMP = gfortran
F90_MPI = mpif90
FLAGS_OPT = -O
FLAGS_MSC = -w -fno-second-underscore
FLAGS90_MSC = \$(FLAGS_MSC) -ffree-line-length-none
FLAGS_DYN =
FLAGS_SER =
FLAGS_OMP = -fopenmp
FLAGS_MPI =
NETCDFROOT = $prefix/netcdf/hdf5.110/openmpi110/gcc74/fortran/4.4.4/
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
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/openmpi110/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tSwan ${version["$group$index"]}\"
}
 
module-whatis \"Swan ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}
"




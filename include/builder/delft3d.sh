#!/bin/bash

mkdir -p $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave 1	
mkdir -p $prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave 1 	 	 

./autogen.sh 2>&1 >&3 | tee -a $LOGFILE && leave 1
export CFLAGS="-fPIC" 
export MPIFC=mpif90
export MPI_INCLUDE="-I${C_INCLUDE_PATH//:/ -I}"
export MPILIBS_ADDITIONAL="-L${LD_LIBRARY_PATH//:/ -L} -lmpifort -lmpi"	

export NETCDF_CFLAGS="-I${C_INCLUDE_PATH//:/ -I}"
export NETCDF_LIBS="-L${LD_LIBRARY_PATH//:/ -L} -lnetcdf -lnetcdff"	
					
./configure --prefix=$prefix/${dirinstall["$index"]} ${args["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave 1

sed -i "s~/usr/bin/ruby~$prefix/ruby/$compilo/2.7.2/bin/ruby~g" scripts_lgpl/linux/gatherlibraries.rb 2>&1 >&3 | tee -a $LOGFILE && leave 1

make 2>&1 >&3 | tee -a $LOGFILE && leave 1
make ds-install 2>&1 >&3 | tee -a $LOGFILE && leave 1

if [ -d "$prefix/${dirinstall["$index"]}/lib64" ] ; then
	cp -r $prefix/${dirinstall["$index"]}/lib64/* $prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave 1
	rm -rf $prefix/${dirinstall["$index"]}/lib64/ 2>&1 >&3 | tee -a $LOGFILE && leave 1
fi

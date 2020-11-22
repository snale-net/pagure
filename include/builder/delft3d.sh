#!/bin/bash

mkdir -p $prefix/${dirinstall["$index"]}	
mkdir -p $prefix/${dirinstall["$index"]}/lib 		 

./autogen.sh || leave 1	
export CFLAGS="-fPIC"
export MPIFC=mpif90
export MPI_INCLUDE="-I${C_INCLUDE_PATH//:/ -I}"
export MPILIBS_ADDITIONAL="-L${LD_LIBRARY_PATH//:/ -L} -lmpifort -lmpi"	

export NETCDF_CFLAGS="-I${C_INCLUDE_PATH//:/ -I}"
export NETCDF_LIBS="-L${LD_LIBRARY_PATH//:/ -L} -lnetcdf -lnetcdff"	

sed -i 's/\/usr\/bin\/ruby/$prefix\/ruby\/$compilo\/2.7.2\/bin\/ruby/g' scripts_lgpl/linux/gatherlibraries.rb
head scripts_lgpl/linux/gatherlibraries.rb
leave 1
					
./configure --prefix=$prefix/${dirinstall["$index"]} ${args["$index"]} || leave 1

make || leave 1
make ds-install || leave 1
cp -r $prefix/${dirinstall["$index"]}/lib64/* $prefix/${dirinstall["$index"]}/lib  || leave 1
rm -rf $prefix/${dirinstall["$index"]}/lib64/ || leave 1

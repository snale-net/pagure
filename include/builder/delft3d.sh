#!/bin/bash

mkdir -p $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
mkdir -p $prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave	

./autogen.sh 2>&1 >&3 | tee -a $LOGFILE && leave
export CFLAGS="-fPIC" 
export MPIFC=mpif90
export MPI_INCLUDE="-I${C_INCLUDE_PATH//:/ -I}"
export MPILIBS_ADDITIONAL="-L${LD_LIBRARY_PATH//:/ -L} -lmpifort -lmpi"	

export NETCDF_CFLAGS="-I${C_INCLUDE_PATH//:/ -I}"
export NETCDF_LIBS="-L${LD_LIBRARY_PATH//:/ -L} -lnetcdf -lnetcdff"	
					
echo $"${args["$index"]}" | xargs ./configure --prefix=$prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave

sed -i "s~/usr/bin/ruby~$prefix/ruby/$compilo/2.7.2/bin/ruby~g" scripts_lgpl/linux/gatherlibraries.rb 2>&1 >&3 | tee -a $LOGFILE && leave

make ds-install 2>&1 >&3 | tee -a $LOGFILE && leave

# On supprime les executables pré-compilés
rm -f $prefix/${dirinstall["$index"]}/bin/swan_4072ABCDE_del_l64_i11_mpi.exe $prefix/${dirinstall["$index"]}/bin/swan_4072ABCDE_del_l64_i11_omp.exe 2>&1 >&3 | tee -a $LOGFILE && leave

# On exécute l'installation de SWAN MPI
cd $prefix/src/${dirname["$index"]}/third_party_open/swan/swan_mpi 2>&1 >&3 | tee -a $LOGFILE && leave
make clean 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
cp -f $prefix/src/${dirname["$index"]}/third_party_open/swan/swan_mpi/swan_mpi.exe $prefix/${dirinstall["$index"]}/bin/swan_mpi.exe 2>&1 >&3 | tee -a $LOGFILE && leave

# On exécute l'installation de SWAN OpenMP
cd $prefix/src/${dirname["$index"]}/third_party_open/swan/swan_omp 2>&1 >&3 | tee -a $LOGFILE && leave
make clean 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
cp -f $prefix/src/${dirname["$index"]}/third_party_open/swan/swan_omp/swan_omp.exe $prefix/${dirinstall["$index"]}/bin/swan_omp.exe 2>&1 >&3 | tee -a $LOGFILE && leave

# On déplace les librairies 64bits dans le dossier lib
if [ -d "$prefix/${dirinstall["$index"]}/lib64" ] ; then
	cp -r $prefix/${dirinstall["$index"]}/lib64/* $prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave
	rm -rf $prefix/${dirinstall["$index"]}/lib64/ 2>&1 >&3 | tee -a $LOGFILE && leave
fi

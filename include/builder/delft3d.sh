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

# On supprime les librairies inutiles
rm -f $prefix/${dirinstall["$index"]}/lib/libc.so.6 $prefix/${dirinstall["$index"]}/lib/libcom_err.so.2 $prefix/${dirinstall["$index"]}/lib/libcrypt.so.1 $prefix/${dirinstall["$index"]}/lib/libcrypto.so.10 $prefix/${dirinstall["$index"]}/lib/libcurl.so.4 $prefix/${dirinstall["$index"]}/lib/libdelwaq.so.0 $prefix/${dirinstall["$index"]}/lib/libdimr.so.0 $prefix/${dirinstall["$index"]}/lib/libdl.so.2 $prefix/${dirinstall["$index"]}/lib/libexpat.so.1 $prefix/${dirinstall["$index"]}/lib/libfreebl3.so $prefix/${dirinstall["$index"]}/lib/libgcc_s.so.1 $prefix/${dirinstall["$index"]}/lib/libgssapi_krb5.so.2 $prefix/${dirinstall["$index"]}/lib/libidn.so.11 $prefix/${dirinstall["$index"]}/lib/libifcoremt.so.5 $prefix/${dirinstall["$index"]}/lib/libifport.so.5 $prefix/${dirinstall["$index"]}/lib/libimf.so$prefix/${dirinstall["$index"]}/lib/libintlc.so.5$prefix/${dirinstall["$index"]}/lib/libiomp5.so $prefix/${dirinstall["$index"]}/lib/libirc.so $prefix/${dirinstall["$index"]}/lib/libirng.so $prefix/${dirinstall["$index"]}/lib/libk5crypto.so.3 $prefix/${dirinstall["$index"]}/lib/libkeyutils.so.1 $prefix/${dirinstall["$index"]}/lib/libkrb5.so.3 $prefix/${dirinstall["$index"]}/lib/libkrb5support.so.0 $prefix/${dirinstall["$index"]}/lib/liblber-2.4.so.2 $prefix/${dirinstall["$index"]}/lib/libldap-2.4.so.2 $prefix/${dirinstall["$index"]}/lib/libm.so.6  $prefix/${dirinstall["$index"]}/lib/libnefis.so.0 $prefix/${dirinstall["$index"]}/lib/libnspr4.so $prefix/${dirinstall["$index"]}/lib/libnss3.so $prefix/${dirinstall["$index"]}/lib/libnssutil3.so $prefix/${dirinstall["$index"]}/lib/libpcre.so.1
$prefix/${dirinstall["$index"]}/lib/libplc4.so $prefix/${dirinstall["$index"]}/lib/libplds4.so $prefix/${dirinstall["$index"]}/lib/libpthread.so.0 $prefix/${dirinstall["$index"]}/lib/libresolv.so.2 $prefix/${dirinstall["$index"]}/lib/librt.so.1 $prefix/${dirinstall["$index"]}/lib/libsasl2.so.3 $prefix/${dirinstall["$index"]}/lib/libselinux.so.1 $prefix/${dirinstall["$index"]}/lib/libsmime3.so $prefix/${dirinstall["$index"]}/lib/libssh2.so.1 $prefix/${dirinstall["$index"]}/lib/libssl.so.10 $prefix/${dirinstall["$index"]}/lib/libssl3.so $prefix/${dirinstall["$index"]}/lib/libstdc++.so.6 $prefix/${dirinstall["$index"]}/lib/libsvml.so $prefix/${dirinstall["$index"]}/lib/libwaq_plugin_wasteload.so.0 $prefix/${dirinstall["$index"]}/lib/libz.so.1 $prefix/${dirinstall["$index"]}/lib/libcrypto.so.10 $prefix/${dirinstall["$index"]}/lib/libexpat.so.1 $prefix/${dirinstall["$index"]}/lib/libssl.so.10 
$prefix/${dirinstall["$index"]}/lib/libssl3.so  2>&1 >&3 | tee -a $LOGFILE && leave


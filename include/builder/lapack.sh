#!/bin/bash

mkdir build 2>&1 >&3 | tee -a $LOGFILE && leave
cd build

if [[ ! -z "${configfilename["$index"]}" ]] ; then 
	mv ../${configfilename["$index"]} . 2>&1 >&3 | tee -a $LOGFILE && leave
fi

# Dynamic
cmake -DCMAKE_INSTALL_PREFIX=$prefix/${dirinstall["$index"]}  -DCMAKE_INSTALL_LIBDIR=$prefix/${dirinstall["$index"]}/lib -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=ON -DLAPACKE=ON -DCBLAS=ON ../ 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 >&3 | tee -a $LOGFILE && leave

make clean 2>&1 >&3 | tee -a $LOGFILE && leave

# Static
cmake -DCMAKE_INSTALL_PREFIX=$prefix/${dirinstall["$index"]}  -DCMAKE_INSTALL_LIBDIR=$prefix/${dirinstall["$index"]}/lib -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=OFF -DLAPACKE=ON -DCBLAS=ON ../ 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 >&3 | tee -a $LOGFILE && leave

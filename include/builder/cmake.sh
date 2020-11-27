#!/bin/bash

mkdir build 2>&1 >&3 | tee -a $LOGFILE && leave
cd build

if [[ ! -z "${configfilename["$index"]}" ]] ; then 
	mv ../${configfilename["$index"]} . 2>&1 >&3 | tee -a $LOGFILE && leave; 
fi

cmake -DCMAKE_INSTALL_PREFIX=$prefix/${dirinstall["$index"]}  -DCMAKE_INSTALL_LIBDIR=$prefix/${dirinstall["$index"]}/lib ${args["$index"]} ../ 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 >&3 | tee -a $LOGFILE && leave

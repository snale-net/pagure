#!/bin/bash

mkdir build
cd build

if [[ ! -z "${configfilename["$index"]}" ]] ; then mv ../${configfilename["$index"]} . || leave 1 ; fi

# Dynamic
cmake -DCMAKE_INSTALL_PREFIX=$prefix/${dirinstall["$index"]}  -DCMAKE_INSTALL_LIBDIR=$prefix/${dirinstall["$index"]}/lib -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=ON -DLAPACKE=ON ../
make || leave 1
make install || leave 1

make clean

# Static
cmake -DCMAKE_INSTALL_PREFIX=$prefix/${dirinstall["$index"]}  -DCMAKE_INSTALL_LIBDIR=$prefix/${dirinstall["$index"]}/lib -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=OFF -DLAPACKE=ON ../
make || leave 1
make install || leave 1

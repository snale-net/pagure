#!/bin/bash

mkdir build
cd build

if [[ ! -z "${configfilename["$index"]}" ]] ; then mv ../${configfilename["$index"]} . || leave 1 ; fi

cmake -DCMAKE_INSTALL_PREFIX=$prefix/${dirinstall["$index"]}  -DCMAKE_INSTALL_LIBDIR=$prefix/${dirinstall["$index"]}/lib ${args["$index"]} ../
make || leave 1
make docs_man || leave 1
make install || leave 1

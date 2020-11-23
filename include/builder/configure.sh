#!/bin/bash

./configure --prefix=$prefix/${dirinstall["$index"]} --libdir=$prefix/${dirinstall["$index"]}/lib ${args["$index"]} || leave 1
make || leave 1
make install || leave 1

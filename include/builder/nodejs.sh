#!/bin/bash

./configure --prefix=$prefix/${dirinstall["$index"]} ${args["$index"]} || leave 1
make || leave 1
make install || leave 1

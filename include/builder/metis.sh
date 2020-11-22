#!/bin/bash

make config shared=1 prefix=$prefix/${dirinstall["$index"]} ${args["$index"]}
make install

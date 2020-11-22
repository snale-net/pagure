#!/bin/bash

cd src 
make libscotch esmumps				
make prefix=$prefix/${dirinstall["$index"]} install

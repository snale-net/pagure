#!/bin/bash

cd src                 		
make libptscotch ptesmumps 
make prefix=$prefix/${dirinstall["$index"]} install

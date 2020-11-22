#!/bin/bash

make all
mkdir -p $prefix/${dirinstall["$index"]}
cp -r lib $prefix/${dirinstall["$index"]}
cp -r include $prefix/${dirinstall["$index"]}	

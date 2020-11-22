#!/bin/bash

make
mkdir -p $prefix/${dirinstall["$index"]}
cp -r lib $prefix/${dirinstall["$index"]}
cp -r include $prefix/${dirinstall["$index"]}
cp mod/* $prefix/${dirinstall["$index"]}/include

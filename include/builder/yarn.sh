#!/bin/bash

npm install
npm install --global gulp-cli
gulp build
mkdir -p $prefix/${dirinstall["$index"]}
cp -r ./* $prefix/${dirinstall["$index"]}	

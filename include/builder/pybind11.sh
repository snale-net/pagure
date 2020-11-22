#!/bin/bash

export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}
$pythonInterpreter setup.py install --user || leave 1
cp -r include/pybind11 $prefix/${dirinstall["$index"]}/include/$pythonInterpreter  || leave 1 				


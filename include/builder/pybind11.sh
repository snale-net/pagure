#!/bin/bash

$pythonInterpreter setup.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r include/pybind11 $prefix/${dirinstall["$index"]}/include/$pythonInterpreter 2>&1 >&3 | tee -a $LOGFILE && leave		


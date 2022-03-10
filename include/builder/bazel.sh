#!/bin/bash

# Edit files to select the right interpreter
sed -i "s~OS.OPENBSD ? \"python3\" : \"python\"~OS.OPENBSD ? \"${pythonInterpreter}\" : \"${pythonInterpreter}\"~g" src/main/java/com/google/devtools/build/lib/bazel/rules/python/BazelPythonSemantics.java 2>&1 >&3 | tee -a $LOGFILE && leave
sed -i "s~%shebang%~#!/usr/bin/env ${pythonInterpreter}~g" src/main/java/com/google/devtools/build/lib/bazel/rules/python/python_stub_template.txt 2>&1 >&3 | tee -a $LOGFILE && leave
sed -i "s~#!/usr/bin/env python3~#!/usr/bin/env ${pythonInterpreter}~g"  src/test/py/bazel/launcher_test.py 2>&1 >&3 | tee -a $LOGFILE && leave

# Build
env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" bash ./compile.sh 2>&1 >&3 | tee -a $LOGFILE && leave

# Install to dir
mkdir -p $prefix/${dirinstall["$index"]}/bin 2>&1 >&3 | tee -a $LOGFILE && leave
cp output/bazel $prefix/${dirinstall["$index"]}/bin/. 2>&1 >&3 | tee -a $LOGFILE && leave


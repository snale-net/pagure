#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Edit files to select the right interpreter
sed -i "s~OS.OPENBSD ? \"python3\" : \"python\"~OS.OPENBSD ? \"${pythonInterpreter}\" : \"${pythonInterpreter}\"~g" src/main/java/com/google/devtools/build/lib/bazel/rules/python/BazelPythonSemantics.java 2>&1 >&3 | tee -a $LOGFILE && leave
sed -i "s~%shebang%~#!/usr/bin/env ${pythonInterpreter}~g" src/main/java/com/google/devtools/build/lib/bazel/rules/python/python_stub_template.txt 2>&1 >&3 | tee -a $LOGFILE && leave
sed -i "s~#!/usr/bin/env python3~#!/usr/bin/env ${pythonInterpreter}~g"  src/test/py/bazel/launcher_test.py 2>&1 >&3 | tee -a $LOGFILE && leave

# Build
env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" bash ./compile.sh 2>&1 >&3 | tee -a $LOGFILE && leave

# Install to dir
mkdir -p $prefix/${dirinstall["$index"]}/bin 2>&1 >&3 | tee -a $LOGFILE && leave
cp output/bazel $prefix/${dirinstall["$index"]}/bin/. 2>&1 >&3 | tee -a $LOGFILE && leave


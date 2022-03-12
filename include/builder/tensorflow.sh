#!/bin/bash

if [ ! -d "$prefix/${dirinstall["$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/bin" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" 2>&1 >&3 | tee -a $LOGFILE && leave; fi

export PYTHONUSERBASE=`echo $PYTHONUSERBASE | cut -d: -f1`
${pythonInterpreter} configure.py 2>&1 >&3 | tee -a $LOGFILE && leave
bazel clean 2>&1 >&3 | tee -a $LOGFILE && leave

sed -i "1i #!/usr/bin/env ${pythonInterpreter}" tensorflow/tools/git/gen_git_source.py 2>&1 >&3 | tee -a $LOGFILE && leave

echo ${args["$index"]} | xargs -i sh -c "bazel build {} //tensorflow/tools/pip_package:build_pip_package" 2>&1 >&3 | tee -a $LOGFILE && leave

./bazel-bin/tensorflow/tools/pip_package/build_pip_package ./tensorflow_pkg 2>&1 >&3 | tee -a $LOGFILE && leave
pip install ./tensorflow_pkg/tensorflow-${version["$index"]}-cp37-cp37m-linux_x86_64.whl 2>&1 >&3 | tee -a $LOGFILE && leave

pip uninstall -y dataclasses 2>&1 >&3 | tee -a $LOGFILE && leave


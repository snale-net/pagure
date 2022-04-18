#!/bin/bash

./autogen.sh 2>&1 >&3 | tee -a $LOGFILE && leave

# Version Netcdf
cmd=`echo "${args["$index"]}" | xargs -0 -i echo ./configure --prefix=$prefix/src/${dirname["$index"]}/build --with-netcdf {} | sed -z '$ s/\n//' | xargs -0`
eval "$cmd" 2>&1 >&3 | tee -a $LOGFILE && leave
sed -i -e "s/automake-1.14/automake-1.14 --add-missing/g" Makefile 2>&1 >&3 | tee -a $LOGFILE && leave
sed -i "1i #!/usr/bin/env ${pythonInterpreter}" makedepo.py 2>&1 >&3 | tee -a $LOGFILE && leave
sed -i "1i #!/usr/bin/env ${pythonInterpreter}" scripts/generate.py 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 >&3 | tee -a $LOGFILE && leave
mv build/bin/xbeach build/bin/xbeach_netcdf 2>&1 >&3 | tee -a $LOGFILE && leave

# Install to dir
mkdir -p $prefix/${dirinstall["$index"]}/bin 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r build/* $prefix/${dirinstall["$index"]}/. 2>&1 >&3 | tee -a $LOGFILE && leave

# Version ascii
make clean
cmd=`echo "${args["$index"]}" | xargs -0 -i echo ./configure --prefix=$prefix/src/${dirname["$index"]}/build {} | sed -z '$ s/\n//' | xargs -0`
eval "$cmd" 2>&1 >&3 | tee -a $LOGFILE && leave
sed -i -e "s/automake-1.14/automake-1.14 --add-missing/g" Makefile 2>&1 >&3 | tee -a $LOGFILE && leave
sed -i "1i #!/usr/bin/env ${pythonInterpreter}" makedepo.py 2>&1 >&3 | tee -a $LOGFILE && leave
sed -i "1i #!/usr/bin/env ${pythonInterpreter}" scripts/generate.py 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 >&3 | tee -a $LOGFILE && leave

# Install to dir
mkdir -p $prefix/${dirinstall["$index"]}/bin 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r build/bin/* $prefix/${dirinstall["$index"]}/bin/. 2>&1 >&3 | tee -a $LOGFILE && leave


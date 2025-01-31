#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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


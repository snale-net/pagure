#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

cp spatialindex-1.8.0/ltmain.sh . 2>&1 >&3 | tee -a $LOGFILE && leave
echo $"${args["$index"]}" | xargs ./configure --prefix=$prefix/${dirinstall["$index"]} --libdir=$prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave
#make -j clean  2>&1 >&3 | tee -a $LOGFILE && leave
make -j 2>&1 >&3 | tee -a $LOGFILE && leave
make -j fltools 2>&1 >&3 | tee -a $LOGFILE && leave
make -j install 2>&1 >&3 | tee -a $LOGFILE && leave
mkdir -p ${HOME}/.diamond/schemata 2>&1 >&3 | tee -a $LOGFILE && leave
cp $prefix/${dirinstall["$index"]}/share/diamond/schemata/flml ${HOME}/.diamond/schemata/. 2>&1 >&3 | tee -a $LOGFILE && leave
#make THREADS=4 test 2>&1 >&3 | tee -a $LOGFILE && leave


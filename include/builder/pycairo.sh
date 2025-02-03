#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

if [ ! -d "$prefix/${dirinstall["$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/bin" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" 2>&1 >&3 | tee -a $LOGFILE && leave; fi

export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}
echo $PYTHONPATH | sed 's/:/\n/g' > $PYTHONUSERBASE/module-extra.pth

if [[ "$compiler" == "intel" ]] ; then
	LDSHARED="icc -shared" $pythonInterpreter setup.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
else
	$pythonInterpreter setup.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
fi	

cp $prefix/${dirinstall["$index"]}/lib/python${pythonVersion}/site-packages/pycairo-1.20.1-py3.7-linux-x86_64.egg/cairo/include/py3cairo.h $prefix/${dirinstall["$index"]}/include/python${pythonVersion}/. 2>&1 | tee -a $LOGFILE && leave

rm -f $PYTHONUSERBASE/module-extra.pth
unset PYTHONUSERBASE

#!/bin/bash

echo $"${args["$index"]}" | xargs ./configure --prefix=$prefix/${dirinstall["$index"]} --libdir=$prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 >&3 | tee -a $LOGFILE && leave

pythonVersion=$(echo ${version["$index"]} | sed -n 's/^\([0-9]\.[0-9]*\).*/\1/p')				
pythonInterpreter=python${pythonVersion}
log info "Python interpreter is set to $pythonInterpreter"

if [[ ! -f "$moduleDir/python-modules/$compilo/${pythonVersion}" ]]
then
	if [ ! -d "$moduleDir/python-modules/$compilo" ] ; then mkdir -p "$moduleDir/python-modules/$compilo" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
	pymodulefile="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\tPython librairies\"
}

module-whatis \"Python librairies\"

prepend-path PATH $prefix/python-modules/$compilo/bin
prepend-path C_INCLUDE_PATH $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path INCLUDE $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path CPATH $prefix/python-modules/$compilo/include/$pythonInterpreter
"
	echo $"${pymodulefile}" >> $moduleDir/python-modules/$compilo/${pythonVersion}   
fi

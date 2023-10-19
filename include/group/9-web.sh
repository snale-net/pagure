#!/bin/bash

#################################################################
#Group 9 : Web
group=9
groupname[$group]="Web librairies"

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# nodejs 18.17.1
index=1
name["$group-$index"]=nodejs
version["$group-$index"]=18.17.1
details["$group-$index"]=""
url["$group-$index"]="https://github.com/nodejs/node/archive/refs/tags/v18.17.1.tar.gz -O node-v18.17.1.tar.gz"
filename["$group-$index"]=node-v18.17.1.tar.gz
dirname["$group-$index"]=node-18.17.1
builder["$group-$index"]="nodejs"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNodeJS ${version["$group-$index"]}\"
}
 
module-whatis \"NodeJS ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"
fi  # end-only-if-Python

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python (NodeJS need)

# yarn 1.22.19
index=2
name["$group-$index"]=yarn
version["$group-$index"]=1.22.19
details["$group-$index"]=""
url["$group-$index"]="https://github.com/yarnpkg/yarn/archive/refs/tags/v1.22.19.tar.gz -O yarn-1.22.19.tar.gz"
filename["$group-$index"]=yarn-1.22.19.tar.gz
dirname["$group-$index"]=yarn-1.22.19
builder["$group-$index"]="yarn"
dependencies["$group-$index"]="nodejs/$compilo/18.17.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t${name["$group-$index"]} ${version["$group-$index"]}\"
}
 
module-whatis \"${name["$group-$index"]} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"

fi  # end-only-if-Python

# composer 1.10.7
index=3
name["$group-$index"]=composer
version["$group-$index"]=1.10.7
details["$group-$index"]=""
url["$group-$index"]="https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O composer-setup.php"
filename["$group-$index"]=composer-setup.php
dirname["$group-$index"]=composer-1.10-7
builder["$group-$index"]="composer"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t${name["$group-$index"]} ${version["$group-$index"]}\"
}
 
module-whatis \"${name["$group-$index"]} ${version["$group-$index"]}\"

set-alias composer \"php $prefix/${dirinstall["$group-$index"]}/bin/composer.phar\"
"

# vagrant 2.2.15
index=4
name["$group-$index"]=vagrant
version["$group-$index"]=2.2.15
details["$group-$index"]=""
url["$group-$index"]="https://releases.hashicorp.com/vagrant/2.2.15/vagrant_2.2.15_linux_amd64.zip -O vagrant-2.2.15"
filename["$group-$index"]=vagrant-2.2.15
dirname["$group-$index"]=vagrant-2.2.15
builder["$group-$index"]="vagrant"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t${name["$group-$index"]} ${version["$group-$index"]}\"
}
 
module-whatis \"${name["$group-$index"]} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"

# trellis 0.9.2
index=5
name["$group-$index"]=trellis
version["$group-$index"]=0.9.2
details["$group-$index"]=""
url["$group-$index"]="https://github.com/roots/trellis-cli/releases/download/v0.9.2/trellis_0.9.2_Linux_x86_64.tar.gz -O trellis-0.9.2"
filename["$group-$index"]=trellis-0.9.2
dirname["$group-$index"]=trellis-0.9.2
builder["$group-$index"]="trellis"
dependencies["$group-$index"]="vagrant/2.2.15"
dirinstall["$group-$index"]="${name["$group-$index"]}/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t${name["$group-$index"]} ${version["$group-$index"]}\"
}
 
module-whatis \"${name["$group-$index"]} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"




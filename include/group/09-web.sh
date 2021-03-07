#!/bin/bash

#################################################################
#Group 9 : Web
group=9
groupname[$group]="Web librairies"

# nodejs 10.21.0
index=1
name["$group$index"]=nodejs
version["$group$index"]=10.21.0
details["$group$index"]=""
url["$group$index"]="https://github.com/nodejs/node/archive/v10.21.0.tar.gz -O node-10.21.0.tar.gz"
filename["$group$index"]=node-10.21.0.tar.gz
dirname["$group$index"]=node-10.21.0
builder["$group$index"]="nodejs"
dependencies["$group$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tNodeJS ${version["$group$index"]}\"
}
 
module-whatis \"NodeJS ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group$index"]}/include 
"

# yarn 1.22.4
index=2
name["$group$index"]=yarn
version["$group$index"]=1.22.4
details["$group$index"]=""
url["$group$index"]="https://github.com/yarnpkg/yarn/archive/v1.22.4.tar.gz -O yarn-1.22.4.tar.gz"
filename["$group$index"]=yarn-1.22.4.tar.gz
dirname["$group$index"]=yarn-1.22.4
builder["$group$index"]="yarn"
dependencies["$group$index"]="nodejs/$compilo/10.21.0"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t${name["$group$index"]} ${version["$group$index"]}\"
}
 
module-whatis \"${name["$group$index"]} ${version["$group$index"]}\"

prepend-path PATH $prefix/${dirinstall["$group$index"]}/bin
"

# composer 1.10.7
index=3
name["$group$index"]=composer
version["$group$index"]=1.10.7
details["$group$index"]=""
url["$group$index"]="https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O composer-setup.php"
filename["$group$index"]=composer-setup.php
dirname["$group$index"]=composer-1.10-7
builder["$group$index"]="composer"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/${version["$group$index"]}"
args["$group$index"]=""
dirmodule["$group$index"]="${name["$group$index"]}"
modulefile["$group$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t${name["$group$index"]} ${version["$group$index"]}\"
}
 
module-whatis \"${name["$group$index"]} ${version["$group$index"]}\"

set-alias composer \"php $prefix/${dirinstall["$group$index"]}/bin/composer.phar\"
"



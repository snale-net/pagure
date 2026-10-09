#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#################################################################
#Group 13 : Model FLUIDITY
group="13"
groupname[$group]="Model FLUIDITY"

# Spud 1.2.2
index=1
name["$group-$index"]=spud
version["$group-$index"]=1.2.2
details["$group-$index"]="(contains Diamond graphic tool)"
url["$group-$index"]="https://github.com/FluidityProject/spud/archive/246de64aab5834580d5c076dad0cf018e6501d00.zip -O spud-1.2.2.zip"
filename["$group-$index"]=spud-1.2.2.zip
dirname["$group-$index"]=spud-246de64aab5834580d5c076dad0cf018e6501d00
patch_01["$group-$index"]="--- Makefile.in	2023-05-24 16:41:10.412341191 +0200
+++ Makefile_new.in	2023-05-24 16:43:46.857853141 +0200
@@ -98,13 +98,13 @@
 	@INSTALL@ -m644 schema/spud_base.rng \$(DESTDIR)@prefix@/share/spud
 
 install-diamond:
-	cd diamond; python3 setup.py install --prefix=\$(DESTDIR)@prefix@; cd ..
+	cd diamond; python3 setup.py install --user --force; cd ..
 
 install-pyspud:
-	cd python; python3 setup.py install --prefix=\$(DESTDIR)@prefix@; cd ..
+	cd python; python3 setup.py install --user --force; cd ..
 
 install-dxdiff:
-	cd dxdiff; python3 setup.py install --prefix=\$(DESTDIR)@prefix@; cd ..
+	cd dxdiff; python3 setup.py install --user --force; cd ..
 
 clean:
 	@cd doc; \$(MAKE) clean
"
patchfile_01["$group-$index"]="Makefile.in"
builder["$group-$index"]="configure"
dependencies["$group-$index"]="python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__ xml2/__COMPILO__/2.13.6 xslt/__COMPILO__/1.1.45"
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

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
setenv SPUD_DIR $prefix/${dirinstall["$group-$index"]}
"

# fluidity 4.1.20
index=2
name["$group-$index"]=fluidity
version["$group-$index"]=4.1.20
constraints["$group-$index"]='mpilib != none && compiler == gnu && CC_VERSION < 12'
details["$group-$index"]=""
#url["$group-$index"]="https://github.com/FluidityProject/fluidity/archive/refs/tags/4.1.20.tar.gz -O fluidity-4.1.20.tar.gz"
url["$group-$index"]="https://github.com/FluidityProject/fluidity/archive/refs/heads/main.zip -O fluidity-4.1.20.zip"
filename["$group-$index"]=fluidity-4.1.20.zip
dirname["$group-$index"]=fluidity-main
patch_01["$group-$index"]="--- Makefile_original.in	2021-06-08 21:22:05.000000000 +0200
+++ Makefile.in	2021-07-26 12:21:39.697289659 +0200
@@ -559,7 +559,7 @@
 	cp -R schemas \$(DESTDIR)\$(datadir)/fluidity/
 	mkdir -p \$(DESTDIR)\$(datadir)/diamond/schemata
 	\$(SED) 's/\$\${datadir}/\$(subst /,\/,\$(datadir))/g' schemas/flml.in > \$(DESTDIR)\$(datadir)/diamond/schemata/flml
-	cd python ; python3 setup.py install --root=\$(shell echo \${DESTDIR} | sed 's/^\$\$/\//') --prefix=\"\$(prefix)\" \$\$FLUIDITY_PYTHON_INSTALL_ARGS
+	cd python ; python3 setup.py install --user --force \$\$FLUIDITY_PYTHON_INSTALL_ARGS
 	cp -R examples \$(DESTDIR)\$(docdir)/fluidity
 	find \$(DESTDIR)\$(docdir)/fluidity/examples -type f -exec \$(SED) -i \"s/\.\.\/\.\.\/\.\.\/bin\///\" '{}' \;
 	find \$(DESTDIR)\$(docdir)/fluidity/examples -type f -exec \$(SED) -i \"s/\.\.\/\.\.\/bin\///\" '{}' \;
"
patchfile_01["$group-$index"]="Makefile.in"
builder["$group-$index"]="fluidity"
dependencies["$group-$index"]="__MPI_MODULE__ python/__COMPILO__/__PYTHON_VERSION__ python-modules/__COMPILO__/__PYTHON_VERSION__ openblas/__COMPILO__/0.3.33 petsc/__MPI_LIB__/__COMPILO__/3.18.6 vtk/__MPI_LIB__/__COMPILO__/9.1.0 hdf5/__MPI_LIB__/__COMPILO__/1.12.1 spud/__COMPILO__/1.2.2 udunits/__COMPILO__/2.2.28"
dirinstall["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]="--enable-2d-adaptivity  --enable-openmp --with-hdf5 --with-libspud-root=$prefix/spud/__COMPILO__/1.2.2"
dirmodule["$group-$index"]="${name["$group-$index"]}/__MPI_LIB__/__COMPILO__"
modulefile["$group-$index"]="#%Module1.0                                                                                                                                                                                                                                 
proc ModulesHelp { } {                                                                                                                                                                                                                      
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path DIAMOND_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/diamond/schemata
"






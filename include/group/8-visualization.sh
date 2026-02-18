#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#################################################################
#Group 8 : Visualization
group=8
groupname[$group]="Visualization librairies"

# Ncview 2.1.7
index=1
name["$group-$index"]=ncview
version["$group-$index"]=2.1.7
details["$group-$index"]=""
url["$group-$index"]=ftp://cirrus.ucsd.edu/pub/ncview/ncview-2.1.7.tar.gz
filename["$group-$index"]=ncview-2.1.7.tar.gz
dirname["$group-$index"]=ncview-2.1.7
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.14.6 netcdf-c/hdf5.146/$compilo/4.9.3 udunits/$compilo/2.2.28"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.14.6 netcdf-c/hdf5.146/$mpilib/$compilo/4.9.3 udunits/$compilo/2.2.28"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
"

# vtk 8.2.0
index=2
name["$group-$index"]=vtk
version["$group-$index"]=8.2.0
if [ "$mpilib" == "none" ]; then
	details["$group-$index"]=""
else
	details["$group-$index"]="(with parallel)"
fi
url["$group-$index"]="https://www.vtk.org/files/release/8.2/VTK-8.2.0.tar.gz"
filename["$group-$index"]=VTK-8.2.0.tar.gz
dirname["$group-$index"]=VTK-8.2.0
builder["$group-$index"]="cmake"
if [ "$mpilib" == "none" ]; then
	dependencies["$group-$index"]="cmake/$compilo/3.31.8 zlib/$compilo/1.2.11 lapack-blas/$compilo/3.9.1 hdf5/$compilo/1.14.6 netcdf-c/hdf5.146/$compilo/4.9.3 netcdf-fortran/hdf5.146/$compilo/4.5.3"
    dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
    args["$group-$index"]="-DVTK_USE_SYSTEM_ZLIB=ON -DVTK_USE_SYSTEM_HDF5=ON -DVTK_USE_SYSTEM_NETCDF=ON"
    dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
else
	dependencies["$group-$index"]="$mpi_dep cmake/$compilo/3.31.8 zlib/$compilo/1.2.11 lapack-blas/$compilo/3.9.1 hdf5/$mpilib/$compilo/1.14.6 netcdf-c/hdf5.146/$mpilib/$compilo/4.9.3 netcdf-fortran/hdf5.146/$mpilib/$compilo/4.5.3"
    dirinstall["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}"
    args["$group-$index"]="-DModule_vtkParallelMPI:BOOL=ON -DVTK_Group_MPI:BOOL=ON -DVTK_USE_SYSTEM_ZLIB=ON -DVTK_USE_SYSTEM_HDF5=ON -DVTK_USE_SYSTEM_NETCDF=ON"
    dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
fi
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
"

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# xml2 2.13.2
index=3
name["$group-$index"]=xml2
version["$group-$index"]=2.13.2
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.13.2/libxml2-v2.13.2.zip"
filename["$group-$index"]=libxml2-v2.13.2.zip
dirname["$group-$index"]=libxml2-v2.13.2
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cmake/$compilo/3.31.8"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xslt 1.1.38
index=4
name["$group-$index"]=xslt
version["$group-$index"]=1.1.38
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.gnome.org/GNOME/libxslt/-/archive/v1.1.38/libxslt-v1.1.38.zip"
filename["$group-$index"]=libxslt-v1.1.38.zip
dirname["$group-$index"]=libxslt-v1.1.38
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="cmake/$compilo/3.20 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# lxml 4.6.3
index=5
name["$group-$index"]=lxml
version["$group-$index"]=4.6.3
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/e5/21/a2e4517e3d216f0051687eea3d3317557bde68736f038a3b105ac3809247/lxml-4.6.3.tar.gz"
filename["$group-$index"]=lxml-4.6.3.tar.gz
dirname["$group-$index"]=lxml-4.6.3
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} xml2/$compilo/2.13.2 xslt/$compilo/1.1.38"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# cairo 1.17.8
index=6
name["$group-$index"]=cairo
version["$group-$index"]=1.17.8
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/cairo/cairo/-/archive/1.17.8/cairo-1.17.8.zip"
filename["$group-$index"]=cairo-1.17.8.zip
dirname["$group-$index"]=cairo-1.17.8
builder["$group-$index"]="meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0                                                                                                                                                                                                                                 
proc ModulesHelp { } {                                                                                                                                                                                                                      
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# pycairo 1.20.1
index=7
name["$group-$index"]=pycairo
version["$group-$index"]=1.20.1
details["$group-$index"]=""
url["$group-$index"]="https://files.pythonhosted.org/packages/bc/3f/64e6e066d163fbcf13213f9eeda0fc83376243335ea46a66cefd70d62e8f/pycairo-1.20.1.tar.gz"
filename["$group-$index"]=pycairo-1.20.1.tar.gz
dirname["$group-$index"]=pycairo-1.20.1
builder["$group-$index"]="pycairo"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/1.17.8"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# glib 2.72.4
index=8
name["$group-$index"]=glib
version["$group-$index"]=2.72.4
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/glib/2.72/glib-2.72.4.tar.xz"
filename["$group-$index"]=glib-2.72.4.tar.xz
dirname["$group-$index"]=glib-2.72.4
builder["$group-$index"]="meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0                                                                                                                                                                                                                                 
proc ModulesHelp { } {                                                                                                                                                                                                                      
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# gobject-introspection 1.72.1
index=9
name["$group-$index"]=gobject-introspection
version["$group-$index"]=1.72.1
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/gobject-introspection/1.72/gobject-introspection-1.72.1.tar.xz"
filename["$group-$index"]=gobject-introspection-1.72.1.tar.xz
dirname["$group-$index"]=gobject-introspection-1.72.1
builder["$group-$index"]="meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} bison/$compilo/3.7"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH  $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path GI_TYPELIB_PATH $prefix/${dirinstall["$group-$index"]}/lib/girepository-1.0
"

# harfbuzz 2.8.2
index=10
name["$group-$index"]=harfbuzz
version["$group-$index"]=2.8.2
details["$group-$index"]=""
url["$group-$index"]="https://github.com/harfbuzz/harfbuzz/releases/download/2.8.2/harfbuzz-2.8.2.tar.xz"
filename["$group-$index"]=harfbuzz-2.8.2.tar.xz
dirname["$group-$index"]=harfbuzz-2.8.2
builder["$group-$index"]="gir_meson"
dependencies["$group-$index"]="cmake/$compilo/3.31.8 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/1.17.8 gobject-introspection/$compilo/1.72.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-Dintrospection=enabled"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path GI_TYPELIB_PATH $prefix/${dirinstall["$group-$index"]}/lib/girepository-1.0
"

# pango 1.48.6
index=11
name["$group-$index"]=pango
version["$group-$index"]=1.48.6
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/pango/1.48/pango-1.48.6.tar.xz"
filename["$group-$index"]=pango-1.48.6.tar.xz
dirname["$group-$index"]=pango-1.48.6
builder["$group-$index"]="gir_meson"
dependencies["$group-$index"]="cmake/$compilo/3.31.8 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/1.17.8 gobject-introspection/$compilo/1.72.1 harfbuzz/$compilo/2.8.2 "
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path GI_TYPELIB_PATH $prefix/${dirinstall["$group-$index"]}/lib/girepository-1.0
"

# gdk-pixbuf 2.42.0
index=12
name["$group-$index"]=gdk-pixbuf
version["$group-$index"]=2.42.0
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.0.tar.xz"
filename["$group-$index"]=gdk-pixbuf-2.42.0.tar.xz
dirname["$group-$index"]=gdk-pixbuf-2.42.0
builder["$group-$index"]="gir_meson"
dependencies["$group-$index"]="cmake/$compilo/3.31.8 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/1.17.8 gobject-introspection/$compilo/1.72.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-Dman=false"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path GI_TYPELIB_PATH $prefix/${dirinstall["$group-$index"]}/lib/girepository-1.0
"

# xorg-macros 1.20.0
index=13
name["$group-$index"]=xorg-macros
version["$group-$index"]=1.20.0
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/util/macros/-/archive/util-macros-1.20.0/macros-util-macros-1.20.0.zip"
filename["$group-$index"]=macros-util-macros-1.20.0.zip
dirname["$group-$index"]=macros-util-macros-1.20.0
builder["$group-$index"]="autogen"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/pkgconfig
prepend-path ACLOCAL_PATH $prefix/${dirinstall["$group-$index"]}/share/aclocal
"

# xorg-proto 2023.1
index=14
name["$group-$index"]=xorg-proto
version["$group-$index"]=2023.1
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/archive/xorgproto-2023.1/xorgproto-xorgproto-2023.1.zip"
filename["$group-$index"]=xorgproto-xorgproto-2023.1.zip
dirname["$group-$index"]=xorgproto-xorgproto-2023.1
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/pkgconfig
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xrandr 1.5.4
index=15
name["$group-$index"]=xrandr
version["$group-$index"]=1.5.4
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxrandr/-/archive/libXrandr-1.5.4/libxrandr-libXrandr-1.5.4.zip"
filename["$group-$index"]=libxrandr-libXrandr-1.5.4.zip
dirname["$group-$index"]=libxrandr-libXrandr-1.5.4
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 xorg-proto/$compilo/2023.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xi 1.8.1
index=16
name["$group-$index"]=xi
version["$group-$index"]=1.8.1
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxi/-/archive/libXi-1.8.1/libxi-libXi-1.8.1.zip"
filename["$group-$index"]=libxi-libXi-1.8.1.zip
dirname["$group-$index"]=libxi-libXi-1.8.1
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 xorg-proto/$compilo/2023.1 xfixes/$compilo/6.0.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# atk 2.36.0
index=17
name["$group-$index"]=atk
version["$group-$index"]=2.36.0
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/atk/2.36/atk-2.36.0.tar.xz"
filename["$group-$index"]=atk-2.36.0.tar.xz
dirname["$group-$index"]=atk-2.36.0
builder["$group-$index"]="gir_meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/1.17.8 gobject-introspection/$compilo/1.72.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path GI_TYPELIB_PATH $prefix/${dirinstall["$group-$index"]}/lib/girepository-1.0
"

# dbus 1.13.18
index=18
name["$group-$index"]=dbus
version["$group-$index"]=1.13.18
details["$group-$index"]=""
url["$group-$index"]="https://dbus.freedesktop.org/releases/dbus/dbus-1.13.18.tar.xz"
filename["$group-$index"]=dbus-1.13.18.tar.xz
dirname["$group-$index"]=dbus-1.13.18
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="cmake/$compilo/3.31.8 gobject-introspection/$compilo/1.72.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/lib/dbus-1.0/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/lib/dbus-1.0/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/lib/dbus-1.0/include
"

# xtst 1.2.3
index=19
name["$group-$index"]=xtst
version["$group-$index"]=1.2.3
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxtst/-/archive/libXtst-1.2.3/libxtst-libXtst-1.2.3.tar.bz2"
filename["$group-$index"]=libxtst-libXtst-1.2.3.tar.bz2
dirname["$group-$index"]=libxtst-libXtst-1.2.3
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xfixes/$compilo/6.0.1 xi/$compilo/1.8.1 xorg-macros/$compilo/1.20.0 xorg-proto/$compilo/2023.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# at-spi2-core 2.42.0
index=20
name["$group-$index"]=at-spi2-core
version["$group-$index"]=2.42.0
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.gnome.org/GNOME/at-spi2-core/-/archive/AT_SPI2_CORE_2_42_0/at-spi2-core-AT_SPI2_CORE_2_42_0.zip"
filename["$group-$index"]=at-spi2-core-AT_SPI2_CORE_2_42_0.zip
dirname["$group-$index"]=at-spi2-core-AT_SPI2_CORE_2_42_0
builder["$group-$index"]="meson"
dependencies["$group-$index"]="cmake/$compilo/3.31.8 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/1.17.8 gobject-introspection/$compilo/1.72.1 atk/$compilo/2.36.0 dbus/$compilo/1.13.18 Xtst/$compilo/1.2.3 xml2/$compilo/2.13.2"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# atk-bridge 2.38.0
index=21
name["$group-$index"]=atk-bridge
version["$group-$index"]=2.38.0
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/at-spi2-atk/2.38/at-spi2-atk-2.38.0.tar.xz"
filename["$group-$index"]=at-spi2-atk-2.38.0.tar.xz
dirname["$group-$index"]=at-spi2-atk-2.38.0
builder["$group-$index"]="meson"
dependencies["$group-$index"]="cmake/$compilo/3.31.8 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/1.17.8 gobject-introspection/$compilo/1.72.1 atk/$compilo/2.36.0 dbus/$compilo/1.13.18 Xtst/$compilo/1.2.3 xml2/$compilo/2.13.2 at-spi2-core/$compilo/2.42.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# wayland 1.19.0
index=22
name["$group-$index"]=wayland
version["$group-$index"]=1.19.0
details["$group-$index"]=""
url["$group-$index"]="https://wayland.freedesktop.org/releases/wayland-1.19.0.tar.xz"
filename["$group-$index"]=wayland-1.19.0.tar.xz
dirname["$group-$index"]=wayland-1.19.0
builder["$group-$index"]="meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} xml2/$compilo/2.13.2"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-Ddocumentation=false"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# wayland-protocols 1.21
index=23
name["$group-$index"]=wayland-protocols
version["$group-$index"]=1.21
details["$group-$index"]=""
url["$group-$index"]="https://wayland.freedesktop.org/releases/wayland-protocols-1.21.tar.xz"
filename["$group-$index"]=wayland-protocols-1.21.tar.xz
dirname["$group-$index"]=wayland-protocols-1.21
builder["$group-$index"]="meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} wayland/$compilo/1.19.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-Dtests=false"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/pkgconfig
"

# xkbcommon 1.3.0
index=24
name["$group-$index"]=xkbcommon
version["$group-$index"]=1.3.0
details["$group-$index"]=""
url["$group-$index"]="https://xkbcommon.org/download/libxkbcommon-1.3.0.tar.xz"
filename["$group-$index"]=libxkbcommon-1.3.0.tar.xz
dirname["$group-$index"]=libxkbcommon-1.3.0
builder["$group-$index"]="meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} xml2/$compilo/2.13.2 wayland/$compilo/1.19.0 wayland-protocols/$compilo/1.21"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-Denable-docs=false"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# Gtk 3.24.29
index=25
name["$group-$index"]=gtk
version["$group-$index"]=3.24.29
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/gtk+/3.24/gtk%2B-3.24.29.tar.xz -O gtk-3.24.29.tar.xz"
filename["$group-$index"]=gtk-3.24.29.tar.xz
dirname["$group-$index"]=gtk+-3.24.29
builder["$group-$index"]="gir_meson"
dependencies["$group-$index"]="cmake/$compilo/3.31.8 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/1.17.8 gobject-introspection/$compilo/1.72.1 harfbuzz/$compilo/2.8.2 pango/$compilo/1.48.6 gdk-pixbuf/$compilo/2.42.0 wayland/$compilo/1.19.0 wayland-protocols/$compilo/1.21 xkbcommon/$compilo/1.3.0 xrandr/$compilo/1.5.4 xi/$compilo/1.8.1 dbus/$compilo/1.13.18 atk-bridge/$compilo/2.38.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path GI_TYPELIB_PATH $prefix/${dirinstall["$group-$index"]}/lib/girepository-1.0
"

# graphviz 3.0.0
index=26
name["$group-$index"]=graphviz
version["$group-$index"]=3.0.0
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/3.0.0/graphviz-3.0.0.tar.gz"
filename["$group-$index"]=graphviz-3.0.0.tar.gz
dirname["$group-$index"]=graphviz-3.0.0
builder["$group-$index"]="configure"
dependencies["$group-$index"]="glib/$compilo/2.72.4 cairo/$compilo/1.17.8 pango/$compilo/1.48.6"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# vala 0.42.3
index=27
name["$group-$index"]=vala
version["$group-$index"]=0.42.3
details["$group-$index"]=""
url["$group-$index"]="http://download.gnome.org/sources/vala/0.42/vala-0.42.3.tar.xz"
filename["$group-$index"]=vala-0.42.3.tar.xz
dirname["$group-$index"]=vala-0.42.3
builder["$group-$index"]="configure"
dependencies["$group-$index"]="glib/$compilo/2.81.2 graphviz/$compilo/3.0.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# gtksourceview 3.24.11
index=28
name["$group-$index"]=gtksourceview
version["$group-$index"]=3.24.11
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/gtksourceview/3.24/gtksourceview-3.24.11.tar.xz"
filename["$group-$index"]=gtksourceview-3.24.11.tar.xz
dirname["$group-$index"]=gtksourceview-3.24.11
builder["$group-$index"]="gir_configure"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} gtk/$compilo/3.24.29 vala/$compilo/0.42.3"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="--enable-introspection=yes --enable-vala=no"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path GI_TYPELIB_PATH $prefix/${dirinstall["$group-$index"]}/lib/girepository-1.0
"

# PyGObject 3.40.1
index=29
name["$group-$index"]=gi
version["$group-$index"]=3.40.1
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/51/2f/4d5d5afb7000b9151e33952b59163c9389bd867ac6fe85d62f85831fa061/PyGObject-3.40.1.tar.gz"
filename["$group-$index"]=PyGObject-3.40.1.tar.gz
dirname["$group-$index"]=PyGObject-3.40.1
builder["$group-$index"]="meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} gtk/$compilo/3.24.29 gtksourceview/$compilo/3.24.11"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python


# vtk 7.1.1
index=30
name["$group-$index"]=vtk
version["$group-$index"]=7.1.1
details["$group-$index"]=""
url["$group-$index"]="https://www.vtk.org/files/release/7.1/VTK-7.1.1.tar.gz"
filename["$group-$index"]=VTK-7.1.1.tar.gz
dirname["$group-$index"]=VTK-7.1.1
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="Xtst/$compilo/1.2.3 xcursor/$compilo/1.2.1 xft/$compilo/2.3.8 xres/$compilo/1.2.2 sm/$compilo/1.2.4 xmu/$compilo/1.1.4 xpm/$compilo/3.5.17 xrandr/$compilo/1.5.4 xt/$compilo/1.2.1 xtrans/$compilo/1.5.0 ice/$compilo/1.1.0 xslt/$compilo/1.1.38 xaw/$compilo/1.0.15 x11/$compilo/1.7.5 xfixes/$compilo/6.0.1 xi/$compilo/1.8.1 xorg-macros/$compilo/1.20.0 xorg-proto/$compilo/2023.1 xtst/$compilo/1.2.3 xinerama/$compilo/1.1.5 xxf86vm/$compilo/1.1.5 xcb/$compilo/1.15 xcomposite/$compilo/0.4.6 xdamage/$compilo/1.1.6 xcb-util/$compilo/0.3.6 xkbfile/$compilo/1.1.2 xdmcp/$compilo/1.1.4 xss/$compilo/1.2.4 xv/$compilo/1.0.12 gcc/7.5.0 python/$compilo/3.7 python-modules/$compilo/3.7 xml2/$compilo/2.13.2 wayland/$compilo/1.19.0 wayland-protocols/$compilo/1.21 xkbcommon/$compilo/1.3.0 xcb-errors/$compilo/1.0.1 xcb-cursor/$compilo/0.1.6 xcb-xrm/$compilo/1.3 cmake/$compilo/3.31.8 mesa/$compilo/17.3.9"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-DOPENGL_gl_LIBRARY=$prefix/mesa/$compilo/17.3.9/lib/libGL.so.1 -DOPENGL_INCLUDE_DIR=$prefix/mesa/$compilo/17.3.9/include"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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
"

# xfixes 6.0.1
index=31
name["$group-$index"]=xfixes
version["$group-$index"]=6.0.1
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxfixes/-/archive/libXfixes-6.0.1/libxfixes-libXfixes-6.0.1.zip"
filename["$group-$index"]=libxfixes-libXfixes-6.0.1.zip
dirname["$group-$index"]=libxfixes-libXfixes-6.0.1
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# sm 1.2.4
index=32
name["$group-$index"]=sm
version["$group-$index"]=1.2.4
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libsm/-/archive/libSM-1.2.4/libsm-libSM-1.2.4.zip"
filename["$group-$index"]=libsm-libSM-1.2.4.zip
dirname["$group-$index"]=libsm-libSM-1.2.4
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 ice/$compilo/1.1.0 xtrans/$compilo/1.5.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# ice 1.1.0
index=33
name["$group-$index"]=ice
version["$group-$index"]=1.1.0
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libice/-/archive/libICE-1.1.0/libice-libICE-1.1.0.zip"
filename["$group-$index"]=libice-libICE-1.1.0.zip
dirname["$group-$index"]=libice-libICE-1.1.0
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 xtrans/$compilo/1.5.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"


# xt 1.2.1
index=34
name["$group-$index"]=xt
version["$group-$index"]=1.2.1
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxt/-/archive/libXt-1.2.1/libxt-libXt-1.2.1.zip"
filename["$group-$index"]=libxt-libXt-1.2.1.zip
dirname["$group-$index"]=libxt-libXt-1.2.1
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 sm/$compilo/1.2.4 ice/$compilo/1.1.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xtrans 1.5.0
index=35
name["$group-$index"]=xtrans
version["$group-$index"]=1.5.0
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxtrans/-/archive/xtrans-1.5.0/libxtrans-xtrans-1.5.0.zip"
filename["$group-$index"]=libxtrans-xtrans-1.5.0.zip
dirname["$group-$index"]=libxtrans-xtrans-1.5.0
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/pkgconfig
prepend-path ACLOCAL_PATH $prefix/${dirinstall["$group-$index"]}/share/aclocal
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# x11 1.7.5
index=36
name["$group-$index"]=x11
version["$group-$index"]=1.7.5
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libx11/-/archive/libX11-1.7.5/libx11-libX11-1.7.5.zip"
filename["$group-$index"]=libx11-libX11-1.7.5.zip
dirname["$group-$index"]=libx11-libX11-1.7.5
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 sm/$compilo/1.2.4 ice/$compilo/1.1.0 xtrans/$compilo/1.5.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xft 2.3.8
index=37
name["$group-$index"]=xft
version["$group-$index"]=2.3.8
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxft/-/archive/libXft-2.3.8/libxft-libXft-2.3.8.zip"
filename["$group-$index"]=libxft-libXft-2.3.8.zip
dirname["$group-$index"]=libxft-libXft-2.3.8
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xres 1.2.2
index=38
name["$group-$index"]=xres
version["$group-$index"]=1.2.2
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxres/-/archive/libXres-1.2.2/libxres-libXres-1.2.2.zip"
filename["$group-$index"]=libxres-libXres-1.2.2.zip
dirname["$group-$index"]=libxres-libXres-1.2.2
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xaw 1.0.15
index=39
name["$group-$index"]=xaw
version["$group-$index"]=1.0.15
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxaw/-/archive/libXaw-1.0.15/libxaw-libXaw-1.0.15.zip"
filename["$group-$index"]=libxaw-libXaw-1.0.15.zip
dirname["$group-$index"]=libxaw-libXaw-1.0.15
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 xt/$compilo/1.2.1 sm/$compilo/1.2.4 ice/$compilo/1.1.0 xmu/$compilo/1.1.4 xpm/$compilo/3.5.17"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xcursor 1.2.1
index=40
name["$group-$index"]=xcursor
version["$group-$index"]=1.2.1
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxcursor/-/archive/libXcursor-1.2.1/libxcursor-libXcursor-1.2.1.zip"
filename["$group-$index"]=libxcursor-libXcursor-1.2.1.zip
dirname["$group-$index"]=libxcursor-libXcursor-1.2.1
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 xfixes/$compilo/6.0.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xmu 1.1.4
index=41
name["$group-$index"]=xmu
version["$group-$index"]=1.1.4
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxmu/-/archive/libXmu-1.1.4/libxmu-libXmu-1.1.4.zip"
filename["$group-$index"]=libxmu-libXmu-1.1.4.zip
dirname["$group-$index"]=libxmu-libXmu-1.1.4
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 xt/$compilo/1.2.1 sm/$compilo/1.2.4 ice/$compilo/1.1.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xpm 3.5.17
index=42
name["$group-$index"]=xpm
version["$group-$index"]=3.5.17
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxpm/-/archive/libXpm-3.5.17/libxpm-libXpm-3.5.17.zip"
filename["$group-$index"]=libxpm-libXpm-3.5.17.zip
dirname["$group-$index"]=libxpm-libXpm-3.5.17
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xcomposite 0.4.6
index=43
name["$group-$index"]=xcomposite
version["$group-$index"]=0.4.6
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxcomposite/-/archive/libXcomposite-0.4.6/libxcomposite-libXcomposite-0.4.6.zip"
filename["$group-$index"]=libxcomposite-libXcomposite-0.4.6.zip
dirname["$group-$index"]=libxcomposite-libXcomposite-0.4.6
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 xfixes/$compilo/6.0.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xdamage 1.1.6
index=44
name["$group-$index"]=xdamage
version["$group-$index"]=1.1.6
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxdamage/-/archive/libXdamage-1.1.6/libxdamage-libXdamage-1.1.6.zip"
filename["$group-$index"]=libxdamage-libXdamage-1.1.6.zip
dirname["$group-$index"]=libxdamage-libXdamage-1.1.6
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 xfixes/$compilo/6.0.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xdmcp 1.1.4
index=45
name["$group-$index"]=xdmcp
version["$group-$index"]=1.1.4
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxdmcp/-/archive/libXdmcp-1.1.4/libxdmcp-libXdmcp-1.1.4.zip"
filename["$group-$index"]=libxdmcp-libXdmcp-1.1.4.zip
dirname["$group-$index"]=libxdmcp-libXdmcp-1.1.4
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xinerama 1.1.5
index=46
name["$group-$index"]=xinerama
version["$group-$index"]=1.1.5
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxinerama/-/archive/libXinerama-1.1.5/libxinerama-libXinerama-1.1.5.zip"
filename["$group-$index"]=libxinerama-libXinerama-1.1.5.zip
dirname["$group-$index"]=libxinerama-libXinerama-1.1.5
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"
# xxf86vm 1.1.5
index=47
name["$group-$index"]=xxf86vm
version["$group-$index"]=1.1.5
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxxf86vm/-/archive/libXxf86vm-1.1.5/libxxf86vm-libXxf86vm-1.1.5.zip"
filename["$group-$index"]=libxxf86vm-libXxf86vm-1.1.5.zip
dirname["$group-$index"]=libxxf86vm-libXxf86vm-1.1.5
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xcb-util 0.3.6
index=48
name["$group-$index"]=xcb-util
version["$group-$index"]=0.3.6
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxcb-util/-/archive/0.3.6/libxcb-util-0.3.6.zip"
filename["$group-$index"]=libxcb-util-0.3.6.zip
dirname["$group-$index"]=libxcb-util-0.3.6
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 xcb/$compilo/1.15 gperf/$compilo/3.3"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xkbfile 1.1.2
index=49
name["$group-$index"]=xkbfile
version["$group-$index"]=1.1.2
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxkbfile/-/archive/libxkbfile-1.1.2/libxkbfile-libxkbfile-1.1.2.zip"
filename["$group-$index"]=libxkbfile-libxkbfile-1.1.2.zip
dirname["$group-$index"]=libxkbfile-libxkbfile-1.1.2
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xcb 1.15
index=50
name["$group-$index"]=xcb
version["$group-$index"]=1.15
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxcb/-/archive/libxcb-1.15/libxcb-libxcb-1.15.zip"
filename["$group-$index"]=libxcb-libxcb-1.15.zip
dirname["$group-$index"]=libxcb-libxcb-1.15
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 xcb-proto/$compilo/1.15.2"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xcb-proto 1.15.2
index=51
name["$group-$index"]=xcb-proto
version["$group-$index"]=1.15.2
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/archive/xcb-proto-1.15.2/xcbproto-xcb-proto-1.15.2.zip"
filename["$group-$index"]=xcbproto-xcb-proto-1.15.2.zip
dirname["$group-$index"]=xcbproto-xcb-proto-1.15.2
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/pkgconfig
"

# gperf 3.3
index=52
name["$group-$index"]=gperf
version["$group-$index"]=3.3
details["$group-$index"]=""
url["$group-$index"]="http://ftp.gnu.org/pub/gnu/gperf/gperf-3.3.tar.gz"
filename["$group-$index"]=gperf-3.3.tar.gz
dirname["$group-$index"]=gperf-3.3
builder["$group-$index"]="configure"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/pkgconfig
"

# xss 1.2.4
index=53
name["$group-$index"]=xss
version["$group-$index"]=1.2.4
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxscrnsaver/-/archive/libXScrnSaver-1.2.4/libxscrnsaver-libXScrnSaver-1.2.4.zip"
filename["$group-$index"]=libxscrnsaver-libXScrnSaver-1.2.4.zip
dirname["$group-$index"]=libxscrnsaver-libXScrnSaver-1.2.4
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xv 1.0.12
index=54
name["$group-$index"]=xv
version["$group-$index"]=1.0.12
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxv/-/archive/libXv-1.0.12/libxv-libXv-1.0.12.zip"
filename["$group-$index"]=libxv-libXv-1.0.12.zip
dirname["$group-$index"]=libxv-libXv-1.0.12
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xcb-cursor 0.0.99
index=55
name["$group-$index"]=xcb-cursor
version["$group-$index"]=0.0.99
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxcb-cursor/-/archive/0.0.99/libxcb-cursor-0.0.99.zip"
filename["$group-$index"]=libxcb-cursor-0.0.99.zip
dirname["$group-$index"]=libxcb-cursor-0.0.99
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xcb-errors 1.0.1
index=56
name["$group-$index"]=xcb-errors
version["$group-$index"]=1.0.1
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxcb-errors/-/archive/xcb-util-errors-1.0.1/libxcb-errors-xcb-util-errors-1.0.1.zip"
filename["$group-$index"]=libxcb-errors-xcb-util-errors-1.0.1.zip
dirname["$group-$index"]=libxcb-errors-xcb-util-errors-1.0.1
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# xcb-wm 0.4.2
index=57
name["$group-$index"]=xcb-wm
version["$group-$index"]=0.4.2
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxcb-wm/-/archive/xcb-util-wm-0.4.2/libxcb-wm-xcb-util-wm-0.4.2.zip"
filename["$group-$index"]=libxcb-wm-xcb-util-wm-0.4.2.zip
dirname["$group-$index"]=libxcb-wm-xcb-util-wm-0.4.2
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# mesa 17.3.9
index=58
name["$group-$index"]=mesa
version["$group-$index"]=17.3.9
details["$group-$index"]=""
url["$group-$index"]="https://archive.mesa3d.org/older-versions/17.x/mesa-17.3.9.tar.xz"
filename["$group-$index"]=mesa-17.3.9.tar.xz
dirname["$group-$index"]=mesa-17.3.9
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 drm/$compilo/2.4.119 xdamage/$compilo/1.1.6 xfixes/$compilo/6.0.1 shmfence/$compilo/1.3.2 pciaccess/$compilo/0.17"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="--with-gallium-drivers=\"nouveau,swrast\""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# drm 2.4.119
index=59
name["$group-$index"]=drm
version["$group-$index"]=2.4.119
details["$group-$index"]=""
url["$group-$index"]="https://dri.freedesktop.org/libdrm/libdrm-2.4.119.tar.xz"
filename["$group-$index"]=libdrm-2.4.119.tar.xz
dirname["$group-$index"]=libdrm-2.4.119
builder["$group-$index"]="meson"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0 pciaccess/$compilo/0.17"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-Dintel=enabled"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# shmfence 1.3.2
index=60
name["$group-$index"]=shmfence
version["$group-$index"]=1.3.2
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/archive/libxshmfence-1.3.2/libxshmfence-libxshmfence-1.3.2.zip"
filename["$group-$index"]=libxshmfence-libxshmfence-1.3.2.zip
dirname["$group-$index"]=libxshmfence-libxshmfence-1.3.2
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# pciaccess 0.17
index=61
name["$group-$index"]=pciaccess
version["$group-$index"]=0.17
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/archive/libpciaccess-0.17/libpciaccess-libpciaccess-0.17.zip"
filename["$group-$index"]=libpciaccess-libpciaccess-0.17.zip
dirname["$group-$index"]=libpciaccess-libpciaccess-0.17
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# freeglut 3.2.0
index=62
name["$group-$index"]=freeglut
version["$group-$index"]=3.2.0
details["$group-$index"]=""
url["$group-$index"]="https://github.com/freeglut/freeglut/releases/download/v3.2.0/freeglut-3.2.0.tar.gz"
filename["$group-$index"]=freeglut-3.2.0.tar.gz
dirname["$group-$index"]=freeglut-3.2.0
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="cmake/$compilo/3.31.8 mesa/$compilo/17.3.9 glu/$compilo/9.0.1 xi/$compilo/1.8.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-DOPENGL_gl_LIBRARY=$prefix/mesa/$compilo/17.3.9/lib/libGL.so.1 -DOPENGL_INCLUDE_DIR=$prefix/mesa/$compilo/17.3.9/include -DOPENGL_glu_LIBRARY=$prefix/glu/$compilo/9.0.1/lib/libGLU.so.1"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# glu 9.0.1
index=63
name["$group-$index"]=glu
version["$group-$index"]=9.0.1
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/mesa/glu/-/archive/glu-9.0.1/glu-glu-9.0.1.zip"
filename["$group-$index"]=glu-glu-9.0.1.zip
dirname["$group-$index"]=glu-glu-9.0.1
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="mesa/$compilo/17.3.9 drm/$compilo/2.4.119"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# glut snapshot
index=64
name["$group-$index"]=glut
version["$group-$index"]=snapshot
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/mesa/glut/-/archive/master/glut-master.zip"
filename["$group-$index"]=glut-master.zip
dirname["$group-$index"]=glut-master
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="makedepend/$compilo/1.0.6 mesa/$compilo/17.3.9 glu/$compilo/9.0.1 xmu/$compilo/1.1.4 xi/$compilo/1.8.1"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/lib/pkgconfig
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# makedepend 1.0.6
index=65
name["$group-$index"]=makedepend
version["$group-$index"]=1.0.6
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/util/makedepend/-/archive/makedepend-1.0.6/makedepend-makedepend-1.0.6.zip"
filename["$group-$index"]=makedepend-makedepend-1.0.6.zip
dirname["$group-$index"]=makedepend-makedepend-1.0.6
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/1.20.0"
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion

puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}

module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
"


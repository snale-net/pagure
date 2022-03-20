#!/bin/bash

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
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.8.0 udunits/$compilo/2.2.28"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 udunits/$compilo/2.2.28"
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
	dependencies["$group-$index"]="cmake/$compilo/3.20.5 zlib/$compilo/1.2.11 lapack-blas/$compilo/3.9.0 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.8.0 netcdf-fortran/hdf5.110/$compilo/4.5.3"
    dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
    args["$group-$index"]="-DVTK_USE_SYSTEM_ZLIB=ON -DVTK_USE_SYSTEM_HDF5=ON -DVTK_USE_SYSTEM_NETCDF=ON"
    dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
else
	dependencies["$group-$index"]="$mpi_dep cmake/$compilo/3.20.5 zlib/$compilo/1.2.11 lapack-blas/$compilo/3.9.0 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 netcdf-fortran/hdf5.110/$mpilib/$compilo/4.5.3"
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

# libxml2 snapshot
index=3
name["$group-$index"]=libxml2
version["$group-$index"]=snapshot
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.gnome.org/GNOME/libxml2/-/archive/master/libxml2-master.zip"
filename["$group-$index"]=libxml2-master.zip
dirname["$group-$index"]=libxml2-master
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cmake/$compilo/3.20.5"
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

# libxslt snapshot
index=4
name["$group-$index"]=libxslt
version["$group-$index"]=snapshot
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.gnome.org/GNOME/libxslt/-/archive/master/libxslt-master.zip"
filename["$group-$index"]=libxslt-master.zip
dirname["$group-$index"]=libxslt-master
builder["$group-$index"]="cmake"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cmake/$compilo/3.20.5 libxml2/$compilo/snapshot"
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
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} libxml2/$compilo/snapshot libxslt/$compilo/snapshot"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# cairo snapshot
index=6
name["$group-$index"]=cairo
version["$group-$index"]=snapshot
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/cairo/cairo/-/archive/master/cairo-master.zip"
filename["$group-$index"]=cairo-master.zip
dirname["$group-$index"]=cairo-master
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
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/snapshot"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# glib 2.68.3
index=8
name["$group-$index"]=glib
version["$group-$index"]=2.68.3
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/glib/2.68/glib-2.68.3.tar.xz"
filename["$group-$index"]=glib-2.68.3.tar.xz
dirname["$group-$index"]=glib-2.68.3
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

# gobject-introspection 1.68.0
index=9
name["$group-$index"]=gobject-introspection
version["$group-$index"]=1.68.0
details["$group-$index"]=""
url["$group-$index"]="https://download-fallback.gnome.org/sources/gobject-introspection/1.68/gobject-introspection-1.68.0.tar.xz"
filename["$group-$index"]=gobject-introspection-1.68.0.tar.xz
dirname["$group-$index"]=gobject-introspection-1.68.0
builder["$group-$index"]="meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} glib/$compilo/2.68.3 bison/$compilo/3.7"
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
dependencies["$group-$index"]="cmake/$compilo/3.20.5 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/snapshot gobject-introspection/$compilo/1.68.0"
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

# pango 1.48.6
index=11
name["$group-$index"]=pango
version["$group-$index"]=1.48.6
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/pango/1.48/pango-1.48.6.tar.xz"
filename["$group-$index"]=pango-1.48.6.tar.xz
dirname["$group-$index"]=pango-1.48.6
builder["$group-$index"]="gir_meson"
dependencies["$group-$index"]="cmake/$compilo/3.20.5 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/snapshot gobject-introspection/$compilo/1.68.0 harfbuzz/$compilo/2.8.2 "
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
dependencies["$group-$index"]="cmake/$compilo/3.20.5 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/snapshot gobject-introspection/$compilo/1.68.0"
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

# xorg-macros snapshot
index=13
name["$group-$index"]=xorg-macros
version["$group-$index"]=snapshot
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/util/macros/-/archive/master/macros-master.zip"
filename["$group-$index"]=macros-master.zip
dirname["$group-$index"]=macros-master
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

# xorg-proto snapshot
index=14
name["$group-$index"]=xorg-proto
version["$group-$index"]=snapshot
details["$group-$index"]=""
url["$group-$index"]="https://github.com/freedesktop/xorg-xorgproto/archive/refs/heads/master.zip -O xorg-proto-master.zip"
filename["$group-$index"]=xorg-proto-master.zip
dirname["$group-$index"]=xorg-xorgproto-master
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
prepend-path PKG_CONFIG_PATH $prefix/${dirinstall["$group-$index"]}/share/pkgconfig
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include
"

# libxrandr snapshot
index=15
name["$group-$index"]=libxrandr
version["$group-$index"]=snapshot
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxrandr/-/archive/master/libxrandr-master.zip"
filename["$group-$index"]=libxrandr-master.zip
dirname["$group-$index"]=libxrandr-master
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/snapshot xorg-proto/$compilo/snapshot"
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

# libxi snapshot
index=16
name["$group-$index"]=libxi
version["$group-$index"]=snapshot
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.freedesktop.org/xorg/lib/libxi/-/archive/master/libxi-master.zip"
filename["$group-$index"]=libxi-master.zip
dirname["$group-$index"]=libxi-master
builder["$group-$index"]="autogen"
dependencies["$group-$index"]="xorg-macros/$compilo/snapshot xorg-proto/$compilo/snapshot"
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
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/snapshot gobject-introspection/$compilo/1.68.0"
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
dependencies["$group-$index"]="cmake/$compilo/3.20.5 gobject-introspection/$compilo/1.68.0"
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

# libXtst 1.2.3
index=19
name["$group-$index"]=libXtst
version["$group-$index"]=1.2.3
details["$group-$index"]=""
url["$group-$index"]="https://www.paldo.org/paldo/sources/xtst/libXtst-1.2.3.tar.bz2"
filename["$group-$index"]=libXtst-1.2.3.tar.bz2
dirname["$group-$index"]=libXtst-1.2.3
builder["$group-$index"]="configure"
dependencies["$group-$index"]="libxi/$compilo/snapshot xorg-macros/$compilo/snapshot xorg-proto/$compilo/snapshot"
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

# atk-bridge 2.38.0
index=20
name["$group-$index"]=atk-bridge
version["$group-$index"]=2.38.0
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/at-spi2-atk/2.38/at-spi2-atk-2.38.0.tar.xz"
filename["$group-$index"]=at-spi2-atk-2.38.0.tar.xz
dirname["$group-$index"]=at-spi2-atk-2.38.0
builder["$group-$index"]="meson"
dependencies["$group-$index"]="cmake/$compilo/3.20.5 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/snapshot gobject-introspection/$compilo/1.68.0 atk/$compilo/2.36.0 dbus/$compilo/1.13.18 libXtst/$compilo/1.2.3 libxml2/$compilo/snapshot"
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
index=21
name["$group-$index"]=wayland
version["$group-$index"]=1.19.0
details["$group-$index"]=""
url["$group-$index"]="https://wayland.freedesktop.org/releases/wayland-1.19.0.tar.xz"
filename["$group-$index"]=wayland-1.19.0.tar.xz
dirname["$group-$index"]=wayland-1.19.0
builder["$group-$index"]="meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} libxml2/$compilo/snapshot"
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
index=22
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

# libxkbcommon 1.3.0
index=23
name["$group-$index"]=libxkbcommon
version["$group-$index"]=1.3.0
details["$group-$index"]=""
url["$group-$index"]="https://xkbcommon.org/download/libxkbcommon-1.3.0.tar.xz"
filename["$group-$index"]=libxkbcommon-1.3.0.tar.xz
dirname["$group-$index"]=libxkbcommon-1.3.0
builder["$group-$index"]="meson"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} libxml2/$compilo/snapshot wayland/$compilo/1.19.0 wayland-protocols/$compilo/1.21"
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

# Gtk 3.24.29
index=24
name["$group-$index"]=gtk
version["$group-$index"]=3.24.29
details["$group-$index"]=""
url["$group-$index"]="https://download.gnome.org/sources/gtk+/3.24/gtk%2B-3.24.29.tar.xz -O gtk-3.24.29.tar.xz"
filename["$group-$index"]=gtk-3.24.29.tar.xz
dirname["$group-$index"]=gtk+-3.24.29
builder["$group-$index"]="gir_meson"
dependencies["$group-$index"]="cmake/$compilo/3.20.5 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} cairo/$compilo/snapshot gobject-introspection/$compilo/1.68.0 harfbuzz/$compilo/2.8.2 pango/$compilo/1.48.6 gdk-pixbuf/$compilo/2.42.0 wayland/$compilo/1.19.0 wayland-protocols/$compilo/1.21 libxkbcommon/$compilo/1.3.0 libxrandr/$compilo/snapshot libxi/$compilo/snapshot dbus/$compilo/1.13.18 atk-bridge/$compilo/2.38.0"
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
index=25
name["$group-$index"]=graphviz
version["$group-$index"]=3.0.0
details["$group-$index"]=""
url["$group-$index"]="https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/3.0.0/graphviz-3.0.0.tar.gz"
filename["$group-$index"]=graphviz-3.0.0.tar.gz
dirname["$group-$index"]=graphviz-3.0.0
builder["$group-$index"]="configure"
dependencies["$group-$index"]="glib/$compilo/2.68.3 cairo/$compilo/snapshot pango/$compilo/1.48.6"
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
index=26
name["$group-$index"]=vala
version["$group-$index"]=0.42.3
details["$group-$index"]=""
url["$group-$index"]="http://download.gnome.org/sources/vala/0.42/vala-0.42.3.tar.xz"
filename["$group-$index"]=vala-0.42.3.tar.xz
dirname["$group-$index"]=vala-0.42.3
builder["$group-$index"]="configure"
dependencies["$group-$index"]="glib/$compilo/2.68.3 graphviz/$compilo/3.0.0"
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
index=27
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
index=28
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


#!/bin/bash

#################################################################
#Group 5 : Python
group=5
groupname[$group]="Python librairies"

# setuptools 42.0.2
index=1
name["$group$index"]=setuptools
version["$group$index"]=42.0.2
details["$group$index"]=""
url["$group$index"]=https://files.pythonhosted.org/packages/f7/b6/5b98441b6749ea1db1e41e5e6e7a93cbdd7ffd45e11fe1b22d45884bc777/setuptools-42.0.2.zip
filename["$group$index"]=setuptools-42.0.2.zip
dirname["$group$index"]=setuptools-42.0.2
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# numpy 1.18.0
index=2
name["$group$index"]=numpy
version["$group$index"]=1.18.0
details["$group$index"]=""
url["$group$index"]=https://files.pythonhosted.org/packages/31/0a/5df350c29a06835d534a6c4f5681075304da38d85f1c69e5226a635a67ce/numpy-1.18.0.zip
filename["$group$index"]=numpy-1.18.0.zip
dirname["$group$index"]=numpy-1.18.0
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# python-dateutil 2.8.1
index=3
name["$group$index"]=python-dateutil
version["$group$index"]=2.8.1
details["$group$index"]=""
url["$group$index"]=https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0/python-dateutil-2.8.1.tar.gz
filename["$group$index"]=python-dateutil-2.8.1.tar.gz
dirname["$group$index"]=python-dateutil-2.8.1
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# pybind11 2.4.3
index=4
name["$group$index"]=pybind11
version["$group$index"]=2.4.3
details["$group$index"]=""
url["$group$index"]=https://files.pythonhosted.org/packages/aa/91/deb6743e79e22ab01502296570b39b8404f10cc507a6692d612a7fee8d51/pybind11-2.4.3.tar.gz
filename["$group$index"]=pybind11-2.4.3.tar.gz
dirname["$group$index"]=pybind11-2.4.3
builder["$group$index"]="pybind11"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# Cython 0.29.14
index=5
name["$group$index"]=cython
version["$group$index"]=0.29.14
details["$group$index"]=""
url["$group$index"]=https://files.pythonhosted.org/packages/9c/9b/706dac7338c2860cd063a28cdbf5e9670995eaea408abbf2e88ba070d90d/Cython-0.29.14.tar.gz
filename["$group$index"]=Cython-0.29.14.tar.gz
dirname["$group$index"]=Cython-0.29.14
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# pandas 0.25.3
index=6
name["$group$index"]=pandas
version["$group$index"]=0.25.3
details["$group$index"]=""
url["$group$index"]=https://files.pythonhosted.org/packages/b7/93/b544dd08092b457d88e10fc1e0989d9397fd32ca936fdfcbb2584178dd2b/pandas-0.25.3.tar.gz
filename["$group$index"]=pandas-0.25.3.tar.gz
dirname["$group$index"]=pandas-0.25.3
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# scipy 1.4.1
index=7
name["$group$index"]=scipy
version["$group$index"]=1.4.1
details["$group$index"]=""
url["$group$index"]="https://github.com/scipy/scipy/archive/v1.4.1.tar.gz -O scipy-1.4.1.tar.gz"
filename["$group$index"]=scipy-1.4.1.tar.gz
dirname["$group$index"]=scipy-1.4.1
builder["$group$index"]="python"
dependencies["$group$index"]="lapack-blas/$compilo/3.8.0"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# cftime 1.0.4.2
index=8
name["$group$index"]=cftime
version["$group$index"]=1.0.4.2
details["$group$index"]="(version Python - required NetCDF C / HDF5)"
url["$group$index"]="https://files.pythonhosted.org/packages/f3/a7/203301f17c2ce458fad9b2da7c71b26dc3890b12a0200426ae960f8c9b60/cftime-1.0.4.2.tar.gz"
filename["$group$index"]=cftime-1.0.4.2.tar.gz
dirname["$group$index"]=cftime-1.0.4.2
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# mpi4py 3.0.3
index=9
name["$group$index"]=mpi4py
version["$group$index"]=3.0.3
details["$group$index"]="required OpenMPI 1.70.7"
url["$group$index"]="https://files.pythonhosted.org/packages/ec/8f/bbd8de5ba566dd77e408d8136e2bab7fdf2b97ce06cab830ba8b50a2f588/mpi4py-3.0.3.tar.gz"
filename["$group$index"]=mpi4py-3.0.3.tar.gz
dirname["$group$index"]=mpi4py-3.0.3
builder["$group$index"]="python"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.25"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# netcdf4-python 1.5.3
index=10
name["$group$index"]=netcdf4-python
version["$group$index"]=1.5.3
details["$group$index"]="(version Python - required HDF5 1.10.5 / NetCDF C 7.4.3 / Pnetcdf 1.12.1 / Cython 0.29.17 / cftime 1.0.4.2)"
url["$group$index"]="https://github.com/Unidata/netcdf4-python/archive/v1.5.3rel.tar.gz -O netcdf4-python-1.5.3.tar.gz"
filename["$group$index"]=netcdf4-python-1.5.3.tar.gz
dirname["$group$index"]=netcdf4-python-1.5.3rel
builder["$group$index"]="python"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.25"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

if [ "$showOldVersion" = "1" ]; then

# netCDF4 1.2.9
index=11
name["$group$index"]=netCDF4
version["$group$index"]=1.2.9
details["$group$index"]="(version Python - required NetCDF C)"
url["$group$index"]=https://pypi.python.org/packages/6a/37/49fd7cc21af0fb173e40de5e15f7fdd48d521429922a90347219c77b0c36/netCDF4-1.2.9.tar.gz#md5=e320491d52c42e937e6df47b56a2579c
filename["$group$index"]=netCDF4-1.2.9.tar.gz
dirname["$group$index"]=netCDF4-1.2.9
configfile["$group$index"]="# Rename this file to setup.cfg to set build options.
# Follow instructions below for editing.
[options]
use_ncconfig=True
use_cython=True
[directories]
netCDF4_dir = $prefix/netcdf/hdf5.110/openmpi110/$compilo/c/4.4.1.1/
HDF5_dir = $prefix/hdf5/openmpi110/$compilo/1.10.5/
HDF5_libdir = $prefix/hdf5/openmpi110/$compilo/1.10.5/lib
HDF5_incdir = $prefix/hdf5/openmpi110/$compilo/1.10.5/include
szip_libdir = $prefix/zlib/$compilo/1.2.11/lib
"
configfilename["$group$index"]="setup.cfg"
patch["$group$index"]="--- setup.py	2017-06-18 22:38:30.000000000 +0200
+++ ../setup_fixed.py	2017-09-12 18:46:19.821782818 +0200
@@ -271,11 +271,7 @@
     else:
         if HDF5_incdir is None:
             HDF5_incdir = os.path.join(HDF5_dir, 'include')
-        hdf5_version = check_hdf5version(HDF5_incdir)
-        if hdf5_version is None:
-            raise ValueError('did not find HDF5 headers in %s' % HDF5_incdir)
-        elif hdf5_version[1:6] < '1.8.0':
-            raise ValueError('HDF5 version >= 1.8.0 is required')
+        hdf5_version = check_hdf5version(HDF5_incdir)       
 
     if netCDF4_incdir is None and netCDF4_dir is None:
         sys.stdout.write( \"\"\"
@@ -314,6 +310,7 @@
     if HDF5_libdir is not None: lib_dirs.append(HDF5_libdir)
     if netCDF4_incdir is not None: inc_dirs = [netCDF4_incdir]
     if HDF5_incdir is not None: inc_dirs.append(HDF5_incdir)
+    lib_dirs.append(szip_libdir)
 
     # add szip to link if desired.
     if szip_libdir is None and szip_dir is not None:
"
patchfile["$group$index"]="setup.py"

builder["$group$index"]="python"
dependencies["$group$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf/hdf5.110/$mpilib/$compilo/4.4.1.1 udunits/$compilo/2.2.25"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

fi # end-old-version

# pygdal 3.0.1.5
index=12
name["$group$index"]=pygdal
version["$group$index"]=3.0.1.5
details["$group$index"]="(version Python - required GDAL 3.0.1)"
url["$group$index"]=https://files.pythonhosted.org/packages/c4/39/480a0e18ba65b070a8dd1a9124a891ea7fea8f58a07b39462d9c94f13ccf/pygdal-3.0.1.5.tar.gz
filename["$group$index"]=pygdal-3.0.1.5.tar.gz
dirname["$group$index"]=pygdal-3.0.1.5
builder["$group$index"]="python"
dependencies["$group$index"]="gdal/$compilo/3.0.1"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# matplotlib 3.1.1
index=13
name["$group$index"]=matplotlib
version["$group$index"]=3.1.1
details["$group$index"]=
url["$group$index"]="https://github.com/matplotlib/matplotlib/archive/v3.1.1.tar.gz -O matplotlib-3.1.1.tar.gz"
filename["$group$index"]=matplotlib-3.1.1.tar.gz
dirname["$group$index"]=matplotlib-3.1.1
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# array_split 0.2.0
index=14
name["$group$index"]=array_split
version["$group$index"]=0.2.0
details["$group$index"]=
url["$group$index"]="https://files.pythonhosted.org/packages/8c/34/ab1bb66a6c7f8b27b7cd8bfb5eb87deeac705587194127529d0449243098/array_split-0.2.0.tar.gz"
filename["$group$index"]=array_split-0.2.0.tar.gz
dirname["$group$index"]=array_split-0.2.0
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# pymesh 0.2.1
index=15
name["$group$index"]=pymesh
version["$group$index"]=0.2.1
details["$group$index"]=
url["$group$index"]="https://github.com/PyMesh/PyMesh/archive/v0.2.1.tar.gz -O pymesh-0.2.1.tar.gz"
filename["$group$index"]=pymesh-0.2.1.tar.gz
dirname["$group$index"]=PyMesh-0.2.1
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# Jinja2 2.10.3
index=16
name["$group$index"]=Jinja2
version["$group$index"]=2.10.3
details["$group$index"]=
url["$group$index"]="https://files.pythonhosted.org/packages/7b/db/1d037ccd626d05a7a47a1b81ea73775614af83c2b3e53d86a0bb41d8d799/Jinja2-2.10.3.tar.gz"
filename["$group$index"]=Jinja2-2.10.3.tar.gz
dirname["$group$index"]=Jinja2-2.10.3
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# f90nml 1.1.2
index=17
name["$group$index"]=f90nml
version["$group$index"]=1.1.2
details["$group$index"]=
url["$group$index"]="https://files.pythonhosted.org/packages/39/7e/578388fad751a75dd087598c3e28a8e045b95ee219eb768ee3c80c5c1d88/f90nml-1.1.2.tar.gz"
filename["$group$index"]=f90nml-1.1.2.tar.gz
dirname["$group$index"]=f90nml-1.1.2
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""



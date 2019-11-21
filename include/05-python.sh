#!/bin/bash

#################################################################
#Group 5 : Python
group=5
groupname[$group]="Python librairies"

# setuptools 36.5.0
index=1
name["$group$index"]=setuptools
version["$group$index"]=36.5.0
details["$group$index"]=""
url["$group$index"]=https://pypi.python.org/packages/a4/c8/9a7a47f683d54d83f648d37c3e180317f80dc126a304c45dc6663246233a/setuptools-36.5.0.zip#md5=704f500dd55f4bd0be905444f3ba892c
filename["$group$index"]=setuptools-36.5.0.zip
dirname["$group$index"]=setuptools-36.5.0
builder["$group$index"]="python"
dependencies["$group$index"]="openmpi/$compilo/1.10.7 zlib/$compilo/1.2.11 hdf5/openmpi110/$compilo/1.10.5 parallel-netcdf/openmpi110/$compilo/1.6.1 netcdf/hdf5.110/openmpi110/$compilo/4.4.1.1"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# Numpy 1.13.1
index=2
name["$group$index"]=numpy
version["$group$index"]=1.13.1
details["$group$index"]=""
url["$group$index"]=https://pypi.python.org/packages/c0/3a/40967d9f5675fbb097ffec170f59c2ba19fc96373e73ad47c2cae9a30aed/numpy-1.13.1.zip#md5=2c3c0f4edf720c3a7b525dacc825b9ae
filename["$group$index"]=numpy-1.13.1.zip
dirname["$group$index"]=numpy-1.13.1
builder["$group$index"]="python"
dependencies["$group$index"]="openmpi/$compilo/1.10.7 zlib/$compilo/1.2.11 hdf5/openmpi110/$compilo/1.10.5 parallel-netcdf/openmpi110/$compilo/1.6.1 netcdf/hdf5.110/openmpi110/$compilo/4.4.1.1"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# python-dateutil 1.5
index=3
name["$group$index"]=python-dateutil
version["$group$index"]=1.5
details["$group$index"]=""
url["$group$index"]=https://pypi.python.org/packages/b4/7c/df59c89a753eb33c7c44e1dd42de0e9bc2ccdd5a4d576e0bfad97cc280cb/python-dateutil-1.5.tar.gz#md5=0dcb1de5e5cad69490a3b6ab63f0cfa5
filename["$group$index"]=python-dateutil-1.5.tar.gz
dirname["$group$index"]=python-dateutil-1.5
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# pandas 0.20.3
index=4
name["$group$index"]=pandas
version["$group$index"]=0.20.3
details["$group$index"]=""
url["$group$index"]=https://pypi.python.org/packages/ee/aa/90c06f249cf4408fa75135ad0df7d64c09cf74c9870733862491ed5f3a50/pandas-0.20.3.tar.gz#md5=4df858f28b4bf4fa07d9fbb7f2568173
filename["$group$index"]=pandas-0.20.3.tar.gz
dirname["$group$index"]=pandas-0.20.3
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# scipy 0.19.1
index=5
name["$group$index"]=scipy
version["$group$index"]=0.19.1
details["$group$index"]=""
url["$group$index"]=https://pypi.python.org/packages/52/67/d9ef9b5058d4a9e3f0ae641ec151790622cbeb37f157de5773358e2bf3da/scipy-0.19.1.tar.gz#md5=6b4d91b62f1926282b127194a06b72b3
filename["$group$index"]=scipy-0.19.1.tar.gz
dirname["$group$index"]=scipy-0.19.1
builder["$group$index"]="python"
dependencies["$group$index"]=""
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# netCDF4 1.2.9
index=6
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
dependencies["$group$index"]="openmpi/$compilo/1.10.7 zlib/$compilo/1.2.11 hdf5/openmpi110/$compilo/1.10.5 netcdf/hdf5.110/openmpi110/$compilo/4.4.1.1 udunits/$compilo/2.2.25"
dirinstall["$group$index"]="${name["$group$index"]}/$compilo/${version["$group$index"]}"
args["$group$index"]=""
#dirmodule["$group$index"]="${name["$group$index"]}/$compilo"
#modulefile["$group$index"]=""

# pygdal 3.0.1.5
index=7
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
index=8
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


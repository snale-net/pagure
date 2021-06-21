#!/bin/bash

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

#################################################################
#Group 3 : Python modules
group=3
groupname[$group]="Python modules"

# setuptools 57.0.0
index=1
name["$group-$index"]=setuptools
version["$group-$index"]=57.0.0
mandatory["$group-$index"]=1
details["$group-$index"]="(required by all Python libraries)"
url["$group-$index"]=https://files.pythonhosted.org/packages/88/fc/d17731c0cc67a5a8e385e4f47c3b0b186720e198b70f076ccb4676804a8f/setuptools-57.0.0.tar.gz
filename["$group-$index"]=setuptools-57.0.0.tar.gz
dirname["$group-$index"]=setuptools-57.0.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion >= 3.5" | bc -l) )); then # only Python>=3.5
# setuptools-scm 6.0.1
index=2
name["$group-$index"]=setuptools_scm
version["$group-$index"]=6.0.1
mandatory["$group-$index"]=1
details["$group-$index"]=""
url["$group-$index"]=https://files.pythonhosted.org/packages/57/38/930b1241372a9f266a7df2b184fb9d4f497c2cef2e016b014f82f541fe7c/setuptools_scm-6.0.1.tar.gz
filename["$group-$index"]=setuptools_scm-6.0.1.tar.gz
dirname["$group-$index"]=setuptools_scm-6.0.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""
else 
# setuptools-scm 5.0.2
index=3
name["$group-$index"]=setuptools_scm
version["$group-$index"]=5.0.2
mandatory["$group-$index"]=1
details["$group-$index"]=""
url["$group-$index"]=https://files.pythonhosted.org/packages/56/c9/09f4a531720b1bf54f316fdff926fbb937c59a9c4a34e3a533b26e501898/setuptools_scm-5.0.2.tar.gz
filename["$group-$index"]=setuptools_scm-5.0.2.tar.gz
dirname["$group-$index"]=setuptools_scm-5.0.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""
fi

# Cython 0.29.14
index=4
name["$group-$index"]=cython
version["$group-$index"]=0.29.14
mandatory["$group-$index"]=1
details["$group-$index"]=""
url["$group-$index"]=https://files.pythonhosted.org/packages/9c/9b/706dac7338c2860cd063a28cdbf5e9670995eaea408abbf2e88ba070d90d/Cython-0.29.14.tar.gz
filename["$group-$index"]=Cython-0.29.14.tar.gz
dirname["$group-$index"]=Cython-0.29.14
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion >= 3.5" | bc -l) )); then # only Python>=3.5
# numpy 1.18.1
index=5
name["$group-$index"]=numpy
version["$group-$index"]=1.18.1
mandatory["$group-$index"]=1
details["$group-$index"]="(require Lapack-Blas 3.9.0)"
url["$group-$index"]=https://files.pythonhosted.org/packages/40/de/0ea5092b8bfd2e3aa6fdbb2e499a9f9adf810992884d414defc1573dca3f/numpy-1.18.1.zip
filename["$group-$index"]=numpy-1.18.1.zip
dirname["$group-$index"]=numpy-1.18.1
patch_01["$group-$index"]="--- numpy/distutils/intelccompiler_original.py	2020-02-14 11:17:16.471959103 +0100
+++ numpy/distutils/intelccompiler.py	2020-02-14 11:16:30.791713000 +0100
@@ -60,7 +60,7 @@
 
         v = self.get_version()
         mpopt = 'openmp' if v and v < '15' else 'qopenmp'
-        self.cc_exe = ('icc -m64 -fPIC -fp-model strict -O3 '
+        self.cc_exe = ('icc -m64 -std=c99 -fPIC -fp-model strict -O3 '
                        '-fomit-frame-pointer -{}').format(mpopt)
         compiler = self.cc_exe
 

"
patchfile_01["$group-$index"]="numpy/distutils/intelccompiler.py"
builder["$group-$index"]="numpy"
dependencies["$group-$index"]="lapack-blas/$compilo/3.9.0 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

else
# numpy 1.16.6
index=6
name["$group-$index"]=numpy
version["$group-$index"]=1.16.6
mandatory["$group-$index"]=1
details["$group-$index"]="(require Lapack-Blas 3.9.0)"
url["$group-$index"]=https://files.pythonhosted.org/packages/b7/6f/24647f014eef9b67a24adfcbcd4f4928349b4a0f8393b3d7fe648d4d2de3/numpy-1.16.6.zip
filename["$group-$index"]=numpy-1.16.6.zip
dirname["$group-$index"]=numpy-1.16.6
builder["$group-$index"]="numpy"
dependencies["$group-$index"]="lapack-blas/$compilo/3.9.0 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi

# dateutil 2.8.1
index=7
name["$group-$index"]=dateutil
version["$group-$index"]=2.8.1
mandatory["$group-$index"]=1
details["$group-$index"]=""
url["$group-$index"]=https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0/python-dateutil-2.8.1.tar.gz
filename["$group-$index"]=python-dateutil-2.8.1.tar.gz
dirname["$group-$index"]=python-dateutil-2.8.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""


# pybind11 2.4.3
index=8
name["$group-$index"]=pybind11
version["$group-$index"]=2.4.3
mandatory["$group-$index"]=1
details["$group-$index"]=""
url["$group-$index"]=https://files.pythonhosted.org/packages/aa/91/deb6743e79e22ab01502296570b39b8404f10cc507a6692d612a7fee8d51/pybind11-2.4.3.tar.gz
filename["$group-$index"]=pybind11-2.4.3.tar.gz
dirname["$group-$index"]=pybind11-2.4.3
builder["$group-$index"]="pybind11"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# pytz 2021.1
index=9
name["$group-$index"]=pytz
version["$group-$index"]=2021.1
mandatory["$group-$index"]=1
details["$group-$index"]=""
url["$group-$index"]=https://files.pythonhosted.org/packages/b0/61/eddc6eb2c682ea6fd97a7e1018a6294be80dba08fa28e7a3570148b4612d/pytz-2021.1.tar.gz
filename["$group-$index"]=pytz-2021.1.tar.gz
dirname["$group-$index"]=pytz-2021.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
# pandas 0.25.3
index=10
name["$group-$index"]=pandas
version["$group-$index"]=0.25.3
mandatory["$group-$index"]=1
details["$group-$index"]=""
url["$group-$index"]=https://files.pythonhosted.org/packages/b7/93/b544dd08092b457d88e10fc1e0989d9397fd32ca936fdfcbb2584178dd2b/pandas-0.25.3.tar.gz
filename["$group-$index"]=pandas-0.25.3.tar.gz
dirname["$group-$index"]=pandas-0.25.3
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

else
# pandas 0.23.4
index=11
name["$group-$index"]=pandas
version["$group-$index"]=0.23.4
mandatory["$group-$index"]=1
details["$group-$index"]=""
url["$group-$index"]=https://files.pythonhosted.org/packages/e9/ad/5e92ba493eff96055a23b0a1323a9a803af71ec859ae3243ced86fcbd0a4/pandas-0.23.4.tar.gz
filename["$group-$index"]=pandas-0.23.4.tar.gz
dirname["$group-$index"]=pandas-0.23.4
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi

if (( $(echo "$pythonVersion >= 3.5" | bc -l) )); then # only Python>=3.5
# scipy 1.4.1
index=12
name["$group-$index"]=scipy
version["$group-$index"]=1.4.1
mandatory["$group-$index"]=1
details["$group-$index"]="(require Lapack-Blas 3.9.0)"
url["$group-$index"]="https://github.com/scipy/scipy/archive/v1.4.1.tar.gz -O scipy-1.4.1.tar.gz"
filename["$group-$index"]=scipy-1.4.1.tar.gz
dirname["$group-$index"]=scipy-1.4.1
builder["$group-$index"]="scipy"
dependencies["$group-$index"]="lapack-blas/$compilo/3.9.0 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

else
# scipy 1.2.3
index=13
name["$group-$index"]=scipy
version["$group-$index"]=1.2.3
mandatory["$group-$index"]=1
details["$group-$index"]="(require Lapack-Blas 3.9.0)"
url["$group-$index"]="https://github.com/scipy/scipy/archive/v1.2.3.tar.gz -O scipy-1.2.3.tar.gz"
filename["$group-$index"]=scipy-1.2.3.tar.gz
dirname["$group-$index"]=scipy-1.2.3
builder["$group-$index"]="scipy"
dependencies["$group-$index"]="lapack-blas/$compilo/3.9.0 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi

# cftime 1.0.4.2
index=14
name["$group-$index"]=cftime
version["$group-$index"]=1.0.4.2
mandatory["$group-$index"]=1
details["$group-$index"]=""
url["$group-$index"]="https://files.pythonhosted.org/packages/f3/a7/203301f17c2ce458fad9b2da7c71b26dc3890b12a0200426ae960f8c9b60/cftime-1.0.4.2.tar.gz"
filename["$group-$index"]=cftime-1.0.4.2.tar.gz
dirname["$group-$index"]=cftime-1.0.4.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# pyparsing 2.4.7
index=15
name["$group-$index"]=pyparsing
version["$group-$index"]=2.4.7
mandatory["$group-$index"]=0
details["$group-$index"]=""
url["$group-$index"]="https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210/pyparsing-2.4.7.tar.gz"
filename["$group-$index"]=pyparsing-2.4.7.tar.gz
dirname["$group-$index"]=pyparsing-2.4.7
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion >= 3.6" |bc -l) )); then # only Python>=3.6
# matplotlib 3.1.1
index=16
name["$group-$index"]=matplotlib
version["$group-$index"]=3.1.1
details["$group-$index"]=
url["$group-$index"]="https://github.com/matplotlib/matplotlib/archive/v3.1.1.tar.gz -O matplotlib-3.1.1.tar.gz"
filename["$group-$index"]=matplotlib-3.1.1.tar.gz
dirname["$group-$index"]=matplotlib-3.1.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

else
# matplotlib 2.1.0
index=17
name["$group-$index"]=matplotlib
version["$group-$index"]=2.1.0
details["$group-$index"]=
url["$group-$index"]="https://files.pythonhosted.org/packages/6c/90/cf10bb2020d2811da811a49601f6eafcda022c6ccd296fd05aba093dee96/matplotlib-2.1.0.tar.gz"
filename["$group-$index"]=matplotlib-2.1.0.tar.gz
dirname["$group-$index"]=matplotlib-2.1.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi

# array_split 0.5.2
index=18
name["$group-$index"]=array_split
version["$group-$index"]=0.5.2
mandatory["$group-$index"]=0
details["$group-$index"]=
url["$group-$index"]="https://files.pythonhosted.org/packages/c0/93/4d386a2f0d3a024d8876e8728a7112610255299a819ddf411e0691de1186/array_split-0.5.2.tar.gz"
filename["$group-$index"]=array_split-0.5.2.tar.gz
dirname["$group-$index"]=array_split-0.5.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion < 3.0" | bc -l) )); then # only Python < 3.0

# MarkupSafe 1.1.1
index=19
name["$group-$index"]=markupsafe
version["$group-$index"]=1.1.1
mandatory["$group-$index"]=0
details["$group-$index"]=
url["$group-$index"]="https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz"
filename["$group-$index"]=MarkupSafe-1.1.1.tar.gz
dirname["$group-$index"]=MarkupSafe-1.1.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi

# Jinja2 2.11.3
index=20
name["$group-$index"]=jinja2
version["$group-$index"]=2.11.3
mandatory["$group-$index"]=0
details["$group-$index"]=
url["$group-$index"]="https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69768ded990494809106f87da1d436418d5f1367ed3966fd7/Jinja2-2.11.3.tar.gz"
filename["$group-$index"]=Jinja2-2.11.3.tar.gz
dirname["$group-$index"]=Jinja2-2.11.3
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# f90nml 1.1.2
index=21
name["$group-$index"]=f90nml
version["$group-$index"]=1.1.2
mandatory["$group-$index"]=0
details["$group-$index"]=
url["$group-$index"]="https://files.pythonhosted.org/packages/39/7e/578388fad751a75dd087598c3e28a8e045b95ee219eb768ee3c80c5c1d88/f90nml-1.1.2.tar.gz"
filename["$group-$index"]=f90nml-1.1.2.tar.gz
dirname["$group-$index"]=f90nml-1.1.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python




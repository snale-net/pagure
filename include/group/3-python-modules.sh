#!/bin/bash

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

#################################################################
#Group 3 : Python modules
group=3
groupname[$group]="Python modules"

if (( $(echo "$pythonVersion >= 3.5" | bc -l) )); then # only Python>=3.5
# setuptools 68.0.0
index=1
name["$group-$index"]=setuptools
version["$group-$index"]=68.0.0
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/dc/98/5f896af066c128669229ff1aa81553ac14cfb3e5e74b6b44594132b8540e/setuptools-68.0.0.tar.gz
filename["$group-$index"]=setuptools-68.0.0.tar.gz
dirname["$group-$index"]=setuptools-68.0.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""
else 
# setuptools 44.1.1
index=2
name["$group-$index"]=setuptools
version["$group-$index"]=44.1.1
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/b2/40/4e00501c204b457f10fe410da0c97537214b2265247bc9a5bc6edd55b9e4/setuptools-44.1.1.zip
filename["$group-$index"]=setuptools-44.1.1.zip
dirname["$group-$index"]=setuptools-44.1.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""
fi

if (( $(echo "$pythonVersion >= 3.5" | bc -l) )); then # only Python>=3.5
# setuptools-scm 6.0.1
index=3
name["$group-$index"]=setuptools_scm
version["$group-$index"]=6.0.1
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/57/38/930b1241372a9f266a7df2b184fb9d4f497c2cef2e016b014f82f541fe7c/setuptools_scm-6.0.1.tar.gz
filename["$group-$index"]=setuptools_scm-6.0.1.tar.gz
dirname["$group-$index"]=setuptools_scm-6.0.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""
else 
# setuptools-scm 5.0.2
index=4
name["$group-$index"]=setuptools_scm
version["$group-$index"]=5.0.2
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/56/c9/09f4a531720b1bf54f316fdff926fbb937c59a9c4a34e3a533b26e501898/setuptools_scm-5.0.2.tar.gz
filename["$group-$index"]=setuptools_scm-5.0.2.tar.gz
dirname["$group-$index"]=setuptools_scm-5.0.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""
fi

# wheel 0.35.1
# TODO ne marche pas avec python2.7
index=5
name["$group-$index"]=wheel
version["$group-$index"]=0.35.1
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/83/72/611c121b6bd15479cb62f1a425b2e3372e121b324228df28e64cc28b01c2/wheel-0.35.1.tar.gz"
filename["$group-$index"]=wheel-0.35.1.tar.gz
dirname["$group-$index"]=wheel-0.35.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion >= 3.6" | bc -l) )); then # only Python>=3.6
# pip 21.1.3
index=6
name["$group-$index"]=pip
version["$group-$index"]=21.1.3
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/4d/0c/3b63fe024414a8a48661cf04f0993d4b2b8ef92daed45636474c018cd5b7/pip-21.1.3.tar.gz
filename["$group-$index"]=pip-21.1.3.tar.gz
dirname["$group-$index"]=pip-21.1.3
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""
else
# pip 20.3.4
index=7
name["$group-$index"]=pip
version["$group-$index"]=20.3.4
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/53/7f/55721ad0501a9076dbc354cc8c63ffc2d6f1ef360f49ad0fbcce19d68538/pip-20.3.4.tar.gz
filename["$group-$index"]=pip-20.3.4.tar.gz
dirname["$group-$index"]=pip-20.3.4
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""
fi

# Cython 0.29.35
index=8
name["$group-$index"]=cython
version["$group-$index"]=0.29.35
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/da/a0/298340fb8412574a0b00a0d9856aa27e7038da429b9e31d6825173d1e6bd/Cython-0.29.35.tar.gz
filename["$group-$index"]=Cython-0.29.35.tar.gz
dirname["$group-$index"]=Cython-0.29.35
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion >= 3.9" | bc -l) )); then # only Python>=3.9
# numpy 1.25.0
index=9
name["$group-$index"]=numpy
version["$group-$index"]=1.25.0
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module - need Lapack-Blas 3.9.0)"
url["$group-$index"]=https://files.pythonhosted.org/packages/d0/b2/fe774844d1857804cc884bba67bec38f649c99d0dc1ee7cbbf1da601357c/numpy-1.25.0.tar.gz
filename["$group-$index"]=numpy-1.25.0.tar.gz
dirname["$group-$index"]=numpy-1.25.0
builder["$group-$index"]="numpy"
dependencies["$group-$index"]="lapack-blas/$compilo/3.9.1 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

elif (( $(echo "$pythonVersion >= 3.7" | bc -l) )); then # only Python>=3.5
# numpy 1.21.4
index=9
name["$group-$index"]=numpy
version["$group-$index"]=1.21.4
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module - need Lapack-Blas 3.9.0)"
url["$group-$index"]=https://files.pythonhosted.org/packages/fb/48/b0708ebd7718a8933f0d3937513ef8ef2f4f04529f1f66ca86d873043921/numpy-1.21.4.zip
filename["$group-$index"]=numpy-1.21.4.zip
dirname["$group-$index"]=numpy-1.21.4
builder["$group-$index"]="numpy"
dependencies["$group-$index"]="lapack-blas/$compilo/3.9.1 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

else
# numpy 1.16.6
index=10
name["$group-$index"]=numpy
version["$group-$index"]=1.16.6
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module - need Lapack-Blas 3.9.1)"
url["$group-$index"]=https://files.pythonhosted.org/packages/b7/6f/24647f014eef9b67a24adfcbcd4f4928349b4a0f8393b3d7fe648d4d2de3/numpy-1.16.6.zip
filename["$group-$index"]=numpy-1.16.6.zip
dirname["$group-$index"]=numpy-1.16.6
builder["$group-$index"]="numpy"
dependencies["$group-$index"]="lapack-blas/$compilo/3.9.1 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi

# dateutil 2.8.2
index=11
name["$group-$index"]=dateutil
version["$group-$index"]=2.8.2
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/python-dateutil-2.8.2.tar.gz
filename["$group-$index"]=python-dateutil-2.8.2.tar.gz
dirname["$group-$index"]=python-dateutil-2.8.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# pybind11 2.4.3
index=12
name["$group-$index"]=pybind11
version["$group-$index"]=2.4.3
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/aa/91/deb6743e79e22ab01502296570b39b8404f10cc507a6692d612a7fee8d51/pybind11-2.4.3.tar.gz
filename["$group-$index"]=pybind11-2.4.3.tar.gz
dirname["$group-$index"]=pybind11-2.4.3
builder["$group-$index"]="pybind11"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# pytz 2021.3
index=13
name["$group-$index"]=pytz
version["$group-$index"]=2021.3
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/e3/8e/1cde9d002f48a940b9d9d38820aaf444b229450c0854bdf15305ce4a3d1a/pytz-2021.3.tar.gz
filename["$group-$index"]=pytz-2021.3.tar.gz
dirname["$group-$index"]=pytz-2021.3
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# pytzdata 2020.1
index=14
name["$group-$index"]=pytzdata
version["$group-$index"]=2020.1
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/67/62/4c25435a7c2f9c7aef6800862d6c227fc4cd81e9f0beebc5549a49c8ed53/pytzdata-2020.1.tar.gz"
filename["$group-$index"]=pytzdata-2020.1.tar.gz
dirname["$group-$index"]=pytzdata-2020.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion >= 3.7" | bc -l) )); then # only Python>=3.0
# pandas 1.3.5
index=15
name["$group-$index"]=pandas
version["$group-$index"]=1.3.5
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/99/f0/f99700ef327e51d291efdf4a6de29e685c4d198cbf8531541fc84d169e0e/pandas-1.3.5.tar.gz
filename["$group-$index"]=pandas-1.3.5.tar.gz
dirname["$group-$index"]=pandas-1.3.5
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

else
# pandas 0.23.4
index=16
name["$group-$index"]=pandas
version["$group-$index"]=0.23.4
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]=https://files.pythonhosted.org/packages/e9/ad/5e92ba493eff96055a23b0a1323a9a803af71ec859ae3243ced86fcbd0a4/pandas-0.23.4.tar.gz
filename["$group-$index"]=pandas-0.23.4.tar.gz
dirname["$group-$index"]=pandas-0.23.4
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi

# pythran-0.13.1
index=17
name["$group-$index"]=pythran
version["$group-$index"]=0.13.1
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/8d/d8/b27e8dc3f3a03dcd317d40d9df0ae07ebbd85444585973ceba07716934d0/pythran-0.13.1.tar.gz"
filename["$group-$index"]=pythran-0.13.1.tar.gz
dirname["$group-$index"]=pythran-0.13.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion >= 3.9" | bc -l) )); then # only Python>=3.9
# scipy 1.11.1
index=18
name["$group-$index"]=scipy
version["$group-$index"]=1.11.1
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module - need Lapack-Blas 3.9.1)"
url["$group-$index"]="https://files.pythonhosted.org/packages/a6/98/fceb84466a74b8fe74ce2dcc3a0a89cb7b4a689d4775e0fb4c95f335ef6a/scipy-1.11.1.tar.gz"
filename["$group-$index"]=scipy-1.11.1.tar.gz
dirname["$group-$index"]=scipy-1.11.1
builder["$group-$index"]="scipy"
dependencies["$group-$index"]="lapack-blas/$compilo/3.9.1 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

elif (( $(echo "$pythonVersion >= 3.5" | bc -l) )); then # only Python>=3.5
# scipy 1.6.3
index=18
name["$group-$index"]=scipy
version["$group-$index"]=1.6.3
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module - need Lapack-Blas 3.9.1)"
url["$group-$index"]="https://github.com/scipy/scipy/releases/download/v1.6.3/scipy-1.6.3.tar.gz"
filename["$group-$index"]=scipy-1.6.3.tar.gz
dirname["$group-$index"]=scipy-1.6.3
builder["$group-$index"]="scipy"
dependencies["$group-$index"]="lapack-blas/$compilo/3.9.1 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

else
# scipy 1.2.3
index=18
name["$group-$index"]=scipy
version["$group-$index"]=1.2.3
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module - need Lapack-Blas 3.9.1)"
url["$group-$index"]="https://github.com/scipy/scipy/archive/v1.2.3.tar.gz -O scipy-1.2.3.tar.gz"
filename["$group-$index"]=scipy-1.2.3.tar.gz
dirname["$group-$index"]=scipy-1.2.3
builder["$group-$index"]="scipy"
dependencies["$group-$index"]="lapack-blas/$compilo/3.9.1 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi

# cftime 1.0.4.2
index=19
name["$group-$index"]=cftime
version["$group-$index"]=1.0.4.2
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/f3/a7/203301f17c2ce458fad9b2da7c71b26dc3890b12a0200426ae960f8c9b60/cftime-1.0.4.2.tar.gz"
filename["$group-$index"]=cftime-1.0.4.2.tar.gz
dirname["$group-$index"]=cftime-1.0.4.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# pyparsing 2.4.7
index=20
name["$group-$index"]=pyparsing
version["$group-$index"]=2.4.7
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210/pyparsing-2.4.7.tar.gz"
filename["$group-$index"]=pyparsing-2.4.7.tar.gz
dirname["$group-$index"]=pyparsing-2.4.7
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion >= 3.6" |bc -l) )); then # only Python>=3.6
# matplotlib 3.1.1
index=21
name["$group-$index"]=matplotlib
version["$group-$index"]=3.1.1
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://github.com/matplotlib/matplotlib/archive/v3.1.1.tar.gz -O matplotlib-3.1.1.tar.gz"
filename["$group-$index"]=matplotlib-3.1.1.tar.gz
dirname["$group-$index"]=matplotlib-3.1.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

else
# matplotlib 2.1.0
index=22
name["$group-$index"]=matplotlib
version["$group-$index"]=2.1.0
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/6c/90/cf10bb2020d2811da811a49601f6eafcda022c6ccd296fd05aba093dee96/matplotlib-2.1.0.tar.gz"
filename["$group-$index"]=matplotlib-2.1.0.tar.gz
dirname["$group-$index"]=matplotlib-2.1.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi

# array_split 0.5.2
index=23
name["$group-$index"]=array_split
version["$group-$index"]=0.5.2
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/c0/93/4d386a2f0d3a024d8876e8728a7112610255299a819ddf411e0691de1186/array_split-0.5.2.tar.gz"
filename["$group-$index"]=array_split-0.5.2.tar.gz
dirname["$group-$index"]=array_split-0.5.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

if (( $(echo "$pythonVersion > 3.0" | bc -l) )); then # only Python > 3.0

# MarkupSafe 1.1.1
index=24
name["$group-$index"]=markupsafe
version["$group-$index"]=1.1.1
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz"
filename["$group-$index"]=MarkupSafe-1.1.1.tar.gz
dirname["$group-$index"]=MarkupSafe-1.1.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi

# Jinja2 2.11.3
index=25
name["$group-$index"]=jinja2
version["$group-$index"]=2.11.3
mandatory["$group-$index"]=1
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69768ded990494809106f87da1d436418d5f1367ed3966fd7/Jinja2-2.11.3.tar.gz"
filename["$group-$index"]=Jinja2-2.11.3.tar.gz
dirname["$group-$index"]=Jinja2-2.11.3
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# f90nml 1.1.2
index=26
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
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# pendulum 2.1.2
index=27
name["$group-$index"]=pendulum
version["$group-$index"]=2.1.2
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/db/15/6e89ae7cde7907118769ed3d2481566d05b5fd362724025198bb95faf599/pendulum-2.1.2.tar.gz"
filename["$group-$index"]=pendulum-2.1.2.tar.gz
dirname["$group-$index"]=pendulum-2.1.2
builder["$group-$index"]="pendulum"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# toolz 0.10.0
index=28
name["$group-$index"]=toolz
version["$group-$index"]=0.10.0
mandatory["$group-$index"]=0
details["$group-$index"]="(required by xarray)"
url["$group-$index"]="https://files.pythonhosted.org/packages/22/8e/037b9ba5c6a5739ef0dcde60578c64d49f45f64c5e5e886531bfbc39157f/toolz-0.10.0.tar.gz"
filename["$group-$index"]=toolz-0.10.0.tar.gz
dirname["$group-$index"]=toolz-0.10.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# scons 4.1.0.post1
index=29
name["$group-$index"]=SCons
version["$group-$index"]=4.1.0.post1
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/be/d0/bf4e7003369c6d8a6e490741c54791c7918d9ef10b56aec201e76706f1d7/SCons-4.1.0.post1.tar.gz"
filename["$group-$index"]=SCons-4.1.0.post1.tar.gz
dirname["$group-$index"]=SCons-4.1.0.post1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# future 0.18.2
index=30
name["$group-$index"]=future
version["$group-$index"]=0.18.2
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/45/0b/38b06fd9b92dc2b68d58b75f900e97884c45bedd2ff83203d933cf5851c9/future-0.18.2.tar.gz"
filename["$group-$index"]=future-0.18.2.tar.gz
dirname["$group-$index"]=future-0.18.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# sympy 1.8
index=31
name["$group-$index"]=sympy
version["$group-$index"]=1.8
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/88/b1/e4e620f45949a4cc7c935a0c711f6aac24e875810b68c37148c7402d838f/sympy-1.8.tar.gz"
filename["$group-$index"]=sympy-1.8.tar.gz
dirname["$group-$index"]=sympy-1.8
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# PyYAML 6.0
index=32
name["$group-$index"]=pyyaml
version["$group-$index"]=6.0
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/36/2b/61d51a2c4f25ef062ae3f74576b01638bebad5e045f747ff12643df63844/PyYAML-6.0.tar.gz"
filename["$group-$index"]=PyYAML-6.0.tar.gz
dirname["$group-$index"]=PyYAML-6.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# Mako 1.2.0
index=33
name["$group-$index"]=mako
version["$group-$index"]=1.2.0
mandatory["$group-$index"]=0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/50/ec/1d687348f0954bda388bfd1330c158ba8d7dea4044fc160e74e080babdb9/Mako-1.2.0.tar.gz"
filename["$group-$index"]=Mako-1.2.0.tar.gz
dirname["$group-$index"]=Mako-1.2.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python




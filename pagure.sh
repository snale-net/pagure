#!/bin/bash

basedir=`pwd`
maxGroup=0
maxFile=50

exec 3>&1 

#############################
# Utility
#############################
LOGFILE="${basedir}/pagure.log"
VERT="\\033[1;32m"
NORMAL="\\033[0;39m"
ROUGE="\\033[1;31m"
ROSE="\\033[1;35m"
BLEU="\\033[1;34m"
BLANC="\\033[0;02m"
BLANCLAIR="\\033[1;08m"
ORANGE="\\033[1;33m"
CYAN="\\033[1;36m"
clear
rm -f $LOGFILE
function log(){
    if [ $1 == 0 ]
    then
      echo -e "[ $VERT OK $NORMAL ] " $2
      echo "[ OK ] " $2 >> $LOGFILE
    elif [ $1 == "warn" ]
    then
      echo -e "[ $ORANGE WARNING $NORMAL ] " $2
      echo "[ WARNING ] " $2 >> $LOGFILE
    elif [ $1 == "info" ]
    then
      echo -e "[ $BLEU INFO $NORMAL ] " $2
      echo "[ INFO ] " $2 >> $LOGFILE
    elif [ $1 == "step" ]
    then
      echo -e "[ $CYAN STEP $NORMAL ] " $2
      echo "[ STEP ] " $2 >> $LOGFILE
    elif [ $1 == "skip" ]
    then
      echo -e "[ $ROSE SKIP $NORMAL ] " $2
      echo "[ SKIP ] " $2 >> $LOGFILE
    elif [ $1 == "abort" ]
    then
      echo -e "[ $ROUGE ABORT $NORMAL ] PAGURE aborted with status error" $2
      echo "[ ABORT ] Abort with status error" $2 >> $LOGFILE
     elif [ $1 == "fail" ]
    then
      echo -e "[ $ROUGE FAIL $NORMAL ] " $2
      echo "[ FAIL ] " $2 >> $LOGFILE
    elif [ $1 == "raw" ]
    then
      echo -e $2
      echo $2 >> $LOGFILE
    else
      echo -e "[ $ROUGE FAIL $NORMAL ]" $2
      echo "[ FAIL ]" $2 " - Return code " $1 >> $LOGFILE
    fi
}

# Execute module
exec_module()
{
   module $1 &> module_exec  
  
   isFailed=$(cat module_exec | grep 'ERROR' -c)
   if [ "$isFailed" == "1" ] 
   then  
        log fail "Missing required dependency : $(cat module_exec). Please install it before"
   	leave 100
   fi  
   rm -f module_exec
}


# Quitter le script
leave()
{
  ret="${PIPESTATUS[0]}"  
  if [[ "$ret" -ne "0" ]]; then
     log abort $ret
     exit $ret
  elif [ ! -z "$1" ]; then
  	if [ "$1" == "0" ] ; then
     		exit $1
  	fi
  	
  	log abort $1
     	exit $1
  fi   
}

# Usage
usage()
{
	echo 'PAGURE 1.0 - compile your dependencies like a pilot -'
	echo 'PAGURE comes with ABSOLUTELY NO WARRANTY'
	echo 'Author: Fabien RETIF'
	echo 'Usage :'
	echo '  pagure.sh --list   To list all filters available'
	echo ' '	
	echo '  pagure.sh --prefix=PREFIX [--system=CLUSTER|SUSE|MINT|CENTOS|MACOS] [--compiler=GNU|INTEL] [--mpi=openmpi110|openmpi300|intel2016|intel2017|intel2018|intel2019|mpich321|mpich332] [--python-version=X.X] [--filter=NAME_OF_FILTER] [--module-dir=MODULE_DIR] [--mode=manual|auto] [--force-reinstall=0|1] [--force-download=0|1] [--auto-remove=0|1] [--auto-install-mandatory=0|1] [--show-old-version=0|1]'	
	echo ' '
}

# Liste des filtres
list()
{
	echo 'Filters list : '
	echo ' '
	for key in ${!filters[@]}; do
		echo ${key}
	done
}

# Chargement des filtres
declare -A filters
if [ -f "$basedir/include/filters.sh" ] ; then
	source $basedir/include/filters.sh
fi

# Traiter les arguments
forceDownload=0
forceReinstall=0
autoRemove=1

if test $# -eq 0
then
	 usage
	 leave 0
fi
while test $# -ge 1
do
case "$1" in
    -h* | --help)
        usage
        leave 0 ;;
     -l* | --list)
        list
        leave 0 ;;
    -p*=* | --prefix=*) prefix=`echo $1 | sed 's/.*=//'`; shift ;;
    -system=* | --system=*) system=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -compiler=* | --compiler=*) compiler=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -mpi=* | --mpi=*) mpi=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -python-version=* | --python-version=*) pythonVersion=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;   
    -module-dir=* | --module-dir=*) moduleDir=`echo $1 | sed 's/.*=//'`; shift ;; 
    -filter=* | --filter=*) selectedFilter=`echo $1 | sed 's/.*=//'`; shift ;; 
    -mode=* | --mode=*) mode=`echo $1 | sed 's/.*=//'`; shift ;;
    -force-download=* | --force-download=*) forceDownload=`echo $1 | sed 's/.*=//'`; shift ;;     
    -force-reinstall=* | --force-reinstall=*) forceReinstall=`echo $1 | sed 's/.*=//'`; shift ;;     
    -show-old-version=* | --show-old-version=*) oldVersion=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -auto-remove=* | --auto-remove=*) autoRemove=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -auto-install-mandatory=* | --auto-install-mandatory=* | -mandatory=* | --mandatory=* ) autoInstallMandatory=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    *)
      echo "unknown option: $1"
      echo "$0 --help for help"
      leave 1;;
    esac
done

# 1. Tester le système
if [ -z "$system" ]; then
	systemOS=`echo "cluster" | awk '{print tolower($0)}'`	

elif [ "$system" == "cluster" ]; then

	systemOS=`echo "$system" | awk '{print tolower($0)}'`	

elif [ "$system" == "suse" ]; then

	systemOS=`echo "$system" | awk '{print tolower($0)}'`	

elif [ "$system" == "mint" ] ; then

	systemOS=`echo "$system" | awk '{print tolower($0)}'`

elif [ "$system" == "centos" ] ; then

	systemOS=`echo "$system" | awk '{print tolower($0)}'`

elif [ "$system" == "macos" ] ; then

	systemOS=`echo "$system" | awk '{print tolower($0)}'`

else
	log fail "Unable to decode argument '--system'. Accepted values : CLUSTER|SUSE|MINT|CENTOS|MACOS" 
	leave 1
fi
log info "system is set to $systemOS"

# 2. Tester le prefix
if [ -z "$prefix" ]; then
prefix=`pwd`
while true; do 
	log raw "......................"
        log warn "You didn't specify a prefix argument. Default prefix is set to $prefix" 
	read -p "Do you wish to install softwares in this directory ? (y/n)" yn
        case $yn in
		[Yy]* ) break;;
		[Nn]* ) log info "Please use the --prefix argument" ; leave 0 ;;
		*) echo "Please answer yes or no." ;;
	esac
done
fi
log info "prefix is set to $prefix"

# 3. Tester le module-dir
if [ -z "$moduleDir" ]; then
	moduleDir="$prefix/Modules/local"
else
	if [ -d "$moduleDir" ]; then
		log info "module dir is set to $moduleDir"
	else
		log fail "module dir path $moduleDir doesn't exists"
		leave 10
	fi
fi

# 4.1 Mode
if [ -z "$mode" ]; then
	mode="auto"
elif [ "${mode}" == "manual" ]; then
	mode="manual"
elif  [ "${mode}" == "auto" ]; then
	mode="auto"
else
	log fail "Unable to decode argument '--mode'. Accepted values : manual|auto"
	leave 1
fi
log info "Installation mode is set to $mode"

# 4.2 Force download
if [ -z "$forceDownload" ]; then
	forceDownload=0
elif [ "${forceDownload}" == "0" ]; then
	forceDownload=0
elif  [ "${forceDownload}" == "1" ]; then
	forceDownload=1
else
	log fail "Unable to decode boolean for argument force-download : '${forceDownload}'" 
	leave 1
fi
log info "Force to download is set to $forceDownload"

# 4.3 Force reinstall
if [ -z "$forceReinstall" ]; then
	forceReinstall=0
elif [ "${forceReinstall}" == "0" ]; then
	forceReinstall=0
elif  [ "${forceReinstall}" == "1" ]; then
	if  [ "${mode}" == "auto" ]; then
		log fail "When using --mode=auto, you can't use --force-reinstall=1. Please switch to manual mode"
		leave 10		
	else
		forceReinstall=1
	fi
else
	log fail "Unable to decode boolean for argument force-reinstall : '${forceReinstall}'" 
	leave 1
fi
log info "Force to reinstall is set to $forceReinstall"

# 4.4 Auto remove
if [ -z "$autoRemove" ]; then
	autoRemove=0
elif [ "${autoRemove}" == "0" ]; then
	autoRemove=0
elif  [ "${autoRemove}" == "1" ]; then
	autoRemove=1
else
	log fail "Unable to decode boolean for argument auto-remove : '${autoRemove}'" 
	leave 1
fi
log info "Auto-remove is set to $autoRemove"

# 4.5 Automatic installation of mandatory libraires
if  [ "${forceReinstall}" == "1" ]; then
	log warn "When using --force-reinstall=1, --auto-install-mandatory is set to 0"
	autoInstallMandatory=0	
elif [ "${mode}" == "manual" ]; then
	log warn "When using --mode=manual,  --auto-instal-mandatory is set to 0"
	autoInstallMandatory=0
elif [ -z "$autoInstallMandatory" ]; then
	autoInstallMandatory=1
elif [ "${autoInstallMandatory}" == "0" ]; then
	autoInstallMandatory=0
elif  [ "${autoInstallMandatory}" == "1" ]; then
	autoInstallMandatory=1
else
	log fail "Unable to decode boolean for argument auto-install-mandatory or mandatory : '${autoInstallMandatory}'" 
	leave 1
fi
log info "Automatic installation of mandatory libraries is set to $autoInstallMandatory"

# 4.6 Ancienne version
if [ -z "$oldVersion" ]; then
	showOldVersion=0
elif [ "${oldVersion}" == "0" ]; then
	showOldVersion=0
elif  [ "${oldVersion}" == "1" ]; then
	showOldVersion=1
else
	log fail "Unable to decode boolean for old version ${oldVersion}" 
	leave 1
fi
# Si un filtre est selectionné
if [ ! -z "$selectedFilter" ]
then	
	showOldVersion=1
	log info "When using a filter, show old version is set to $showOldVersion"
else
	log info "Show old version is set to $showOldVersion"
fi

# 5. Tester le filtre
if [ -z "$selectedFilter" ]
then
	libToInstall="none"	
else

	if [ ! -z "$mpi" ]; then
		log fail "You can't specify a MPI library (--mpi) when using a filter (--filter). The MPI library is automatically selected by the filter. Please remove --mpi."
		leave 1	 	
	fi

	if [ ! -z "$pythonVersion" ]; then
		log fail "You can't specify a Python version (--python-version) when using a filter (--filter). The Python version is automatically selected by the filter. Please remove --python-version."
		leave 1	 	
	fi
	
	if [ ! -z "${filters["$selectedFilter"]}" ]; then	
		
		IFS=', ' read -r -a libToInstall <<< "${filters["$selectedFilter"]}"
		
		# MPI
		if  [[ "${libToInstall[@]}" =~ "4-1" ]]; then
			mpi="openmpi110"
		fi
				
		if  [[ "${libToInstall[@]}" =~ "4-2" ]]; then
			mpi="openmpi300"
		fi
		
		if  [[ "${libToInstall[@]}" =~ "4-3" ]]; then
			mpi="mpich321"
		fi
		
		if  [[ "${libToInstall[@]}" =~ "4-4" ]]; then
			mpi="mpich332"
		fi
		
		# Python
		if  [[ "${libToInstall[@]}" =~ "1-1" ]]; then
			pythonVersion="3.7"
		fi
		
	else
		log fail "The filter '$selectedFilter' doesn't exists. Please check available filters with the option --list" 
		leave 1	
	fi
	
fi

# 6. Installation des paquets système
if [ ! "$systemOS" == "cluster" ]
then
	log raw "......................"
	while true; do
		read -p "Do you wish to install system packages (root acces is required) ? (y/n)" yn
		case $yn in
		        [Yy]* )
	log step "Install System packages (root acces is required)"
	
	if [ -f "$basedir/include/group/00-system-$systemOS.sh" ] ; then
		source $basedir/include/group/00-system-$systemOS.sh
	else
		log fail "Unable to find the specific file for $systemOS" 
		leave 1
	fi

	log 0 "Install System packages"
	break;;
		        [Nn]* )
		        log skip "We skip the system packages installation"
		        break ;;
		        *) echo "Please answer yes or no." ;;
		esac
	done	
fi

log raw "......................"
# 7. Récupérer la version du compilateur
if [ -z "$compiler" ]
then
	CC_VERSION=$(gcc --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')
    CXX_VERSION=$(g++ --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')
    FC_VERSION=$(gfortran --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')    
	compilo=gcc${CC_VERSION//.}
	export CC=gcc
	export CXX=g++
	export F77=gfortran
	export F90=gfortran
	export FC=gfortran	
	log info "compiler is set to GNU ${CC_VERSION}"

elif [ "$compiler" == "gnu" ]
then
	if ! [ -x "$(command -v gcc)" ] ; then
		log fail "Unable to find suitable compilers (gcc or icc)" 
		leave 1
	fi
	CC_VERSION=$(gcc --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')
    CXX_VERSION=$(g++ --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')
    FC_VERSION=$(gfortran --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')  
	compilo=gcc${CC_VERSION//.}
	export CC=gcc
	export CXX=g++
	export F77=gfortran
	export F90=gfortran
	export FC=gfortran	
	log info "compiler is set to GNU ${CC_VERSION}"

elif [ "$compiler" == "intel" ]
then
	if ! [ -x "$(command -v icc)" ] ; then
		log fail "Unable to find suitable compilers (gcc or icc)" 
		leave 1
	fi
	CC_VERSION=$(icc --version | grep ^icc | sed 's/^[a-z]*\s.[A-Z]*.\s//g')
    CXX_VERSION=$(icpc --version | grep ^icc | sed 's/^[a-z]*\s.[A-Z]*.\s//g')
    FC_VERSION=$(ifort --version | grep ^icc | sed 's/^[a-z]*\s.[A-Z]*.\s//g')
	compilo=icc${CC_VERSION:0:2}
	export CC=icc
	export CXX=icpc
	export F77=ifort
	export F90=ifort
	export FC=ifort	
	log info "compiler is set to INTEL ${CC_VERSION:0:2}"
else
	log fail "Unable to decode argument '--compiler'. Accepted values : GNU|INTEL" 
	leave 1
fi

if [[ "${CC_VERSION}" != "${CXX_VERSION}" || "${CC_VERSION}" != "${FC_VERSION}" ]]; then
    log fail "C / C++ / Fortran compilers have different version: ${CC_VERSION} / ${CXX_VERSION} / ${FC_VERSION}" 
	leave 1
fi

# Fix for GNU 10
if [[ $compiler == "gnu" ]] && (( $(echo "${CC_VERSION} >= 10.0" |bc -l) )); then # only GNU>=10.2			
	export FFLAGS="-w -fallow-argument-mismatch -O2"
	export FCFLAGS="-w -fallow-argument-mismatch -O2"	
fi

# 8. Tester la version du MPI
if [ -z "$mpi" ]; then

	mpilib="none"  

elif [ "$mpi" == "openmpi110" ]; then

	mpilib="openmpi110"
    export MPICC=mpicc
	export MPIF77=mpif90
	export MPIFC=mpif90
	export MPIF90=mpif90
	export MPICXX=mpic++

elif [ "$mpi" == "openmpi300" ] ; then

	mpilib="openmpi300"
	export MPICC=mpicc
	export MPIF77=mpif90
	export MPIFC=mpif90
	export MPIF90=mpif90
	export MPICXX=mpic++

elif [ "$mpi" == "intel2016" ] ; then

	mpilib="intel2016"
	export MPICC=mpiicc
	export MPIF77=mpiifort
	export MPIFC=mpiifort
	export MPIF90=mpiifort
	export MPICXX=mpiicpc

elif [ "$mpi" == "intel2017" ] ; then

	mpilib="intel2017"
	export MPICC=mpiicc
	export MPIF77=mpiifort
	export MPIFC=mpiifort
	export MPIF90=mpiifort
	export MPICXX=mpiicpc

elif [ "$mpi" == "intel2018" ] ; then

	mpilib="intel2018"
	export MPICC=mpiicc
	export MPIF77=mpiifort
	export MPIFC=mpiifort
	export MPIF90=mpiifort
	export MPICXX=mpiicpc

elif [ "$mpi" == "intel2019" ] ; then

	mpilib="intel2019"
	export MPICC=mpiicc
	export MPIF77=mpiifort
	export MPIFC=mpiifort
	export MPIF90=mpiifort
	export MPICXX=mpiicpc

elif [ "$mpi" == "mpich321" ] ; then

	mpilib="mpich321"
	export MPICC=mpicc
	export MPIF77=mpif90
	export MPIFC=mpif90
	export MPIF90=mpif90
	export MPICXX=mpic++
	
	unset F90 
	unset F90FLAGS	
	
elif [ "$mpi" == "mpich332" ] ; then

	mpilib="mpich332"
	export MPICC=mpicc
	export MPIF77=mpif90
	export MPIFC=mpif90
	export MPIF90=mpif90
	export MPICXX=mpic++
	
	unset F90 
	unset F90FLAGS	
	
else   
        log fail "Unable to decode argument '--mpi'. Accepted values : openmpi110|openmpi300|intel2016|intel2017|intel2018|intel2019|mpich321|mpich332" 
	leave 1	
fi

if [ "$mpilib" == "openmpi110" ]; then
	mpi_dep="openmpi/$compilo/1.10.7"
elif [ "$mpilib" == "openmpi300" ]; then
	mpi_dep="openmpi/$compilo/3.0.0"
elif [ "$mpilib" == "intel2016" ]; then
	mpi_dep="intelmpi/$compilo/2016"
elif [ "$mpilib" == "intel2017" ]; then
	mpi_dep="intelmpi/$compilo/2017"
elif [ "$mpilib" == "intel2018" ]; then
	mpi_dep="intelmpi/$compilo/2018"
elif [ "$mpilib" == "intel2019" ]; then
	mpi_dep="intelmpi/$compilo/2019"
elif [ "$mpilib" == "mpich321" ]; then
	mpi_dep="mpich/$compilo/3.2.1"
elif [ "$mpilib" == "mpich332" ]; then
	mpi_dep="mpich/$compilo/3.3.2"
else
    mpi_dep=""
fi

if [ "$mpilib" == "none" ]; then
    log warn "No MPI library"  
else
    log info "MPI library is set to $mpilib"
fi

# 9. Tester la version de Python
installedPython=0
if [ -z "$pythonVersion" ]; then
	if ! hash python 2>/dev/null; then        
		log warn "No Python interpreter" 
		pythonInterpreter="none"	    
	else	
		python --version &> version_test
		pythonVersion=$(cat version_test | sed -n 's/^[A-Z][a-z]*\s\([0-9]\.[0-9]*\).*/\1/p')
		rm -f version_test
		pythonInterpreter=python${pythonVersion}
		installedPython=1
		log info "Python interpreter is set to $pythonInterpreter"
	fi

elif hash python${pythonVersion} 2>/dev/null
then    
	pythonInterpreter=python${pythonVersion}
	installedPython=1
	log info "Python interpreter is set to $pythonInterpreter"
	if (( $(echo "$pythonVersion == 3.7" | bc -l) )); then # only Python==3.7
		installedPython=0
	fi
else
	if (( $(echo "$pythonVersion == 3.7" | bc -l) )); then # only Python==3.7
		pythonInterpreter=python${pythonVersion}
		log info "Python interpreter ${pythonVersion} will be installed"
	else
		log fail "Unable to find Python ${pythonVersion} in your system. You can install Python 3.7 can be installed with PAGURE" 
		leave 1
	fi
fi

log raw "......................"

# 10. Créer le répertoire dédié aux logiciels & librairies
if [ ! -d "$prefix" ] ; then mkdir $prefix 2>&1 >&3 | tee -a $LOGFILE && leave ; fi
if [ ! -d "$prefix/src" ] ; then mkdir $prefix/src 2>&1 >&3 | tee -a $LOGFILE && leave ; fi
if [ ! -d "$prefix/tgz" ] ; then mkdir $prefix/tgz 2>&1 >&3 | tee -a $LOGFILE && leave ; fi
log 0 "Make dir prefix"

# 11. Installation du gestionnaire d'environnement Modules
if [ ! "$systemOS" == "cluster" ]
then
	if ! hash module 2>/dev/null
	then
		if [ ! -d "$prefix/Modules" ]
		then
			log info "Install Modules -- Software Environment Management"
			cd $prefix/tgz
			if [ ! -f "modules-4.0.0.tar.gz" -o $forceDownload == "1" ]; then
			wget https://sourceforge.net/projects/modules/files/Modules/modules-4.0.0/modules-4.0.0.tar.gz
			fi
			tar xvfz modules-4.0.0.tar.gz -C../src
			cd ../src/modules-4.0.0
			./configure --prefix=$prefix/Modules
			make 2>&1 >&3 | tee -a $LOGFILE && leave
			make install 2>&1 >&3 | tee -a $LOGFILE && leave
			mkdir $prefix/Modules/local
			echo "module use --append $prefix/Modules/local" >> $prefix/Modules/init/modulerc
			echo "source $prefix/Modules/init/bash" >> ~/.bashrc
		fi

		source $prefix/Modules/init/bash
		log 0 "Install Modules -- Software Environment Management"
	else	
		log info "Modules -- Software Environment Management is already installed"
	fi
else
	# On sauvegarde le module list actuel pour le rajouter aux dépendences
	exec_module "load use.own"
	module list -t 2> module_list 	
	sed -i -e 's/(default)//' module_list 
	moduleList=`awk 'NR>1{for (i=1; i<=NF; i++)printf("%s ",$i);}' module_list`
	rm module_list
fi

# 12. Création du module python-modules
# Si on a déjà un python installé
if [ "$installedPython" == "1" ]; then # only-if-Python
 
	if [[ ! -f "$moduleDir/python-modules/$compilo/${pythonVersion}" ]]
	then
		if [ ! -d "$moduleDir/python-modules/$compilo" ] ; then mkdir -p "$moduleDir/python-modules/$compilo" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
    		pymodulefile="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tPython libraries\"
}
 
module-whatis \"Python libraries\"

prepend-path PATH $prefix/python-modules/$compilo/bin
prepend-path C_INCLUDE_PATH $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path INCLUDE $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path CPATH $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path PYTHONPATH $prefix/python-modules/$compilo/lib/$pythonInterpreter/site-packages
"
    		echo $"${pymodulefile}" >> $moduleDir/python-modules/$compilo/${pythonVersion}   
	fi
fi  # end-only-if-Python

# 13. Chargement des logiciels
declare -A groupname
declare -A name
declare -A version
declare -A mandatory
declare -A details
declare -A url
declare -A filename
declare -A dirname
declare -A configfile
declare -A configfilename
declare -A patch_01
declare -A patchfile_01
declare -A patch_02
declare -A patchfile_02
declare -A builder
declare -A dependencies
declare -A dirinstall
declare -A args
declare -A dirmodule
declare -A modulefile

for f in `find $basedir/include/group/ -regextype egrep -regex '.*/([1-9]|[0-9]{3}).*.sh'`; do   
    maxGroup=$((maxGroup+1))  
    source $f   
done

log raw "......................"
# 14. Afficher les librairies à installer
if [ "${libToInstall}" != "none" ]
then		
	log info "The following libraries are pre-selected to be installed :"

	for element in "${libToInstall[@]}"
	do	
		if [ -z "${name["$element"]}" ]; then
			log fail "Library with index $element is not defined. Maybe you choose the wrong compiler or MPI lib or Python version for this filter '$selectedFilter'."
			leave 1
		fi				
		log info "${name["$element"]} ${version["$element"]} ${details["$element"]}"
	done	
else
	log info "No filter was selected. All libraries are pre-selected to be installed."
fi

function install()
{
	index=$1    
	
	if [[ ! -z "${name["$index"]}" ]]
	then
	
		if [ "$systemOS" == "cluster" ] ; then 	
		
			module "load use.own"
			
			if [ "$mpilib" != "none" ] ; then			

				if hash $MPIF90 2>/dev/null
				then					
					# On enlève le module mpi pré-configuré pour le remplacer par celui du cluster
					mpi_dep_no_slash=${mpi_dep//\//\\/}							
					dependencies["$index"]=${dependencies["$index"]/$mpi_dep_no_slash/}				
				fi	
			fi		

			# On enlève le module gdal
			if [[ $moduleList == *"gdal"* ]]; then 
				dependencies["$index"]=${dependencies["$index"]/gdal\/"$compilo"\/3.0.1/}
			fi
			
			# On enlève le module proj
			if [[ $moduleList == *"proj"* ]]; then 
				dependencies["$index"]=${dependencies["$index"]/proj\/"$compilo"\/6.1.1/}
			fi
				
			# On ajoute les deps du cluster				
			dependencies["$index"]=`echo $moduleList ${dependencies["$index"]}`													
		fi
				
		log raw "......................"
		while true; do		
			
			if [[ $mode == "auto" || $autoInstallMandatory == "1" && ! -z "${mandatory["$index"]}" && "${mandatory["$index"]}" == "1" ]]; then
				yn="y"
			else
				read -p "Do you wish to install ${name["$index"]} ${version["$index"]} ${details["$index"]} ? (y/n) " yn
			fi
			
			case $yn in
				[Yy]* )	
				
				# On vide les dépendances
				exec_module "purge"

				# Si on a déjà un python installé
				# On enlève le module python
				if [ "$installedPython" == "1" ]; then # only-if-Python				
					dependencies["$index"]=${dependencies["$index"]/python\/"$compilo"\/${pythonVersion}/}				
				fi  # end-only-if-Python

				# On charge les dépendances
				if [[ ! -z "${dependencies["$index"]}" ]] ; then  												
					exec_module "load ${dependencies["$index"]}"						
				fi
					
				# On teste si la librairie est déjà installée
				if [[ "${dirinstall["$index"]}" =~ .*(python-modules).* ]]; then				
					# module Python							
					$pythonInterpreter -c "import ${name["$index"]}" &> lib_test									
					libTest=$(cat lib_test | grep "Error" -c)					
					rm -f lib_test
								
					if [ "$libTest" == "1" ] ; then						
						alreadyInstall=false						
					else
						alreadyInstall=true
					fi
				else				
					# module normal				
					module show ${dirmodule["$index"]}/${version["$index"]} &> lib_test
					libTest=$(cat lib_test | grep "ERROR" -c)
					rm -f lib_test
								
					if [ "$libTest" == "1" ] ; then
						alreadyInstall=false
					else
						alreadyInstall=true
					fi
				fi								
						
				if [ "$alreadyInstall" = false -o $forceReinstall == "1" ]
				then		
					log info "Install ${name["$index"]} ${version["$index"]} ${details["$index"]}"					

					cd $prefix/tgz

					if [ ! -f "${filename["$index"]}" -o $forceDownload == "1" ]; then 

						rm -f ${filename["$index"]}
						
						if [[ ${url["$index"]} == "localfile" ]] 
						then
							log raw "......................"
							while true; do
								read -p "Type the absolute path of the archive file '${filename["$index"]}' : " filepath						
								
								if [ -f "$filepath/${filename["$index"]}" ]
								then
									cp $filepath/${filename["$index"]} . 2>&1 >&3 | tee -a $LOGFILE && leave
									break;
								else
									echo "'$filepath/${filename["$index"]}' doesn't exists. Please try again."
								fi
							done
							
						else
							wget ${url["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
						fi
					fi

					if [ -d "$prefix/src/${dirname["$index"]}" ] ; then rm -rf $prefix/src/${dirname["$index"]} ; fi

					if [[ ${filename["$index"]} == *.tar.gz || ${filename["$index"]} == *.tgz ]] 
					then						
						tar xvfz ${filename["$index"]} -C../src 2>&1 >&3 | tee -a $LOGFILE && leave

					elif [[ ${filename["$index"]} == *.zip ]] 
					then
						unzip -o ${filename["$index"]} -d../src 2>&1 >&3 | tee -a $LOGFILE && leave
					else
						mkdir -p ../src/${dirname["$index"]}
						mv ${filename["$index"]} ../src/${dirname["$index"]}/.
					fi

					cd ../src/${dirname["$index"]}

					if [[ ! -z "${configfile["$index"]}" && ! -z "${configfilename["$index"]}" ]]
					then			
						echo $"${configfile["$index"]}" > ${configfilename["$index"]}		
					fi			

					if [[ -f "${patchfile_01["$index"]}" && ! -z "${patch_01["$index"]}" ]]
					then		
						echo $"${patch_01["$index"]}" > patch_to_apply.patch
						patch -i patch_to_apply.patch ${patchfile_01["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
					fi
					if [[ -f "${patchfile_02["$index"]}" && ! -z "${patch_02["$index"]}" ]]
					then			
						echo $"${patch_02["$index"]}" > patch_to_apply.patch
						patch -i patch_to_apply.patch ${patchfile_02["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
					fi
					
					# Compilation #
					if [ -f "$basedir/include/builder/${builder["$index"]}.sh" ] ; then
						source $basedir/include/builder/${builder["$index"]}.sh
					else
						log fail "Unable to find the builder '${builder["$index"]}'."
						leave 1
					fi
					
					cd $prefix					

					if [[ ! -z "${modulefile["$index"]}" ]]
					then
						if [[ ! -d "$moduleDir/${dirmodule["$index"]}" ]] ; then
							mkdir -p $moduleDir/${dirmodule["$index"]}	
						fi 
						
						if [[ ${dirmodule["$index"]} == python-modules* ]]
						then	                    
						    echo $"${modulefile["$index"]}" > $moduleDir/${dirmodule["$index"]}/${pythonVersion}
						else                                      
						    echo $"${modulefile["$index"]}" > $moduleDir/${dirmodule["$index"]}/${version["$index"]} 
						fi
					fi
					
					if [ $autoRemove == "1" ]
					then
						log info "Removing archive file and source files"						
						if [ -d "$prefix/src/${dirname["$index"]}" ] ; then rm -rf $prefix/src/${dirname["$index"]} ; fi
						if [ -f "$prefix/tgz/${filename["$index"]}" ] ; then rm -f $prefix/tgz/${filename["$index"]} ; fi					
					fi

					log 0 "Install ${name["$index"]} ${version["$index"]} ${details["$index"]}"
							
				
				else

					log warn "${name["$index"]} ${version["$index"]} is already installed. Use --force-reinstall=1 --mode=manual if you want to reinstall."
				fi
			break;;
			[Nn]* )
			log skip "We skip the installation of ${name["$index"]} ${version["$index"]}"
			break ;;
			*) echo "Please answer yes or y or no or n." ;;
		esac
		done

	fi
}

log raw "......................"
while true; do 
        log 0 "We are now ready to install. Please check the information above"
        log raw "......................"	
	read -p "Everything is OK ? Press Enter to continue or press q to quit " yn
        case $yn in
        	[Qq]*) leave 0 ;;		
		*)  break;;
	esac
done

if [ "$libToInstall" == "none" ] ; then 

	for ((group=1;group<=$maxGroup;group++)) do 

		if [[ ! -z "${groupname["$group"]}" ]]
		then	
			log step "${groupname["$group"]}"

	  		for ((lib=1;lib<=$maxFile;lib++)) do 

                install  "$group-$lib" 

			done    
  		fi  
	done
	
else
	for lib in "${libToInstall[@]}"
	do
		install "$lib"
	   
	done
fi

log 0 "Congratulation, you did it"


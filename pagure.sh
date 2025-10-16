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
GRIS="\\033[1;90m"
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
    elif [ $1 == "debug" ]
    then
      echo -e "[ $GRIS DEBUG $NORMAL ] " $2
      echo "[ DEBUG ] " $2 >> $LOGFILE
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
      echo -e "[ $GRIS ABORT $NORMAL ] PAGURE aborted with status error" $2
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
function exec_module()
{
   module $1 &> module_exec  

   if [ ! -f "module_exec" ] ; then
     log fail "Execution of 'module $1' has failed"
     leave 100
   fi
   
   if [ $debug == "1" ]; then   
   	if [ "$(cat module_exec)" == "" ]; then	
   		log debug "Execution of 'module $1'"
   	else
   		log debug "Execution of 'module $1' returns '$(cat module_exec)'"
   	fi
   fi

   if [ "$1" != "purge" ]; then
       # La commande n'est pas une purge  
       isFailed=$(cat module_exec | grep -i 'ERROR\|erreur' -c)
       if (( $(echo "${isFailed} > 0.0" | bc -l) )) 
       then  
            log fail "Missing required dependency : $(cat module_exec). Please install it before"
       	leave 100
       fi  
   fi
   rm -f module_exec
}


# Quitter le script
function leave()
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

# Comparer une version
# Returns 0 if $1 = $2
# Returns 1 if $1 > $2
# Returns 2 if $1 < $2     
function vercomp () {	
    if [[ $1 == $2 ]]
    then
        echo "0"
        return
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            echo "1"
            return
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            echo "2"
            return
        fi
    done
    echo "0"
    return
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
	echo '  pagure.sh --prefix=PREFIX [--system=CLUSTER|SUSE|MINT|UBUNTU|CENTOS|FEDORA|MACOS] [--compiler=GNU|INTEL] [--mpi=openmpi|intelmpi|mpich] [--mpi-version=X.X] [--python-version=X.X] [--filter=NAME_OF_FILTER] [--module-dir=MODULE_DIR] [--mode=manual|auto|docker] [--force-reinstall=0|1] [--force-download=0|1] [--auto-remove=0|1] [--auto-install-mandatory=0|1] [--show-old-version=0|1] [--debug=0|1]'	
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
debug=0

if test $# -eq 0
then
	 usage
	 leave 0
fi

# On logge la commande
log raw "$0 $*" 

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
    -mpi-version=* | --mpi-version=*) mpiVersion=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -python-version=* | --python-version=*) pythonVersion=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;   
    -module-dir=* | --module-dir=*) moduleDir=`echo $1 | sed 's/.*=//'`; shift ;; 
    -filter=* | --filter=*) selectedFilter=`echo $1 | sed 's/.*=//'`; shift ;; 
    -mode=* | --mode=*) mode=`echo $1 | sed 's/.*=//'`; shift ;;
    -force-download=* | --force-download=*) forceDownload=`echo $1 | sed 's/.*=//'`; shift ;;     
    -force-reinstall=* | --force-reinstall=*) forceReinstall=`echo $1 | sed 's/.*=//'`; shift ;;     
    -show-old-version=* | --show-old-version=*) oldVersion=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -auto-remove=* | --auto-remove=*) autoRemove=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -auto-install-mandatory=* | --auto-install-mandatory=* | -mandatory=* | --mandatory=* ) autoInstallMandatory=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -debug=* | --debug=* ) debug=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
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

elif [ "$system" == "ubuntu" ] ; then

	systemOS=`echo "$system" | awk '{print tolower($0)}'`

elif [ "$system" == "fedora" ] ; then

	systemOS=`echo "$system" | awk '{print tolower($0)}'`

else
	log fail "Unable to decode argument '--system'. Accepted values : CLUSTER|SUSE|MINT|UBUNTU|CENTOS|FEDORA|MACOS" 
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
	# On s'assure que le module dir est renseigné poru le mode cluster
	if [ "$systemOS" == "cluster" ]; then
		log fail "For cluster system, you have to specify the module dir path with --module-dir= (ex: /home/XXXX/privatemodules)"
		leave 8
	fi
	
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
elif  [ "${mode}" == "docker" ]; then
	mode="docker"
else
	log fail "Unable to decode argument '--mode'. Accepted values : manual|auto|docker"
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
	forceReinstall=1
	if  [ "${mode}" == "auto" ]; then
		log warn "You are in automatic mode and you will reinstall all the libraries"
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
		if  [[ " ${libToInstall[@]} " =~ [[:space:]]4-1[[:space:]] ]]; then            
			mpi="openmpi"
            mpiVersion="1.10.7"		
        fi
				
		if  [[ " ${libToInstall[@]} " =~ [[:space:]]4-2[[:space:]] ]]; then
			mpi="openmpi"
            mpiVersion="3.1.6"
		fi
		
		if  [[ " ${libToInstall[@]} " =~ [[:space:]]4-3[[:space:]] ]]; then       
			mpi="mpich"
            mpiVersion="3.2.1"
		fi
		
		if  [[ " ${libToInstall[@]} " =~ [[:space:]]4-4[[:space:]] ]]; then
			mpi="mpich"
            mpiVersion="3.3.2"
		fi       
		
		# Python
		if  [[ " ${libToInstall[@]} " =~ [[:space:]]1-1[[:space:]] ]]; then
			pythonVersion="3.7"          
		fi

        if  [[ " ${libToInstall[@]} " =~ [[:space:]]1-2[[:space:]] ]]; then
			pythonVersion="2.7"           
		fi
		
		if  [[ " ${libToInstall[@]} " =~ [[:space:]]1-3[[:space:]] ]]; then
			pythonVersion="3.9"
		fi
		
	else
		log fail "The filter '$selectedFilter' doesn't exists. Please check available filters with the option --list" 
		leave 1	
	fi
	
fi

# 6. Tester la version de Python
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
        pythonlib="py$(echo $pythonVersion | tr -d . | cut -c1-3)"
		log info "Python interpreter is set to $pythonInterpreter"
	fi

elif hash python${pythonVersion} 2>/dev/null
then    
	pythonInterpreter=python${pythonVersion}
	installedPython=1
    pythonlib="py$(echo $pythonVersion | tr -d . | cut -c1-3)"
	log info "Python interpreter is set to $pythonInterpreter"	

    if  [[ ! " ${libToInstall[@]} " =~ [[:space:]]1-*[[:space:]] ]]; then
        # On a détecté un python qui ne provient pas de PAGURE, on supprime l'installation du Python       
        for i in "${!libToInstall[@]}"; do          
            if [[ " ${libToInstall[i]} " =~ [[:space:]]1-1[[:space:]] ]] || [[ " ${libToInstall[i]} " =~ [[:space:]]1-2[[:space:]] ]] || [[ " ${libToInstall[i]} " =~ [[:space:]]1-3[[:space:]] ]]; then             
              unset 'libToInstall[i]'
            fi
        done 
        if [ $debug == "1" ]; then  
			log debug "We detect a previous installation of 'python${pythonVersion}' so we removed its installation"
		fi       
	fi    
else
	if  [[ $(vercomp $pythonVersion 2.7) == 0 ]]; then # only Python==2.7
		pythonInterpreter=python${pythonVersion}
        pythonlib="py$(echo $pythonVersion | tr -d . | cut -c1-3)"
		log info "Python interpreter ${pythonVersion} will be installed"
	elif  [[ $(vercomp $pythonVersion 3.7) == 0 ]]; then # only Python==3.7
		pythonInterpreter=python${pythonVersion}
        pythonlib="py$(echo $pythonVersion | tr -d . | cut -c1-3)"
		log info "Python interpreter ${pythonVersion} will be installed"
	elif  [[ $(vercomp $pythonVersion 3.9) == 0 ]]; then # only Python==3.9
		pythonInterpreter=python${pythonVersion}
		log info "Python interpreter ${pythonVersion} will be installed"
	else
		log fail "Unable to find Python ${pythonVersion} in your system. You can install Python 3.7 with PAGURE" 
		leave 1
	fi
fi

# 7. Installation des paquets système
if [ ! "$systemOS" == "cluster" ] && [ ! "$mode" == "docker" ]
then
	log raw "......................"
	while true; do
		read -p "Do you wish to install system packages (root acces is required) ? (y/n)" yn
		case $yn in
		        [Yy]* )
	log step "Install System packages (root acces is required)"
	
	if [ -f "$basedir/include/group/0-system-$systemOS.sh" ] ; then
		source $basedir/include/group/0-system-$systemOS.sh
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
# 8. Récupérer la version du compilateur
if [ -z "$compiler" ] || [ ! -z "$compiler" -a "$compiler" == "gnu" ]
then
	if ! [ -x "$(command -v gcc)" ] ; then
		log fail "Unable to find suitable GNU compilers (gcc not found)" 
		leave 1
	fi
	CC_VERSION=$(gcc --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')
        CXX_VERSION=$(g++ --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')
        FC_VERSION=$(gfortran --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')  
        compiler="gnu"
	compilo=gcc${CC_VERSION//.}
	export CC=gcc
	export CXX=g++
	export F77=gfortran
	export F90=gfortran
	export FC=gfortran	
	log info "compiler is set to GNU ${CC_VERSION}"

elif [ ! -z "$compiler" -a "$compiler" == "intel" ]
then
	if ! [ -x "$(command -v icc)" ] ; then
		log fail "Unable to find suitable Intel compilers (icc not found). Maybe you forgot to load the Intel compiler module before running PAGURE ?" 
		leave 1
	fi
	CC_VERSION=$(icc --version | grep ^icc | sed 's/^[a-z]*\s.[A-Z]*.\s//g')
    CXX_VERSION=$(icpc --version | grep ^icpc | sed 's/^[a-z]*\s.[A-Z]*.\s//g')
    FC_VERSION=$(ifort --version | grep ^ifort | sed 's/^[a-z]*\s.[A-Z]*.\s//g')
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

if [[ $(vercomp ${CC_VERSION:0:3} ${CXX_VERSION:0:3}) != 0 ]] || [[ $(vercomp ${CC_VERSION:0:3} ${FC_VERSION:0:3}) != 0 ]]; then
	log fail "C / C++ / Fortran compilers have different version: ${CC_VERSION} / ${CXX_VERSION} / ${FC_VERSION}" 
	#leave 1
fi

# Fix for GNU 10
if [[ $compiler == "gnu" ]] && [[ $(vercomp ${CC_VERSION} 10.0) != 2 ]]; then # only GNU>=10.0			
	export FFLAGS="-fallow-argument-mismatch"
	export FCFLAGS="-fallow-argument-mismatch"	
fi

# 9. Tester la version du MPI
if [ -z "$mpi" ]; then

	mpilib="none"  

elif [ "$mpi" == "openmpi" ]; then

    if [ -z "$mpiVersion" ]; then
        mpiVersion=1.10.7
	    log warn "No MPI version was specified with --mpi-version argument. Default selected version is 1.10.7" 	   
    fi   

	mpilib="openmpi$(echo $mpiVersion | tr -d . | cut -c1-3)"
    export MPICC=mpicc
	export MPIF77=mpif90
	export MPIFC=mpif90
	export MPIF90=mpif90
	export MPICXX=mpic++

elif [ "$mpi" == "intelmpi" ] ; then        

    if ! [ -x "$(command -v mpiicc)" ] ; then
		log fail "Unable to find suitable Intel MPI compilers (mpiicc not found). Maybe you forgot to load the Intel MPI module before running PAGURE ?" 
		leave 1
	fi     

    mpiVersion=$(mpirun --version | grep ^Intel | sed 's/^.*Version\s\([0-9\.]*\)\s.*/\1/g') 
    log warn "When using Intel MPI, --mpi-version argument is ignored. Detected version is $mpiVersion" 	

	mpilib="intel$(echo $mpiVersion | tr -d . | cut -c1-4)"
	export MPICC=mpiicc
	export MPIF77=mpiifort
	export MPIFC=mpiifort
	export MPIF90=mpiifort
	export MPICXX=mpiicpc

elif [ "$mpi" == "mpich" ] ; then

    if [ -z "$mpiVersion" ]; then
        mpiVersion=3.2.1
	    log warn "No MPI version was specified with --mpi-version argument. Default selected version is 3.2.1" 	   
    fi   

	mpilib="mpich$(echo $mpiVersion | tr -d . | cut -c1-3)"
	export MPICC=mpicc
	export MPIF77=mpif90
	export MPIFC=mpif90
	export MPIF90=mpif90
	export MPICXX=mpic++
	
	unset F90 
	unset F90FLAGS	
	
else   
    log fail "Unable to decode argument '--mpi'. Accepted values : openmpi|intelmpi|mpich" 
	leave 1	
fi

if [ "$mpilib" == "openmpi110" ]; then
	mpi_dep="openmpi/$compilo/1.10.7"
elif [ "$mpilib" == "openmpi316" ]; then
	mpi_dep="openmpi/$compilo/3.1.6"
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
			if [ ! -f "modules-5.0.1.tar.gz" -o $forceDownload == "1" ]; then
			wget https://github.com/cea-hpc/modules/archive/refs/tags/v5.0.1.tar.gz -O modules-5.0.1.tar.gz
			fi
			tar xvfz modules-5.0.1.tar.gz -C../src
			cd ../src/modules-5.0.1
			./configure --prefix=$prefix/Modules
			make 2>&1 >&3 | tee -a $LOGFILE && leave
			make install 2>&1 >&3 | tee -a $LOGFILE && leave
			mkdir $prefix/Modules/local
			echo "module use --append $prefix/Modules/local" >> $prefix/Modules/etc/initrc
			echo "source $prefix/Modules/init/bash" >> ~/.bashrc
		fi

		source $prefix/Modules/init/bash
		log 0 "Install Modules -- Software Environment Management"
	else	
		log info "Modules -- Software Environment Management is already installed"
	fi
else
    # On teste si les modules pré-chargés sont correctement chargés
    exec_module "-t list"
    # On charge le module privé
    #exec_module "load use.own"
	# On sauvegarde le module list actuel pour le rajouter aux dépendences   	
	module -t list > module_list 	
	sed -i -e 's/(default)//' module_list
    sed -i -e 's/Currently Loaded Modulefiles://' module_list 
    sed -i -e 's/No Modulefiles Currently Loaded.//' module_list 
    sed -i -e 's/No modules loaded//' module_list 
    moduleList=`awk '{for (i=1; i<=NF; i++)printf("%s ",$i);}' module_list`
	if [[ ! -z "$moduleList" && $debug == "1" ]]; then
	    log debug "Previous loaded modules are $moduleList"
	fi
	rm module_list
fi

# 12. Création du module python-modules
# Si on a déjà un python installé
if [ "$installedPython" == "1" ] || [ ! -z "$pythonVersion" ]; then # only-if-Python
 
	if [ ! -f "$moduleDir/python-modules/$compilo/${pythonVersion}" -o $forceReinstall == "1" ]
	then
		if [ $debug == "1" ]; then  
			log debug "Installation of 'python-modules/$compilo/${pythonVersion}'"
		fi
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
prepend-path PKG_CONFIG_PATH $prefix/python-modules/$compilo/lib/pkgconfig
prepend-path PYTHONPATH $prefix/python-modules/$compilo/lib/$pythonInterpreter/site-packages
setenv PYTHONUSERBASE $prefix/python-modules/$compilo
"
    		echo $"${pymodulefile}" > $moduleDir/python-modules/$compilo/${pythonVersion}   
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
declare -A patch_03
declare -A patchfile_03
declare -A patch_04
declare -A patchfile_04
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
		log raw "......................"
		while true; do		
			
			if [[ $mode == "auto" || $mode == "docker" || $autoInstallMandatory == "1" && ! -z "${mandatory["$index"]}" && "${mandatory["$index"]}" == "1" ]]; then
				yn="y"
			else
				read -p "Do you wish to install ${name["$index"]} ${version["$index"]} ${details["$index"]} ? (y/n) " yn
			fi
			
			case $yn in
				[Yy]* )	
				
				# On vide les dépendances
				exec_module "purge"

                if [ "$installedPython" == "1" ];  then
                    if  [[ ! " ${libToInstall[@]} " =~ [[:space:]]1-*[[:space:]] ]]; then
                        # On a détecté un python qui ne provient pas de PAGURE, on supprime la dep au module de PAGURE
		                dependencies["$index"]=${dependencies["$index"]/python\/"$compilo"\/$pythonVersion/}
                        dependencies["$index"]=${dependencies["$index"]/python-modules\/"$compilo"\/$pythonVersion/}
            		fi                   

                fi  	
				
				if [ "$systemOS" == "cluster" ] ; then                    				
					
					if [ "${libToInstall}" == "none" ] ; then
						# Uniquement si on n'utilise pas de filtre, on essait d'utiliser les dépendences du cluster
					
						if [ "$mpilib" != "none" ] ; then			

							if  [ -x `command -v ${MPIF90}` ]
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
							
					fi
					
					# On ajoute les dépendances sauvegarder au lancement + les dépendances mise à jour avec les deps du cluster				
					dependencies["$index"]=`echo $moduleList ${dependencies["$index"]}`												
				fi

				# Si on a déjà un python installé										
				if [ "$installedPython" == "1" ]; then 		
					# On test si le module python existe									
					module show python/$compilo/${pythonVersion} &> lib_test
					libTest=$(cat lib_test | grep "ERROR" -c)
					rm -f lib_test
								
					if [ "$libTest" == "1" ] ; then
						# Il n'existe pas alors on le supprime des dépendances pour utiliser celui du système		
						dependencies["$index"]=${dependencies["$index"]/python\/"$compilo"\/${pythonVersion}/}						
					fi			
				fi 

				# On charge les dépendances
				if [[ ! -z "${dependencies["$index"]}" ]] ; then
                    # On charge chaque librairie une par une
                    IFS=' ' read -r -a depToLoad <<< "${dependencies["$index"]}" 	
                    for libToLoad in "${depToLoad[@]}"
                    do
                        exec_module "load $libToLoad"	                       
                    done										
				fi
					
				# On teste si la librairie est déjà installée
				if [[ "${dirinstall["$index"]}" =~ .*(python-modules).* ]]; then				
					# module Python							
					$pythonInterpreter -c "import ${name["$index"]}; print(${name["$index"]}.__version__)" &> lib_test									
					libTest=$(cat lib_test | grep "Error" -c)
					
					if [ $debug == "1" ]; then      	
				   		log debug "Testing if '${name["$index"]}' exists: $(cat lib_test)"				   	
				   	fi				
								
					if [ "$libTest" == "1" ] ; then						
						alreadyInstall=false						
					else											
						
						versionTest=$(vercomp ${version["$index"]} $(cat lib_test))
						if [ "$versionTest" == "1" ] ; then		
							alreadyInstall=false	
						elif [ "$versionTest" == "2" ] ; then
							log warn "${name["$index"]} newest version is already installed ($(cat lib_test))"
							alreadyInstall=true
						else							
							alreadyInstall=true	
						fi							
					fi
					
					rm -f lib_test					
					
				else				
					# module normal				
					module show ${dirmodule["$index"]}/${version["$index"]} > lib_test 2>&1
					libTest=$(cat lib_test | grep "ERROR\|Failed" -c)
					rm -f lib_test
								
					if [ "$libTest" == "1" ] ; then
						alreadyInstall=false
					else
						alreadyInstall=true
					fi
				fi								
						
				if [ "$alreadyInstall" = false -o $forceReinstall == "1" ]
				then

                    if [ -d "$prefix/${dirinstall["$index"]}" ] && [[ ${dirinstall["$index"]} != python-modules* ]] && [ $forceReinstall == "1" ]		
                    then                       
                        log info "Remove previous version of ${name["$index"]} ${version["$index"]} ${details["$index"]}"	
                        rm -rf $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
                        rm -rf $moduleDir/${dirmodule["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave	
                    fi		

                    log info "Install ${name["$index"]} ${version["$index"]} ${details["$index"]}"					

					cd $prefix/tgz

					if [ ! -f "${filename["$index"]}" -a ! -d "${filename["$index"]}" -o $forceDownload == "1" ]; then 

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
							
						elif [[ ${url["$index"]} == "git clone"* ]] ; then                          
                            ${url["$index"]} ${filename["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
                        else
							wget ${url["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
						fi
					fi

					if [ -d "$prefix/src/${dirname["$index"]}" ] ; then rm -rf $prefix/src/${dirname["$index"]} ; fi

					if [[ ${filename["$index"]} == *.tar.gz || ${filename["$index"]} == *.tgz ]] 
					then
                        if [[ ${filename["$index"]} == *.all-in-root.* ]] ; then
                            mkdir ../src/${dirname["$index"]}
	                        tar xvfz ${filename["$index"]} -C../src/${dirname["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
                        else	
    						tar xvfz ${filename["$index"]} -C../src 2>&1 >&3 | tee -a $LOGFILE && leave
                        fi
					elif [[ ${filename["$index"]} == *.tar.xz ]] 
					then
                        if [[ ${filename["$index"]} == *.all-in-root.* ]] ; then
                            mkdir ../src/${dirname["$index"]}
	                        tar xJf ${filename["$index"]} -C../src/${dirname["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
                        else	
    						tar xJf ${filename["$index"]} -C../src 2>&1 >&3 | tee -a $LOGFILE && leave
                        fi						
						
					elif [[ ${filename["$index"]} == *.tar.bz2 ]] 
					then
                        if [[ ${filename["$index"]} == *.all-in-root.* ]] ; then
                            mkdir ../src/${dirname["$index"]}
	                       tar xf ${filename["$index"]} -C../src/${dirname["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
                        else	
    						tar xf ${filename["$index"]} -C../src 2>&1 >&3 | tee -a $LOGFILE && leave
                        fi	
					elif [[ ${filename["$index"]} == *.zip ]] 
					then
                        if [[ ${filename["$index"]} == *.all-in-root.* ]] ; then
                            mkdir ../src/${dirname["$index"]}
	                        unzip -o ${filename["$index"]} -d../src/${dirname["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
                        else	
    						unzip -o ${filename["$index"]} -d../src 2>&1 >&3 | tee -a $LOGFILE && leave
                        fi	
						
					elif [ -d "${filename["$index"]}" ] ; then    
                        # C'est un répertoire, on copie son contenu  
                        mkdir -p ../src/${dirname["$index"]}
						cp -r ${filename["$index"]}/* ../src/${dirname["$index"]}/.
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
						dos2unix ${patchfile_01["$index"]}
						patch -i patch_to_apply.patch ${patchfile_01["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
					fi
					if [[ -f "${patchfile_02["$index"]}" && ! -z "${patch_02["$index"]}" ]]
					then			
						echo $"${patch_02["$index"]}" > patch_to_apply.patch
						dos2unix ${patchfile_02["$index"]}
						patch -i patch_to_apply.patch ${patchfile_02["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
					fi
					if [[ -f "${patchfile_03["$index"]}" && ! -z "${patch_03["$index"]}" ]]
					then			
						echo $"${patch_03["$index"]}" > patch_to_apply.patch
						dos2unix ${patchfile_03["$index"]}
						patch -i patch_to_apply.patch ${patchfile_03["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
					fi
                    			if [[ -f "${patchfile_04["$index"]}" && ! -z "${patch_04["$index"]}" ]]
					then			
						echo $"${patch_04["$index"]}" > patch_to_apply.patch
						dos2unix ${patchfile_04["$index"]}
						patch -i patch_to_apply.patch ${patchfile_04["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
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
						    echo $"${modulefile["$index"]/dependencies_modules/${dependencies["$index"]}}" > $moduleDir/${dirmodule["$index"]}/${pythonVersion}
						else                                      
						    echo $"${modulefile["$index"]/dependencies_modules/${dependencies["$index"]}}" > $moduleDir/${dirmodule["$index"]}/${version["$index"]} 
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

if [[ ! $mode == "docker" ]]; then
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

fi

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


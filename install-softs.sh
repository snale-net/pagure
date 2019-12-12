#!/bin/bash

basedir=`pwd`
maxGroup=20
maxFile=50

#############################
# Utility
#############################
LOGFILE="logs"
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
rm $LOGFILE
function log(){
    if [ $1 == 0 ]
    then
      echo -e "[ $VERT OK $NORMAL ] " $2
      echo "[ OK ] " $2 >> $LOGFILE
    elif [ $1 == "warning" ]
    then
      echo -e "[ $ORANGE WARNING $NORMAL ] " $2
      echo "[ WARNING ] " $2 >> $LOGFILE
    elif [ $1 == "notice" ]
    then
      echo -e "[ $BLEU INFO $NORMAL ] " $2
      echo "[ INFO ] " $2 >> $LOGFILE
    elif [ $1 == "step" ]
    then
      echo -e "[ $CYAN STEP $NORMAL ] " $2
      echo "[ STEP ] " $2 >> $LOGFILE
    elif [ $1 == "raw" ]
    then
      echo -e $2
      echo $2 >> $LOGFILE
    else
      echo -e "[ $ROUGE FAIL $NORMAL ]" $2
      echo "[ FAIL ]" $2 " - Return code " $1 >> $LOGFILE
    fi
}


# Quitter le script
leave()
{
  if test "$*" != "0"; then
    echo "** $0 aborting."
  fi 
  exit $1
}

# Traiter les arguments
forceDownload=0
while test $# -ge 1
do
case "$1" in
    -h* | --help)
      echo 'usage:'
      echo '  install-soft [--prefix=PREFIX] [--force-download=0|1] [--module-dir=MODULE_DIR] [--compiler=GNU|INTEL] [--system=CLUSTER|SUSE|MINT|CYGWIN] [--python-version=2.7|3.6]'
        leave 0 ;;
    -p*=* | --prefix=*) prefix=`echo $1 | sed 's/.*=//'`; shift ;;
    -force-download=* | --force-download=*) forceDownload=`echo $1 | sed 's/.*=//'`; shift ;;
    -module-dir=* | --module-dir=*) moduleDir=`echo $1 | sed 's/.*=//'`; shift ;;
    -compiler=* | --compiler=*) compiler=`echo $1 | sed 's/.*=//'`; shift ;;
    -system=* | --system=*) system=`echo $1 | sed 's/.*=//'`; shift ;;
    -python-version=* | --python-version=*) pythonVersion=`echo $1 | sed 's/.*=//'`; shift ;;
    *)
      echo "unknown option: $1"
      echo "$0 --help for help"
      leave 1;;
    esac
done

# 1. Tester le système
if [ -z "$system" ]; then

	systemOS=`echo "CLUSTER" | awk '{print tolower($0)}'`	

elif [ "$system" = "SUSE" ]; then

	systemOS=`echo "$system" | awk '{print tolower($0)}'`	

elif [ "$system" = "MINT" ] ; then

	systemOS=`echo "$system" | awk '{print tolower($0)}'`

elif [ "$system" = "CYGWIN" ] ; then

	systemOS=`echo "$system" | awk '{print tolower($0)}'`
fi
log notice "system is set to $systemOS"

# 2. Installation des paquets système
if [ ! "$systemOS" == "cluster" ]
then
	echo "......................"
	while true; do
		read -p "Do you wish to install system packages (root acces is required) ?" yn
		case $yn in
		        [Yy]* )
	log step "Install System packages (root acces is required)"

	source $basedir/include/00-system-$systemOS.sh

	log 0 "Install System packages"
	break;;
		        [Nn]* ) break ;;
		        *) echo "Please answer yes or no." ;;
		esac
	done
fi

# 3. Récupérer la version du compilateur
if [ -z "$compiler" ]
then
	CC_VERSION=$(gcc --version | grep ^gcc | sed 's/^.* //g')
	compilo=gcc${CC_VERSION:0:1}${CC_VERSION:2:1}
	#export CC=mpicc
	#export CXX=mpic++
	#export F77=mpif90
	#export FC=mpif90
	log notice "compiler is set to GNU"

elif [ "$compiler" = "GNU" ]
then
	if ! [ -x "$(command -v gcc)" ] ; then
		log fail "Unable to find suitable compilers (gcc or icc)" 
		leave 1
	fi
	CC_VERSION=$(gcc --version | grep ^gcc | sed 's/^.* //g')
	compilo=gcc${CC_VERSION:0:1}${CC_VERSION:2:1}
	#export CC=mpicc
	#export CXX=mpic++
	#export F77=mpif90
	#export FC=mpif90
	log notice "compiler is set to GNU"

elif [ "$compiler" = "INTEL" ]
then
	if ! [ -x "$(command -v icc)" ] ; then
		log fail "Unable to find suitable compilers (gcc or icc)" 
		leave 1
	fi
	CC_VERSION=$(icc --version | grep ^icc | sed 's/^[a-z]*\s.[A-Z]*.\s//g')
	compilo=icc${CC_VERSION:0:2}
	#export CC=icc
	#export CXX=icpc
	#export F77=ifort
	#export FC=ifort
	log notice "compiler is set to INTEL"
else
	log fail "Unable to find suitable compilers (gcc or icc)" 
	leave 1
fi

# 4. Tester le prefix
if [ -z "$prefix" ]; then
prefix=`pwd`
while true; do 
        echo "You didn't specify a prefix argument."
	echo "Default prefix is set to $prefix" 
	read -p "Do you wish to install softwares in this directory ?" yn
        case $yn in
		[Yy]* ) break;;
		[Nn]* ) leave 1 ;;
		*) echo "Please answer yes or no." ;;
	esac
done
fi
log notice "prefix is set to $prefix"

# 5. Créer le répertoire dédié aux logiciels & librairies
if [ ! -d "$prefix" ] ; then mkdir $prefix ; fi
if [ ! -d "$prefix/src" ] ; then mkdir $prefix/src ; fi
if [ ! -d "$prefix/tgz" ] ; then mkdir $prefix/tgz ; fi
log 0 "Make dir prefix"

# 6. Installation du gestionnaire d'environnement Modules
if [ ! "$systemOS" == "cluster" ]
then
	if ! hash module 2>/dev/null
	then
		if [ ! -d "$prefix/Modules" ]
		then
			log notice "Install Modules -- Software Environment Management"
			cd $prefix/tgz
			if [ ! -f "modules-4.0.0.tar.gz" -o $forceDownload == "1" ]; then
			wget https://sourceforge.net/projects/modules/files/Modules/modules-4.0.0/modules-4.0.0.tar.gz
			fi
			tar xvfz modules-4.0.0.tar.gz -C../src
			cd ../src/modules-4.0.0
			./configure --prefix=$prefix/Modules
			make || leave 1
			make install || leave 1
			mkdir $prefix/Modules/local
			echo "module use --append $prefix/Modules/local" >> $prefix/Modules/init/modulerc
			echo "source $prefix/Modules/init/bash" >> ~/.bashrc
		fi

		source $prefix/Modules/init/bash
		log 0 "Install Modules -- Software Environment Management"
	else	
		log notice "Modules -- Software Environment Management is already installed"
	fi

fi

# 7. Tester le module-dir
if [ -z "$moduleDir" ]; then
	moduleDir="$prefix/Modules/local"
else
	log notice "module dir is set to $moduleDir"
fi

# 8. Tester la version de Python
if [ -z "$pythonVersion" ]; then
	pythonInterpreter=python
elif [ "$pythonVersion" = "2.7" ]; then
	pythonInterpreter=python2.7

elif [ "$pythonVersion" = "3.6" ] ; then
	pythonInterpreter=python3.6
elif [ "$pythonVersion" = "3.7" ] ; then
	pythonInterpreter=python3.7
else
	log fail "Unable to find suitable version for Python" 
	leave 1
fi
log notice "Python interpreter is set to $pythonInterpreter"



declare -a groupname
declare -a name
declare -a version
declare -a details
declare -a url
declare -a filename
declare -a dirname
declare -a configfile
declare -a configfilename
declare -a patch
declare -a patchfile
declare -a builder
declare -a dependencies
declare -a dirinstall
declare -a args
declare -a dirmodule
declare -a modulefile

source $basedir/include/01-defaults.sh
source $basedir/include/02-mpi-libs.sh
source $basedir/include/03-io-libs.sh
source $basedir/include/04-processing.sh
source $basedir/include/05-python.sh
source $basedir/include/10-model-fluidity.sh
source $basedir/include/11-model-terraferma-v1.0.sh
source $basedir/include/12-model-swan.sh

for ((group=1;group<=$maxGroup;group++)) do 

  if [[ ! -z "${groupname["$group"]}" ]]
  then	

	  log step "${groupname["$group"]}"

	  for ((index=1;index<=$maxFile;index++)) do 
		   

		  if [[ ! -z "${name["$group$index"]}" ]]
		  then		
			echo "......................"
			while true; do
				read -p "Do you wish to install ${name["$group$index"]} ${version["$group$index"]} ${details["$group$index"]} ?" yn
				case $yn in
					[Yy]* )
			log notice "Install ${name["$group$index"]} ${version["$group$index"]} ${details["$group$index"]} "
			module purge || leave 1

			if [[ ! -z "${dependencies["$group$index"]}" ]] ; then  module load ${dependencies["$group$index"]} || leave 1 ; fi

			cd $prefix/tgz

			if [ ! -f "${filename["$group$index"]}" -o $forceDownload == "1" ]; then 

				rm -f ${filename["$group$index"]}
				wget ${url["$group$index"]} || leave 1 
			fi

			if [ -d "$prefix/src/${dirname["$group$index"]}" ] ; then rm -rf $prefix/src/${dirname["$group$index"]} ; fi

			if [[ ${filename["$group$index"]} == *.tar.gz ]] 
			then
				tar xvfz ${filename["$group$index"]} -C../src || leave 1

			elif [[ ${filename["$group$index"]} == *.zip ]] 
			then
				unzip ${filename["$group$index"]} -d../src || leave 1
			fi

			cd ../src/${dirname["$group$index"]}

			if [[ ! -z "${configfile["$group$index"]}" && ! -z "${configfilename["$group$index"]}" ]]
		        then			
				echo $"${configfile["$group$index"]}" > ${configfilename["$group$index"]}			
			fi

			if [[ -f "${patchfile["$group$index"]}" && ! -z "${patch["$group$index"]}" ]]
		        then			
				echo $"${patch["$group$index"]}" > patch_to_apply.patch
				patch -i patch_to_apply.patch ${patchfile["$group$index"]} || leave 1
			fi

			if [[ "${builder["$group$index"]}" == "configure" ]]
			then
				./configure --prefix=$prefix/${dirinstall["$group$index"]} --libdir=$prefix/${dirinstall["$group$index"]}/lib ${args["$group$index"]} || leave 1
				make || leave 1
				make install || leave 1

			elif [[ "${builder["$group$index"]}" == "cmake" ]]
			then
				mkdir build
				cd build

				if [[ ! -z "${configfilename["$group$index"]}" ]] ; then mv ../${configfilename["$group$index"]} . || leave 1 ; fi

				cmake -DCMAKE_INSTALL_PREFIX=$prefix/${dirinstall["$group$index"]}  -DCMAKE_INSTALL_LIBDIR=$prefix/${dirinstall["$group$index"]}/lib ${args["$group$index"]} ../
				make || leave 1
				make install || leave 1

			elif [[ "${builder["$group$index"]}" == "python" ]]
			then
				$pythonInterpreter setup.py install --user || leave 1

            # Début Compilation spécifique #

			elif [[ "${builder["$group$index"]}" == "swan-builder" ]]
			then				             
				make mpi || leave 1
                chmod +x swanrun || leave 1

			elif [[ "${builder["$group$index"]}" == "gmt5" ]]
			then
				mkdir build
				cd build

				if [[ ! -z "${configfilename["$group$index"]}" ]] ; then mv ../${configfilename["$group$index"]} . || leave 1 ; fi

				cmake -DCMAKE_INSTALL_PREFIX=$prefix/${dirinstall["$group$index"]}  -DCMAKE_INSTALL_LIBDIR=$prefix/${dirinstall["$group$index"]}/lib ${args["$group$index"]} ../
				make || leave 1
                		make docs_man || leave 1
				make install || leave 1
            fi		

            # Fin Compilation spécifique #	

			if [[ ! -f "$moduleDir/${dirmodule["$group$index"]}/${version["$group$index"]} " && ! -z "${modulefile["$group$index"]}" ]]
		        then
				mkdir -p $moduleDir/${dirmodule["$group$index"]}		
				echo $"${modulefile["$group$index"]}" >> $moduleDir/${dirmodule["$group$index"]}/${version["$group$index"]} 
			fi

			log 0 "Install ${name["$group$index"]} ${version["$group$index"]} ${details["$group$index"]}"
					break;;
					[Nn]* ) break ;;
					*) echo "Please answer yes or no." ;;
				esac
			done


		  fi
 
 	done  
  
  fi  
done



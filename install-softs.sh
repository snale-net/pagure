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
      echo '  install-soft [--prefix=PREFIX] [--force-download=0|1] [--module-dir=MODULE_DIR] [--system=CLUSTER|SUSE|MINT|CENTOS] [--compiler=GNU|INTEL] [--mpi=openmpi110|openmpi201|openmpi300|intel2016|intel2017|intel2018|intel2019|mpich321|mpich332] [--python-version=X.X] [--show-old-version=0|1]'
        leave 0 ;;
    -p*=* | --prefix=*) prefix=`echo $1 | sed 's/.*=//'`; shift ;;
    -force-download=* | --force-download=*) forceDownload=`echo $1 | sed 's/.*=//'`; shift ;;
    -module-dir=* | --module-dir=*) moduleDir=`echo $1 | sed 's/.*=//'`; shift ;;
    -compiler=* | --compiler=*) compiler=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -system=* | --system=*) system=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -python-version=* | --python-version=*) pythonVersion=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -mpi=* | --mpi=*) mpi=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
    -show-old-version=* | --show-old-version=*) oldVersion=`echo $1 | sed 's/.*=//' | awk '{print tolower($0)}'`; shift ;;
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

#elif [ "$system" == "cygwin" ] ; then
#
#	systemOS=`echo "$system" | awk '{print tolower($0)}'`
#
else
	log fail "Unable to decode argument '--system'. Accepted values : CLUSTER|SUSE|MINT" 
	leave 1
fi
log notice "system is set to $systemOS"

# 2. Tester la version de Python
installedPython=0
if [ -z "$pythonVersion" ]; then
	if ! hash python 2>/dev/null; then        
		#log notice "Unable to find suitable version for Python" 
		pythonInterpreter="none"	    
	else	
		python --version &> version_test
		pythonVersion=$(cat version_test | sed -n 's/^[A-Z][a-z]*\s\([0-9]\.[0-9]*\).*/\1/p')
		rm -f version_test
		pythonInterpreter=python${pythonVersion}
		installedPython=1
		log notice "Python interpreter is set to $pythonInterpreter"
	fi

elif hash python${pythonVersion} 2>/dev/null
then    
	pythonInterpreter=python${pythonVersion}
	installedPython=1
	log notice "Python interpreter is set to $pythonInterpreter"
	if (( $(echo "$pythonVersion == 3.7" | bc -l) )); then # only Python==3.7
		installedPython=0
	fi
else
	if (( $(echo "$pythonVersion == 3.7" | bc -l) )); then # only Python==3.7
		pythonInterpreter=python${pythonVersion}
	else
		log fail "Only Python 3.7 can be installed with this tool" 
		leave 1
	fi
fi

# 3. Installation des paquets système
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

# 4. Récupérer la version du compilateur
if [ -z "$compiler" ]
then
	CC_VERSION=$(gcc --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')
	compilo=gcc${CC_VERSION//.}
	export CC=gcc
	export CXX=g++
	export F77=gfortran
	export F90=gfortran
	export FC=gfortran	
	log notice "compiler is set to GNU ${CC_VERSION}"

elif [ "$compiler" == "gnu" ]
then
	if ! [ -x "$(command -v gcc)" ] ; then
		log fail "Unable to find suitable compilers (gcc or icc)" 
		leave 1
	fi
	CC_VERSION=$(gcc --version | sed -n 's/^.*\s\([0-9]*\)\.\([0-9]*\)[\.0-9]*[\s]*.*/\1.\2/p')
	compilo=gcc${CC_VERSION//.}
	export CC=gcc
	export CXX=g++
	export F77=gfortran
	export F90=gfortran
	export FC=gfortran	
	log notice "compiler is set to GNU ${CC_VERSION}"

elif [ "$compiler" == "intel" ]
then
	if ! [ -x "$(command -v icc)" ] ; then
		log fail "Unable to find suitable compilers (gcc or icc)" 
		leave 1
	fi
	CC_VERSION=$(icc --version | grep ^icc | sed 's/^[a-z]*\s.[A-Z]*.\s//g')
	compilo=icc${CC_VERSION:0:2}
	export CC=icc
	export CXX=icpc
	export F77=ifort
	export F90=ifort
	export FC=ifort	
	log notice "compiler is set to INTEL ${CC_VERSION:0:2}"
else
	log fail "Unable to decode argument '--compiler'. Accepted values : GNU|INTEL" 
	leave 1
fi

# Fix for GNU 10
if [[ $compiler == "gnu" ]] && (( $(echo "${CC_VERSION} >= 10.0" |bc -l) )); then # only GNU>=10.2			
	export FFLAGS="-w -fallow-argument-mismatch -O2"
	export FCFLAGS="-w -fallow-argument-mismatch -O2"	
fi

# 5. Tester la version du MPI
if [ -z "$mpi" ]; then

	mpilib="none"  

elif [ "$mpi" == "openmpi110" ]; then

	mpilib="openmpi110"
        export MPICC=mpicc
	export MPIF77=mpif90
	export MPIFC=mpif90
	export MPIF90=mpif90
	export MPICXX=mpic++

elif [ "$mpi" == "openmpi201" ]; then

	mpilib="openmpi201"
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
        log fail "Unable to decode argument '--mpi'. Accepted values : openmpi110|openmpi201|openmpi300|intel2016|intel2017|intel2018|intel2019|mpich321|mpich332" 
	leave 1	
fi

if [ "$mpilib" == "openmpi110" ]; then
	mpi_dep="openmpi/$compilo/1.10.7"
elif [ "$mpilib" == "openmpi201" ]; then
	mpi_dep="openmpi/$compilo/2.0.1"
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
    log notice "No MPI librairy"  
else
    log notice "MPI librairy is set to $mpilib"
fi

# 6. Tester le prefix
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

# 7. Créer le répertoire dédié aux logiciels & librairies
if [ ! -d "$prefix" ] ; then mkdir $prefix ; fi
if [ ! -d "$prefix/src" ] ; then mkdir $prefix/src ; fi
if [ ! -d "$prefix/tgz" ] ; then mkdir $prefix/tgz ; fi
log 0 "Make dir prefix"

# 8. Installation du gestionnaire d'environnement Modules
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
else
	# On sauvegarde le module list actuel pour le rajouter aux dépendences
	module load use.own || leave 1 
	module list -t 2> module_list  || leave 1 	
	sed -i -e 's/(default)//' module_list  || leave 1 
	moduleList=`awk 'NR>1{for (i=1; i<=NF; i++)printf("%s ",$i);}' module_list`  || leave 1 
	rm module_list  || leave 1 
fi

# 9. Tester le module-dir
if [ -z "$moduleDir" ]; then
	moduleDir="$prefix/Modules/local"
else
	log notice "module dir is set to $moduleDir"
fi

# 10. Ancienne version
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
log notice "Show old version is set to $showOldVersion"

# 11. Création du module python-modules
# Si on a déjà un python installé
if [ "$installedPython" == "1" ]; then # only-if-Python
 
	if [[ ! -f "$moduleDir/python-modules/$compilo/${pythonVersion}" ]]
	then
		if [ ! -d "$moduleDir/python-modules/$compilo" ] ; then mkdir -p "$moduleDir/python-modules/$compilo" || leave 1; fi
    		pymodulefile="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tPython librairies\"
}
 
module-whatis \"Python librairies\"

prepend-path PATH $prefix/python-modules/$compilo/bin
prepend-path C_INCLUDE_PATH $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path INCLUDE $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path CPATH $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path PYTHONPATH $prefix/python-modules/$compilo/lib/$pythonInterpreter/site-packages
"
    		echo $"${pymodulefile}" >> $moduleDir/python-modules/$compilo/${pythonVersion}   
	fi
fi  # end-only-if-Python

# 12. Chargement des logiciels
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
source $basedir/include/06-python-modules.sh
source $basedir/include/07-model-telemac.sh
source $basedir/include/08-model-terraferma-v1.0.sh
source $basedir/include/09-model-fluidity.sh
source $basedir/include/11-model-delft.sh
source $basedir/include/100-web.sh

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

			if [ "$systemOS" == "cluster" ] ; then 
				# On enlève le module mpi
				mpi_dep_no_slash=${mpi_dep//\//\\/}							
				dependencies["$group$index"]=${dependencies["$group$index"]/$mpi_dep_no_slash/}

				# On enlève le module gdal
				if [[ $moduleList == *"gdal"* ]]; then 
					dependencies["$group$index"]=${dependencies["$group$index"]/gdal\/"$compilo"\/3.0.1/}
				fi
				
				# On enlève le module proj
				if [[ $moduleList == *"proj"* ]]; then 
					dependencies["$group$index"]=${dependencies["$group$index"]/proj\/"$compilo"\/6.1.1/}
				fi
					
				# On ajoute les deps du cluster				
				dependencies["$group$index"]=`echo $moduleList ${dependencies["$group$index"]}`													
			fi

			# Si on a déjà un python installé
			# On enlève le module python
			if [ "$installedPython" == "1" ]; then # only-if-Python				
				dependencies["$group$index"]=${dependencies["$group$index"]/python\/"$compilo"\/${pythonVersion}/}				
			fi  # end-only-if-Python

			if [[ ! -z "${dependencies["$group$index"]}" ]] ; then  module load ${dependencies["$group$index"]} || leave 1 ; fi

			cd $prefix/tgz

			if [ ! -f "${filename["$group$index"]}" -o $forceDownload == "1" ]; then 

				rm -f ${filename["$group$index"]}
				
				if [[ ${url["$group$index"]} == "localfile" ]] 
				then
					echo "......................"
					while true; do
						read -p "Type the absolute path of the archive file '${filename["$group$index"]}' : " filepath						
						
						if [ -f "$filepath/${filename["$group$index"]}" ]
						then
							cp $filepath/${filename["$group$index"]} . || leave 1 
							break;
						else
							echo "'$filepath/${filename["$group$index"]}' doesn't exists. Please try again."
						fi
					done
					
				else
					wget ${url["$group$index"]} || leave 1 
				fi
			fi

			if [ -d "$prefix/src/${dirname["$group$index"]}" ] ; then rm -rf $prefix/src/${dirname["$group$index"]} ; fi

			if [[ ${filename["$group$index"]} == *.tar.gz || ${filename["$group$index"]} == *.tgz ]] 
			then
				tar xvfz ${filename["$group$index"]} -C../src || leave 1

			elif [[ ${filename["$group$index"]} == *.zip ]] 
			then
				unzip -o ${filename["$group$index"]} -d../src || leave 1
			else
				mkdir -p ../src/${dirname["$group$index"]}
				mv ${filename["$group$index"]} ../src/${dirname["$group$index"]}/.
			fi

			cd ../src/${dirname["$group$index"]}

			if [[ ! -z "${configfile["$group$index"]}" && ! -z "${configfilename["$group$index"]}" ]]
		        then			
				echo $"${configfile["$group$index"]}" > ${configfilename["$group$index"]}		
			fi			

			if [[ -f "${patchfile_01["$group$index"]}" && ! -z "${patch_01["$group$index"]}" ]]
		        then		
				echo $"${patch_01["$group$index"]}" > patch_to_apply.patch
				patch -i patch_to_apply.patch ${patchfile_01["$group$index"]} || leave 1
			fi
			if [[ -f "${patchfile_02["$group$index"]}" && ! -z "${patch_02["$group$index"]}" ]]
		        then			
				echo $"${patch_02["$group$index"]}" > patch_to_apply.patch
				patch -i patch_to_apply.patch ${patchfile_02["$group$index"]} || leave 1
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
				if [ ! -d "$prefix/${dirinstall["$group$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$group$index"]}/bin" || leave 1; fi
				if [ ! -d "$prefix/${dirinstall["$group$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$group$index"]}/include/$pythonInterpreter" || leave 1; fi
				if [ ! -d "$prefix/${dirinstall["$group$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$group$index"]}/lib/$pythonInterpreter/site-packages" || leave 1; fi

                		export PYTHONUSERBASE=$prefix/${dirinstall["$group$index"]}
				if [[ "$compiler" == "intel" ]] ; then
					LDSHARED="icc -shared" $pythonInterpreter setup.py install --user || leave 1
				else
					$pythonInterpreter setup.py install --user || leave 1
				fi				

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
			
           		elif [[ "${builder["$group$index"]}" == "pybind11" ]]
				then
                		export PYTHONUSERBASE=$prefix/${dirinstall["$group$index"]}
				$pythonInterpreter setup.py install --user || leave 1
                		cp -r include/pybind11 $prefix/${dirinstall["$group$index"]}/include/$pythonInterpreter  || leave 1 				

            		elif [[ "${builder["$group$index"]}" == "numpy" || "${builder["$group$index"]}" == "scipy" ]]
			then    
                		export PYTHONUSERBASE=$prefix/${dirinstall["$group$index"]}            
				if [[  "$compiler" == "intel" ]] ; then					
                    			$pythonInterpreter setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem install --user || leave 1 
				else                   
					$pythonInterpreter setup.py install --user || leave 1
				fi
	 		elif [[ "${builder["$group$index"]}" == "aed2" ]]
	 		then    
                		make
				mkdir -p $prefix/${dirinstall["$group$index"]}
				cp -r lib $prefix/${dirinstall["$group$index"]}
				cp -r include $prefix/${dirinstall["$group$index"]}
				cp mod/* $prefix/${dirinstall["$group$index"]}/include

			elif [[ "${builder["$group$index"]}" == "metis" || "${builder["$group$index"]}" == "parmetis" ]]
	 		then    
                		make config shared=1 prefix=$prefix/${dirinstall["$group$index"]} ${args["$group$index"]}
				make install
				
			elif [[ "${builder["$group$index"]}" == "mumps" ]]
	 		then    
                		make all
				mkdir -p $prefix/${dirinstall["$group$index"]}
				cp -r lib $prefix/${dirinstall["$group$index"]}
				cp -r include $prefix/${dirinstall["$group$index"]}	
							
			elif [[ "${builder["$group$index"]}" == "scotch" ]]
	 		then   
				cd src 
                		make libscotch esmumps				
				make prefix=$prefix/${dirinstall["$group$index"]} install				
					
			elif [[ "${builder["$group$index"]}" == "ptscotch" ]]
	 		then   
				cd src                 		
				make libptscotch ptesmumps 
				make prefix=$prefix/${dirinstall["$group$index"]} install
					
			elif [[ "${builder["$group$index"]}" == "yarn" ]]
	 		then               		
				npm install
				npm install --global gulp-cli
				gulp build
				mkdir -p $prefix/${dirinstall["$group$index"]}
				cp -r ./* $prefix/${dirinstall["$group$index"]}				
					
			elif [[ "${builder["$group$index"]}" == "nodejs" ]]
	 		then               		
				./configure --prefix=$prefix/${dirinstall["$group$index"]} ${args["$group$index"]} || leave 1
				make || leave 1
				make install || leave 1
					
			elif [[ "${builder["$group$index"]}" == "composer" ]]
	 		then               		
				php composer-setup.php || leave 1
				mkdir -p $prefix/${dirinstall["$group$index"]}/bin
				cp composer.phar $prefix/${dirinstall["$group$index"]}/bin
					
			elif [[ "${builder["$group$index"]}" == "python-builder" ]]
			then
				./configure --prefix=$prefix/${dirinstall["$group$index"]} --libdir=$prefix/${dirinstall["$group$index"]}/lib ${args["$group$index"]} || leave 1
				make || leave 1
				make install || leave 1

				pythonVersion=$(echo ${version["$group$index"]} | sed -n 's/^\([0-9]\.[0-9]*\).*/\1/p')				
				pythonInterpreter=python${pythonVersion}
				log notice "Python interpreter is set to $pythonInterpreter"

				if [[ ! -f "$moduleDir/python-modules/$compilo/${pythonVersion}" ]]
				then
					if [ ! -d "$moduleDir/python-modules/$compilo" ] ; then mkdir -p "$moduleDir/python-modules/$compilo" || leave 1; fi
	    				pymodulefile="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tPython librairies\"
}
 
module-whatis \"Python librairies\"

prepend-path PATH $prefix/python-modules/$compilo/bin
prepend-path C_INCLUDE_PATH $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path INCLUDE $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path CPATH $prefix/python-modules/$compilo/include/$pythonInterpreter
prepend-path PYTHONPATH $prefix/python-modules/$compilo/lib/$pythonInterpreter/site-packages
"
    					echo $"${pymodulefile}" >> $moduleDir/python-modules/$compilo/${pythonVersion}   
				fi

			elif [[ "${builder["$group$index"]}" == "staticx" ]]
	 		then 
  
				if [ ! -d "$prefix/${dirinstall["$group$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$group$index"]}/bin" || leave 1; fi
				if [ ! -d "$prefix/${dirinstall["$group$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$group$index"]}/include/$pythonInterpreter" || leave 1; fi
				if [ ! -d "$prefix/${dirinstall["$group$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$group$index"]}/lib/$pythonInterpreter/site-packages" || leave 1; fi

                		export PYTHONUSERBASE=$prefix/${dirinstall["$group$index"]}
				if [[ "$compiler" == "intel" ]] ; then
					LDSHARED="icc -shared" $pythonInterpreter setup.py build || leave 1
					LDSHARED="icc -shared" $pythonInterpreter setup.py install --user || leave 1
				else
					$pythonInterpreter setup.py build || leave 1
					$pythonInterpreter setup.py install --user || leave 1
				fi	
					
			elif [[ "${builder["$group$index"]}" == "delft3d-builder" ]]
	 		then 
	 			mkdir -p $prefix/${dirinstall["$group$index"]}	
	 			mkdir -p $prefix/${dirinstall["$group$index"]}/lib 		 
				
				./autogen.sh || leave 1	
				export CFLAGS="-fPIC"
				export MPIFC=mpif90
				export MPI_INCLUDE=="-I${C_INCLUDE_PATH//:/ -I}"
				export MPILIBS_ADDITIONAL"-L${LD_LIBRARY_PATH//:/ -L} -lmpifort -lmpi"	
				
				export NETCDF_CFLAGS="-I${C_INCLUDE_PATH//:/ -I}"
				export NETCDF_LIBS="-L${LD_LIBRARY_PATH//:/ -L} -lnetcdf -lnetcdff"	
									
				./configure --prefix=$prefix/${dirinstall["$group$index"]} ${args["$group$index"]} || leave 1
				make || leave 1
				make ds-install || leave 1
				cp -r $prefix/${dirinstall["$group$index"]}/lib64/* $prefix/${dirinstall["$group$index"]}/lib 
				rm -rf $prefix/${dirinstall["$group$index"]}/lib64/
					
			fi
        		# Fin Compilation spécifique #	
           
			if [[ ! -z "${modulefile["$group$index"]}" && ! -f "$moduleDir/${dirmodule["$group$index"]}/${version["$group$index"]}" && ! -f "$moduleDir/${dirmodule["$group$index"]}/${pythonVersion}" ]]
		    	then
				mkdir -p $moduleDir/${dirmodule["$group$index"]}	
				if [[ ${dirmodule["$group$index"]} == python-modules* ]]
				then	                    
				    echo $"${modulefile["$group$index"]}" >> $moduleDir/${dirmodule["$group$index"]}/${pythonVersion}
				else                                      
				    echo $"${modulefile["$group$index"]}" >> $moduleDir/${dirmodule["$group$index"]}/${version["$group$index"]} 
				fi
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



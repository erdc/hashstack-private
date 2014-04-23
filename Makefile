# build_installer
# This Makefile documents the bootstrap process for building a
# self-installing package over the Cygwin subsystem.  This script
# should serve as a general guide, and not an idempotent installer.
# In particular, it relies on your existing Cygwin system already
# being capable of installing the Proteus packages.  
#
#
# Please contact Aron Ahmadia (aron@ahmadia.net) with any questions.
# 

.PHONY: all

all: Install_CorpsTools.exe

CACHE_DIR=./corpstools_cygwin_base
MIRROR=http://mirror.mcs.anl.gov/cygwin/

CACHE_DIR: setup_cygstack.py
	python setup_cygstack.py --cache ${CACHE_DIR} --mirror ${MIRROR}

setup-x86_64.exe:
	wget http://www.cygwin.com/setup-x86_64.exe

proteus_ready.done:
	git clone -b roams-hashstack git@github.com:erdc-cm/proteus.git proteus
	cd proteus; make hashdist stack stack/default.yaml
	touch proteus_ready.done

proteus-mprans: 
	git clone git@github.com:erdc-cm/proteus-mprans.git

proteus_mprans_build.done: nsis_proteus_build.done proteus-mprans
	cd proteus-mprans; PROTEUS=../proteus PROTEUS_PREFIX=../proteus/cygwin ../proteus/cygwin/bin/python setup.py install
	touch proteus_mprans_ready.done

stack_ready.done: proteus_ready.done proteus/stack proteus/hashdist
	cd proteus/stack; ../hashdist/bin/hit develop -v -f -l copy -k error default.yaml ../cygwin
	touch stack_ready.done

nsis_proteus_build.done: proteus_ready.done stack_ready.done
	cd proteus; make NO_MATLAB=1 VERBOSE=1 check 
	touch nsis_proteus_build.done

Install_CorpsTools.exe: nsis_proteus_build.done proteus_mprans_build.done installer.nsi setup-x86_64.exe
	/cygdrive/c/Program\ Files\ \(x86\)/NSIS/makensis installer.nsi


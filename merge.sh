#!/bin/bash

function usage {
	echo
	echo "Script merges buildroot package and burnet package"
	echo
	echo "Supported versions:"
	echo "* 2011.02"
	echo "* 2010.11"
	echo
	echo "usage: ./merge.sh <BUILDROOT_DIR> <DL_DIR>"
	echo "example: ./merge.sh /tmp/buildroot /tmp/dl"
	echo ""
	echo "<BUILDROOT_DIR> - directory, where buildroot package was unpacked,"
	echo "<DL_DIR> - directory, where all downloaded packages will be kept."
	echo
	exit
}

function buildroot_2010_11 {
	ln -s $BURNET_DIR/Propox $BUILDROOT_DIR/target/device/Propox
	ln -s $BURNET_DIR/Propox/MMNet1002/configs/buildroot.config $BUILDROOT_DIR/configs/MMNet1002_defconfig
	ln -s $DL_DIR $BUILDROOT_DIR/dl
	mv $BUILDROOT_DIR/target/device/Config.in $BUILDROOT_DIR/target/device/Config.in.old
	sed '/xtensa/ a\source "target/device/Propox/Config.in"' $BUILDROOT_DIR/target/device/Config.in.old > $BUILDROOT_DIR/target/device/Config.in
	cd $BUILDROOT_DIR
	make MMNet1002_defconfig
}

function buildroot_2011_02 {
	ln -s $BURNET_DIR/Propox $BUILDROOT_DIR/target/device/Propox
	ln -s $BUILDROOT_DIR/target/device/Propox $BUILDROOT_DIR/board/Propox
	ln -s $DL_DIR $BUILDROOT_DIR/dl
	ln -s $BURNET_DIR/Propox/MMNet1002/configs/buildroot-2011.02.config $BUILDROOT_DIR/configs/MMNet1002_defconfig
	cat $BURNET_DIR/clean_target.makefile >> $BUILDROOT_DIR/Makefile
	cd $BUILDROOT_DIR
	make MMNet1002_defconfig
}

if [ "x" == "x$1" ] || [ "x" == "x$2" ]
then
	usage
fi

BUILDROOT_DIR=$1
BURNET_DIR=`pwd`
DL_DIR=$2
BUILDROOT_VER=`cat $BUILDROOT_DIR/CHANGES |head -1|awk -F "," '{print $1}'`

echo
echo "Burnet merge script:"
echo
echo "BUILDROOT_DIR: $BUILDROOT_DIR"
echo "BURNET_DIR: $BURNET_DIR"
echo "DL_DIR: $DL_DIR"
echo "BUILDROOT_VER: $BUILDROOT_VER"
echo
sleep 1

if [ "x$BUILDROOT_VER" == "x2011.02" ]
then
	buildroot_2011_02
elif [ "x$BUILDROOT_VER" == "x2010.11" ]
then
	buildroot_2010_11
else
	echo "buildroot version not supported"
	exit
fi

echo
echo "-------------------------------------------------"
echo "now go to $BUILDROOT_DIR and type 'make' to build"
echo "-------------------------------------------------"
echo

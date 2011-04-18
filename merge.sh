#!/bin/bash

function usage {
	echo 
	echo "Script merges buildroot package and burnet package"
	echo ""
	echo "usage: ./merge.sh <BUILDROOT_DIR> <BURNET_DIR> <DL_DIR>"
	echo "example: ./merge.sh /tmp/buildroot /tmp/burnet /tmp/dl"
	echo ""
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
	ln -s $BURNET_DIR/Propox $BUILDROOT_DIR/board/Propox
	ln -s $BURNET_DIR/Propox $BUILDROOT_DIR/target/device/Propox
	ln -s $DL_DIR $BUILDROOT_DIR/dl
	ln -s $BURNET_DIR/Propox/MMNet1002/configs/buildroot-2011.02.config $BUILDROOT_DIR/configs/MMNet1002_defconfig
}

if [ "x" == "x$1" ] || [ "x" == "x$2" ] || [ "x" == "x$3" ]
then
	usage
fi

BUILDROOT_DIR=$1
BURNET_DIR=$2
DL_DIR=$3
BUILDROOT_VER=`cat $BUILDROOT_DIR/CHANGES |head -1|awk -F "," '{print $1}'`

echo 
echo "Burnet merge script:"
echo
echo "BUILDROOT_DIR: $BUILDROOT_DIR"
echo "BURNET_DIR: $BURNET_DIR"
echo "DL_DIR: $DL_DIR"
echo "BUILDROOT_VER: $BUILDROOT_VER"
echo 
sleep 3

if [ "x$BUILDROOT_VER" == "x2011.02" ]
then
	buildroot_2011_02
else
	buildroot_2010_11
fi


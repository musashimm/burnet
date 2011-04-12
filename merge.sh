#!/bin/bash

function usage {
	echo "Script merges buildroot package and burnet package"
	echo ""
	echo "usage: ./merge.sh <BUILDROOT_DIR> <BURNET_DIR>"
	echo "example: ./merge.sh /tmp/buildroot /tmp/burnet"
	echo ""
	exit
}

if [ "x" == "x$1" ]
then
	usage
fi

if [ "x" == "x$2" ]
then
	usage
fi

BUILDROOT_DIR=$1
BURNET_DIR=$2

echo 
echo "Burnet merge script:"
echo "BUILDROOT_DIR: $BUILDROOT_DIR"
echo "BURNET_DIR: $BURNET_DIR"
echo 
sleep 5

ln -s $BURNET_DIR/Propox $BUILDROOT_DIR/target/device
ln -s $BURNET_DIR/Propox/MMNet1002/configs/buildroot.config $BUILDROOT_DIR/configs/MMNet1002_defconfig
mv $BUILDROOT_DIR/target/device/Config.in $BUILDROOT_DIR/target/device/Config.in.old
sed '/xtensa/ a\source "target/device/Propox/Config.in"' $BUILDROOT_DIR/target/device/Config.in.old > $BUILDROOT_DIR/target/device/Config.in
cd $BUILDROOT_DIR
make MMNet1002_defconfig


#!/bin/sh

set -e

DEV=$1

[ "$#" -ne 1 ] && echo "usage: ./flash.sh /path/to/device" && exit 1

[ ! -f $1 ] && echo "ERROR: The device to write to '${1}' does not exist" && exit 1

# First build U-Boot image
CONFIG_PATH=$(pwd)/u-boot-config
cd u-boot
make clean
cp $CONFIG_PATH .config
make -j$(nproc)
cd ..

OUTPUT_DIR=output
UBOOT_BIN_PATH=$(pwd)/u-boot/u-boot.bin

cd amlogic-boot-fip
rm -rf $OUTPUT_DIR
mkdir $OUTPUT_DIR
./build-fip.sh odroid-c4 $UBOOT_BIN_PATH $OUTPUT_DIR

sudo dd if=$OUTPUT_DIR/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
sudo dd if=$OUTPUT_DIR/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440


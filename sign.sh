#!/bin/sh

set -e

OUTPUT_DIR=output
UBOOT_BIN_PATH=$(pwd)/u-boot/u-boot.bin

cd amlogic-boot-fip
rm -rf $OUTPUT_DIR
mkdir $OUTPUT_DIR
./build-fip.sh odroid-c4 $UBOOT_BIN_PATH $OUTPUT_DIR

DEV=/dev/sda
sudo dd if=$OUTPUT_DIR/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
sudo dd if=$OUTPUT_DIR/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440

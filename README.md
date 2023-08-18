# Script for flashing U-Boot to the Odroid-C4

This script is simply an automation of the following instructions:
https://u-boot.readthedocs.io/en/latest/board/amlogic/odroid-c4.html.

It allows you to easily create a bootable SD card for the HardKernel Odroid-C4.

Thank you to the U-Boot developers for publishing this information.

## Using the script

Note that you will need the dependencies to build U-Boot as well as the
`aarch64-none-elf-` toolchain to compile U-Boot.

Note that you also may need to run the script with `sudo` as the script
uses `dd` to write to the SD card.

To run the script:
```sh
git clone --recursive https://github.com/Ivan-Velickovic/flash_uboot_odroidc4.git
cd flash_uboot_odroidc4
./flash.sh <PATH TO DEVICE YOU WANT TO FLASH>
```

## Using the prebuilt images

```sh
git clone https://github.com/Ivan-Velickovic/flash_uboot_odroidc4.git
cd flash_uboot_odroidc4
DEV=/path/to/device/to/flash
dd if=prebuilt/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
dd if=prebuilt/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
```

Note you may need to run `dd` with sudo.

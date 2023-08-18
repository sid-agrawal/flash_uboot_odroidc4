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
git clone --recursive https://github.com/Ivan-Velickovic/odroidc4_uboot_sign.git
cd odroidc4_uboot_sign
./flash.sh <PATH TO DEVICE YOU WANT TO FLASH>
```


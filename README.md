# Script flashing U-Boot to the Odroid-C4

This script is simply an automation of the following instructions:
https://u-boot.readthedocs.io/en/latest/board/amlogic/odroid-c4.html.

Thank you to the U-Boot developers for publishing this information.

To run the script:
```sh
git clone --recursive https://github.com:Ivan-Velickovic/odroidc4_uboot_sign.git
cd odroidc4_uboot_sign
./flash.sh <PATH TO DEVICE YOU WANT TO FLASH>
```


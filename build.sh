#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh

# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_ARM_PREFIX=arm-linux-gnueabihf- build -s -n 0 -a ARM -t GCC5 -p PixelXLPkg/PixelXLPkg.dsc
gzip -c < workspace/Build/PixelXLPkg/DEBUG_GCC5/FV/PIXELXLPKG_UEFI.fd >uefi_image
cat fdt >>uefi_image
mkbootimg --kernel uefi_image --ramdisk ramdisk-null --base 0x80000000 --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --second_offset 0x00f00000 --tags_offset 0x00000100 --pagesize 4096 -o uefi.img

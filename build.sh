#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh

# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p PixelXLPkg/PixelXLPkg.dsc
gzip -c < workspace/Build/PixelXLPkg/DEBUG_GCC5/FV/PIXELXLPKG_UEFI.fd >uefi_image
cat marlin.dtb >>uefi_image
#mkbootimg --kernel uefi_image --ramdisk ramdisk-null --base 0x80000000 --kernel_offset 0x80008000 --ramdisk_offset 0x81000000 --second_offset 0x80f00000 --tags_offset 0x80000100 --pagesize 4096 -o uefi_test.img
abootimg --create uefi.img -k uefi_image -r ramdisk-null -f bootimg.cfg # It likes abootimg more.

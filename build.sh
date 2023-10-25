#!/bin/bash
# based on the instructions from edk2-platform
# Set environment variables
set -e
. build_common.sh

# Remove old files.
# rm -rf ImageResources/*

# Not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p PixelXLPkg/PixelXLPkg.dsc
cat ./BootShim/BootShim.bin ./workspace/Build/PixelXLPkg/DEBUG_GCC5/FV/PIXELXLPKG_UEFI.fd > ./ImageResources/bootpayload.bin
gzip -c < ./ImageResources/bootpayload.bin >./ImageResources/bootpayload.bin.gz
cat ./ImageResources/marlin.dtb ./ImageResources/bootpayload.bin.gz >>./ImageResources/Image.gz-dtb

mkbootimg --kernel ./ImageResources/Image.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x80000000 --pagesize 4096 \
  --kernel_offset 0x00008000 \
  --second_offset 0x00f00000 \
  --ramdisk_offset 0x01000000 \
  --tags_offset 0x00000100 \
  -o ./ImageResources/uefi.img

# abootimg --create uefi.img -k ./ImageResources/Image.gz-dtb -r ramdisk-null -f bootimg.cfg

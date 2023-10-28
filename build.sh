#!/bin/bash
# based on the instructions from edk2-platform
# Set environment variables
set -e
. build_common.sh

# Remove old build files...
rm -rf ./Build/

# Not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p PixelXLPkg/PixelXLPkg.dsc

# Build Images...
# UEFI With BootShim!

# Remove old shimuefi...
rm -rf ./ImageResources/shimuefi.img

# Build BootShim...
cd ./BootShim/
make UEFI_BASE=0x80200000 UEFI_SIZE=0x00100000
cd ..

# Build shimage...
cat ./BootShim/BootShim.bin ./Build/PixelXLPkg/DEBUG_GCC5/FV/PIXELXLPKG_UEFI.fd > ./ImageResources/bootpayload.bin
gzip -c < ./ImageResources/bootpayload.bin >./ImageResources/bootpayload.bin.gz
cat ./ImageResources/marlin.dtb ./ImageResources/bootpayload.bin.gz >>./ImageResources/ShImage.gz-dtb

mkbootimg --kernel ./ImageResources/ShImage.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x80000000 --pagesize 4096 \
  --kernel_offset 0x00008000 \
  --second_offset 0x00f00000 \
  --ramdisk_offset 0x01000000 \
  --tags_offset 0x00000100 \
  -o ./ImageResources/shimuefi.img

# UEFI Without BootShim!

# Remove old uefi...
rm -rf ./ImageResources/uefi.img

# Build image...
gzip -c < ./Build/PixelXLPkg/DEBUG_GCC5/FV/PIXELXLPKG_UEFI.fd >./ImageResources/Image.gz-dtb
cat ./ImageResources/marlin.dtb >>./ImageResources/Image.gz-dtb

mkbootimg --kernel ./ImageResources/Image.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x80000000 --pagesize 4096 \
  --kernel_offset 0x00008000 \
  --second_offset 0x00f00000 \
  --ramdisk_offset 0x01000000 \
  --tags_offset 0x00000100 \
  -o ./ImageResources/uefi.img

# Remove old files...
rm -rf ./BootShim/BootShim.bin
rm -rf ./BootShim/BootShim.elf
rm -rf ./ImageResources/bootpayload.bin
rm -rf ./ImageResources/bootpayload.bin.gz
rm -rf ./ImageResources/ShImage.gz-dtb
rm -rf ./ImageResources/Image.gz-dtb

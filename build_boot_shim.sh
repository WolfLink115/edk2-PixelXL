#!/bin/bash

cd BootShim
make UEFI_BASE=0x80200000 UEFI_SIZE=0x00100000
cd ..
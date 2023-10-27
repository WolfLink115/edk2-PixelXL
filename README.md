# WIP MSM8996 EDK2 Port

## I DID NOT MAKE THE ACPI TABLES! THIS TREE WAS COPIED FROM XIAOMIMIXPKG AND CHANGED IN HOPES OF GETTING MSM8996/MSM8996PRO (Snapdragon 820/821) DEVICES WORKING WITH UEFI! NOTHING IS WORKING AT ALL AS OF YET!

### Clone sources:
* git clone https://github.com/Tianocore/edk2 --recursive
* git clone https://github.com/Tianocore/edk2-platforms
* git clone https://github.com/WolfLink115/edk2-msm8996

### Build UEFI Image(s):
* ./build.sh

## DON'T FLASH IMAGE! SINCE IT IS EXPERIMENTAL AND (at least for me) NON-WORKING, IT ISN'T WORTH BREAKING YOUR DEVICE!

## Even though it has yet to work, I would like to thank some people for providing sources and helping me:
* Tianocore (for providing EDK2 source code and making this project possible in the first place) - https://github.com/Tianocore
* Sonic011Gamer (for trying to help me make it work) - https://github.com/sonic011gamer
* Halal Beef (for trying to help me make it work) - https://github.com/halal-beef
* S-8506 (for the original edk2-lithium package) - https://github.com/S-8506
* And for others I might have missed! Thank you all!

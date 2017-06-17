# Source this file before triggering any build command
# Remember to modify the paths if required according to your machine setup.

# Start Configuration here.
# Source tihs file from within linux/ before triggering any build
#	rpi_iot_kernel/linux $    source ../support/set_env.sh


echo "Setting RPI Env Variables..."

##### Rpi 2 and below
ARCH=arm
CROSS_COMPILE=arm-bcm2708hardfp-linux-gnueabi-
TOOLCHAIN_BIN=../tools/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin

##### Rpi 3
#ARCH=arm64
#CROSS_COMPILE=arm-bcm2708hardfp-linux-gnueabi-
#TOOLCHAIN_BIN=../tools/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin



##### Generic Environment Variables
PATH=$PATH:$PWD/$TOOLCHAIN_BIN
KBUILD_OUTPUT=_build_output_folder
CUR_DIR=$(pwd)



echo "Done."

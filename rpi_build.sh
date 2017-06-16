#export ARCH=arm
#export CROSS_COMPILE=arm-bcm2708hardfp-linux-gnueabi-
#export PATH=$PATH:/home/sudhanshu/rpi/tools/tools/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin


##### Environment Defs
LINUX_DIR=$PWD
TOOLCHAIN_ROOT=$LINUX_DIR/../tools/

##### Build commands
#make ARCH=arm CROSS_COMPILE=arm-bcm2708hardfp-linux-gnueabi- bcmrpi_defconfig
#make ARCH=arm CROSS_COMPILE=arm-bcm2708hardfp-linux-gnueabi- 
make bcmrpi_defconfig && make -j4 KBUILD_OUTPUT=$KBUILD_OUTPUT

##### Make Image
#&& cd$TOOLCHAIN_ROOT/mkimage/
#&& ./imagetool-uncompressed.py $LINUX_DIR/$KBUILD_OUTPUT/arch/arm/boot/zImage
#&& cp kernel.img $CUR_DIR/kernel.img
#&& echo "Kernel Image Location : " + $CUR_DIR/kernel.img
  


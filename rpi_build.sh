

##### Environment Defs
LINUX_DIR=$PWD
SUPPORT_FOLDER=$LINUX_DIR/../support
TOOLCHAIN_ROOT=$LINUX_DIR/../tools/
CONFIG_FILE="$LINUX_DIR/.config"
KBUILD_OUTPUT=_build_folder

##### Source Environment Variables
source $SUPPORT_FOLDER/set_env.sh

##### Shout Out for Build Params
echo "============================================"
echo "LINUX_DIR=$LINUX_DIR"
echo "TOOLCHAIN_ROOT=$TOOLCHAIN_ROOT"
echo "CONFIG_FILE=$CONFIG_FILE"
echo "ARCH=$ARCH"
echo "CROSS_COMPILE=$CROSS_COMPILE"
echo "KBUILD_OUTPUT=$KBUILD_OUTPUT"
echo "============================================"


##### For first time build
# Copy the default config file from default config folder
if [ ! -f "$CONFIG_FILE" ];
then
   echo ".config not found. Using default Rpi Config..."
   make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE bcmrpi_defconfig
fi

##### Build commands
make -j4 ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE 


##### Make Image
#&& cd$TOOLCHAIN_ROOT/mkimage/
#&& ./imagetool-uncompressed.py $LINUX_DIR/$KBUILD_OUTPUT/arch/arm/boot/zImage
#&& cp kernel.img $CUR_DIR/kernel.img
#&& echo "Kernel Image Location : " + $CUR_DIR/kernel.img
  


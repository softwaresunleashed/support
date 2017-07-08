

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
echo "CUR_DIR=$CUR_DIR"
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
   
   # For RPi Model 1
   make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE bcmrpi_defconfig
   
   # For RPi Model 2 and Above
   #make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE bcm2709_defconfig
fi

##### Build commands 
### RPi 1
make -j4 ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE
sudo make -j4 ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE modules_install INSTALL_MOD_PATH=./MODULES_TO_COPY


##### Make Image
### Old Image Creation Process
#cd $TOOLCHAIN_ROOT/mkimage/
#./imagetool-uncompressed.py $LINUX_DIR/arch/arm/boot/zImage
#mv kernel.img $CUR_DIR/kernel.img

### New Image Creation Process
cd $LINUX_DIR/scripts/
./mkknlimg $LINUX_DIR/arch/arm/boot/zImage $CUR_DIR/kernel.img


### Display Build Artifact's location
echo "Kernel Image Location : $CUR_DIR/kernel.img"
cd $CUR_DIR


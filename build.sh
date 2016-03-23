PATH=${PATH}:~/toolchains/google/arm-eabi-4.8/bin/
KERNEL_DIR=$PWD
export USE_CCACHE=1
export CCACHE_DIR=~/android/cache
export ARCH=arm
export SUBARCH=arm
make cyanogenmod_wt88047_defconfig ARCH=arm CROSS_COMPILE=arm-eabi-
make menuconfig
make -j4 ARCH=arm CROSS_COMPILE=arm-eabi-
dtbToolCM -2 -o $KERNEL_DIR/arch/arm/boot/dt.img -s 2048 -p $KERNEL_DIR/scripts/dtc/ $KERNEL_DIR/arch/arm/boot/dts/

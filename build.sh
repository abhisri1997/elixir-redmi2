PATH=${PATH}:~/toolchains/google/arm-eabi-4.8/bin/
KERNEL_DIR=$PWD
export USE_CCACHE=1
export CCACHE_DIR=~/android/cache
export ARCH=arm
export SUBARCH=arm
make cyanogenmod_wt88047_defconfig ARCH=arm CROSS_COMPILE=arm-eabi-
make menuconfig
make -j5 ARCH=arm CROSS_COMPILE=arm-eabi-

echo -e "Copying zImage to output directory.....\n"
cp ~/Xiaomi/arch/arm/boot/zImage ~/Output/Redmi2/raw/
cp ~/Xiaomi/arch/arm/boot/zImage ~/Output/Redmi2/zip/
echo "File found started to copy Kernel files...."
echo -e "Copying dt.img to output directory.....\n"
cp ~/Xiaomi/arch/arm/boot/dt.img ~/Output/Redmi2/raw/
echo "File found started to copy files...."
cd ~/Output/Redmi2/convert
echo "Cleaning up the directory for the fresh build......"
./cleanup.sh
echo "Unpacking boot image now......"
./unpackimg.sh boot.img
echo "Moving and replacing the files for repacking...."
mv ~/Output/Redmi2/raw/zImage ~/Output/Redmi2/convert/split_img/boot.img-zImage
mv ~/Output/Redmi2/raw/dt.img ~/Output/Redmi2/convert/split_img/boot.img-dtb
echo -e "Done replacing......\n\n"
echo "Now repacking kernel to boot.img..........."
./repackimg.sh
echo "Geting your boot.img file......"
cp ~/Output/Redmi2/convert/image-new.img ~/Output/Redmi2/image/
cd ~/Output/Redmi2/image/
build_date=$(date '+%d%m%y')
for file in image-new*
do
  mv "$file" "boot-$build_date${file#image-new}"
done
nautilus ~/Output/Redmi2/image/

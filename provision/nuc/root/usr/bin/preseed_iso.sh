#!/bin/bash

cd /build

# Unpack
mkdir isofiles
7z x -oisofiles $ISOFILE

# Add preseed
chmod +w -R isofiles/install.amd/
gunzip isofiles/install.amd/initrd.gz
echo preseed.cfg | cpio -H newc -o -A -F isofiles/install.amd/initrd
gzip isofiles/install.amd/initrd
chmod -w -R isofiles/install.amd/

# Regenerate the md5sum
cd isofiles
chmod +w md5sum.txt
find -follow -type f ! -name md5sum.txt -print0 | xargs -0 md5sum > md5sum.txt
chmod -w md5sum.txt
cd ..

# Get the isohdpfx.bin
curl -sLO http://ftp.de.debian.org/debian/pool/main/s/syslinux/isolinux_6.04~git20190206.bf6db5b4+dfsg1-3_all.deb
7z x isolinux_6.04~git20190206.bf6db5b4+dfsg1-3_all.deb data.tar
7z e data.tar ./usr/lib/ISOLINUX/isohdpfx.bin

# Create new iso file
PRESEEDED_ISOFILE=preseeded-$ISOFILE
xorriso -as mkisofs \
  -o $PRESEEDED_ISOFILE \
  -isohybrid-mbr isohdpfx.bin \
  -c isolinux/boot.cat \
  -b isolinux/isolinux.bin \
  -no-emul-boot -boot-load-size 4 -boot-info-table \
  -eltorito-alt-boot \
  -e boot/grub/efi.img \
  -no-emul-boot \
  isofiles

# Clean up
rm -rf isofiles

echo "Moving preseeded file to host"
mv $PRESEEDED_ISOFILE /host/
echo "Done! the file is named '$PRESEEDED_ISOFILE'"
#!/bin/bash
#
# prepare.sh

dir=$(pwd)/void-packages

if [ ! -d $dir ] ; then
  git clone --depth 1 git://github.com/void-linux/void-packages.git $dir
else
  cd $dir
  git pull
fi

/bin/echo -e '\x1b[32mEnabling ethereal chroot-style...\x1b[0m'
echo XBPS_CHROOT_CMD=ethereal >> $dir/etc/conf
echo XBPS_ALLOW_CHROOT_BREAKOUT=yes >> $dir/etc/conf

/bin/echo -e '\x1b[32mLinking / to /masterdir...\x1b[0m'
ln -s / $dir/masterdir

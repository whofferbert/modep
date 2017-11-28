PLUGIN=fluidsynth
GIT_URI=https://git.code.sf.net/p/fluidsynth/code-git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}/fluidsynth

export PKG_CONFIG_DIR=
export PKG_CONFIG_LIBDIR=${ROOTFS_DIR}/usr/local/lib/pkgconfig:${ROOTFS_DIR}/usr/lib/pkgconfig:${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/pkgconfig:${ROOTFS_DIR}/usr/share/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=${ROOTFS_DIR}

sed -i '1s/^/m4_pattern_allow([AC_LIB_PROG_LD_GNU])\n/' configure.ac
sed -i -- 's/AM_INIT_AUTOMAKE(fluidsynth, \$FLUIDSYNTH_VERSION)/AM_INIT_AUTOMAKE(fluidsynth, \$FLUIDSYNTH_VERSION)\nAC_DEFINE(DEFAULT_SOUNDFONT, "share\/soundfonts\/default.sf2", \[Default soundfont\])/' configure.ac
./autogen.sh
#./configure --prefix=${ROOTFS_DIR}/usr/local --disable-portaudio-support --disable-ladcca --disable-lash --disable-dart --disable-coremidi --disable-coreaudio --disable-aufile-support --disable-pulse-support --disable-alsa-support --disable-dbus-support  --disable-oss-support --host=arm-linux-gnueabihf --with-sysroot=${ROOTFS_DIR} CFLAGS='--sysroot=${ROOTFS_DIR}'
./configure --disable-portaudio-support --disable-ladcca --disable-lash --disable-dart --disable-coremidi --disable-coreaudio --disable-aufile-support --disable-pulse-support --disable-alsa-support --disable-dbus-support  --disable-oss-support --host=arm-linux-gnueabihf --with-sysroot=${ROOTFS_DIR} CFLAGS='--sysroot=${ROOTFS_DIR}'
make -j 4
make install DESTDIR=${ROOTFS_DIR} V=1

popd

rm -r ${TMP_DIR}

PLUGIN=FluidPlug
GIT_URI=https://github.com/falkTX/FluidPlug.git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}

pushd ${TMP_DIR}

make -j4 NOOPT=true

unset PKG_CONFIG_DIR
unset PKG_CONFIG_LIBDIR
unset PKG_CONFIG_SYSROOT_DIR

on_chroot << EOF
	echo INSTALLING
	pkg-config --libs fluidsynth --debug
	cd /tmp/${PLUGIN}
	make install
EOF

rm -rf $LV2_DIR/Black_Pearl_4A.lv2
rm -rf $LV2_DIR/Black_Pearl_4B.lv2
rm -rf $LV2_DIR/Black_Pearl_5.lv2
rm -rf $LV2_DIR/AVL_Drumkits_Perc.lv2
rm -rf $LV2_DIR/Red_Zeppelin_4.lv2
rm -rf $LV2_DIR/Red_Zeppelin_5.lv2

popd

rm -rf ${TMP_DIR}


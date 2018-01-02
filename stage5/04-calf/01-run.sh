PLUGIN=calf
GIT_URI="https://github.com/BlokasLabs/${PLUGIN} -b 0.90.0-1"
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

#echo dir ${PKG_CONFIG_DIR}
#echo libdir ${PKG_CONFIG_LIBDIR}
#echo sysrt ${PKG_CONFIG_SYSROOT_DIR}

#exit

NOCONFIGURE=1 ./autogen.sh
#--without-oss --without-alsa --without-vst --without-gui --with-lv2=yes
CFLAGS="--sysroot=${ROOTFS_DIR}" LDFLAGS="--sysroot=${ROOTFS_DIR}" ./configure --host=arm-linux-gnueabihf --with-sysroot=${ROOTFS_DIR} --disable-static --enable-shared
sed -i "s@-lstdc++ -lm -lgcc_s -lc -lgcc_s@@g" libtool

#LIBEXPAT_SO=${ROOTFS_DIR}$(readlink ${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/libexpat.so)
#mv ${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/libexpat.so ${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/libexpat.so.bak
#ln -s ${LIBEXPAT_SO} ${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/libexpat.so

#file ${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/libexpat.so

make V=1 -j4

make install V=1 DESTDIR=${ROOTFS_DIR} lv2dir=${LV2_DIR}/${PLUGIN}.lv2

#chroot ${ROOTFS_DIR} sh -c "cd /tmp/${PLUGIN} && make install V=1 lv2dir=${LV2_DIR}"

#make install DESTDIR=${ROOTFS_DIR} amsynth_lv2dir=/usr/local/modep/.lv2/amsynth.lv2 V=1

#unlink ${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/libexpat.so
#mv ${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/libexpat.so.bak ${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/libexpat.so

popd

#rm -rf ${TMP_DIR}


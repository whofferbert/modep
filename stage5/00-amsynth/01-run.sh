PLUGIN=amsynth
GIT_URI="https://github.com/BlokasLabs/${PLUGIN}"
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

./autogen.sh
./configure --without-oss --without-alsa --without-vst --without-gui --with-lv2=yes --host=arm-linux-gnueabihf --with-sysroot=${ROOTFS_DIR} CFLAGS="--sysroot=${ROOTFS_DIR}"

make -j4

make install DESTDIR=${ROOTFS_DIR} amsynth_lv2dir=/usr/local/modep/.lv2/amsynth.lv2 V=1

popd

rm -rf ${TMP_DIR}


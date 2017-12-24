PLUGIN=bolliedelay
GIT_URI="https://github.com/BlokasLabs/bolliedelay.lv2"
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

CC=arm-linux-gnueabihf-gcc make

make install DESTDIR=${ROOTFS_DIR}

mv ${ROOTFS_DIR}/usr/local/lib/lv2/${PLUGIN}.lv2 ${LV2_ABS_DIR}/${PLUGIN}.lv2

popd

rm -rf ${TMP_DIR}


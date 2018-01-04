PLUGIN=invada-studio
GIT_URI="https://github.com/BlokasLabs/${PLUGIN}"
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-gcc
export STRIP=arm-linux-gnueabihf-strip

CFLAGS="--sysroot=${ROOTFS_DIR}" LDFLAGS="--sysroot=${ROOTFS_DIR}" make VERBOSE=1 -j4
make install-sys DESTDIR=${ROOTFS_DIR} INSTALL_SYS_PLUGINS_DIR=${LV2_DIR}

popd

rm -rf ${TMP_DIR}


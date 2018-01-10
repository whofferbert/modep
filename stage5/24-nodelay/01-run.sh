PLUGIN=nodelay.lv2
GIT_URI="https://github.com/BlokasLabs/${PLUGIN}"
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-gcc
export STRIP=arm-linux-gnueabihf-strip

export CFLAGS="--sysroot=${ROOTFS_DIR}"
export LDFLAGS="--sysroot=${ROOTFS_DIR}"
export BUILDOPENGL=no
export BUILDGTK=no
export HAVE_UI=no
export OPTIMIZATIONS=
export MOD=1
export DESTDIR=${ROOTFS_DIR}
export LV2DIR=${LV2_DIR}

make -j4
make install 

popd

rm -rf ${TMP_DIR}


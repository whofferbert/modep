#!/bin/bash -e

PLUGIN=sooperlooper.lv2
GIT_URI="https://github.com/BlokasLabs/sooperlooper-lv2-plugin"
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}/sooperlooper

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-gcc
export STRIP=arm-linux-gnueabihf-strip

CFLAGS="--sysroot=${ROOTFS_DIR}" LDFLAGS="--sysroot=${ROOTFS_DIR}" make VERBOSE=1 -j4
make install INSTALLATION_PATH=${LV2_ABS_DIR}/${PLUGIN}

popd

rm -rf ${TMP_DIR}


#!/bin/bash -e

PLUGIN=SHIRO-plugins
GIT_URI="https://github.com/BlokasLabs/${PLUGIN} --recursive"
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-ld
export STRIP=arm-linux-gnueabihf-strip

make NOOPT=true -j4 CFLAGS="--sysroot=${ROOTFS_DIR}" LDFLAGS="--sysroot=${ROOTFS_DIR}"

cp -r bin/*.lv2 ${LV2_ABS_DIR}/

popd

rm -rf ${TMP_DIR}


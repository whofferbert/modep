#!/bin/bash -e

PLUGIN=setBfree
GIT_URI="https://github.com/BlokasLabs/setBfree"
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

CC=arm-linux-gnueabihf-gcc make MOD=1 OPTIMIZATIONS="-ffast-math -fomit-frame-pointer -O3 -fno-finite-math-only"

CC=arm-linux-gnueabihf-gcc make install MOD=1 DESTDIR=${ROOTFS_DIR} lv2dir=${LV2_DIR}

popd

rm -rf ${TMP_DIR}


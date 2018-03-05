#!/bin/bash -e

PLUGIN=triceratops.lv2
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-ld
export STRIP=arm-linux-gnueabihf-strip

export CXXFLAGS="--sysroot=${ROOTFS_DIR} -fPIC"
export LDFLAGS="--sysroot=${ROOTFS_DIR} -fPIC"

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}
./waf configure --prefix=/usr/ --destdir=${ROOTFS_DIR} --lv2dir=${LV2_ABS_DIR}
./waf build -j4 -v
./waf -j1 install
popd

rm -r ${TMP_DIR}


#!/bin/bash -e

PLUGIN=zam-plugins
GIT_URI="https://github.com/BlokasLabs/${PLUGIN}"
TMP_DIR=/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 --recursive ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-gcc
export STRIP=arm-linux-gnueabihf-strip

NOOPT=true HAVE_DGL=false make VERBOSE=1 -j4 V=1

cd /tmp/${PLUGIN}
/tmp/${PLUGIN}/dpf/utils/generate-ttl.sh

#make NOOPT=true HAVE_DGL=false install DESTDIR=${ROOTFS_DIR} PREFIX=/tmp/${PLUGIN} INSTALL_SYS_PLUGINS_DIR=${LV2_DIR} VERBOSE=1 V=1

PLUGINS_TO_INSTALL="ZamAutoSat.lv2 ZaMaximX2.lv2 ZamComp.lv2 ZamCompX2.lv2 ZamDelay.lv2 ZamEQ2.lv2 ZamGate.lv2 ZamGateX2.lv2 ZamGEQ31.lv2 ZamHeadX2.lv2 ZamTube.lv2 ZaMultiComp.lv2 ZaMultiCompX2.lv2"

for p in ${PLUGINS_TO_INSTALL}; do
	mv ${TMP_DIR}/bin/${p} ${LV2_DIR}/
done

popd

rm -r ${TMP_DIR}


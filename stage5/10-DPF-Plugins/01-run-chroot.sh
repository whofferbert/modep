#!/bin/bash -e

PLUGIN=DPF-plugins
GIT_URI="https://github.com/BlokasLabs/${PLUGIN}"
TMP_DIR=/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-gcc
export STRIP=arm-linux-gnueabihf-strip

NOOPT=true make VERBOSE=1 -j4
make NOOPT=true HAVE_DGL=false install PREFIX=/tmp/${PLUGIN} INSTALL_SYS_PLUGINS_DIR=${LV2_DIR}

PLUGINS_TO_INSTALL="Kars.lv2 PingPongPan.lv2 MVerb.lv2 Nekobi.lv2"

for p in ${PLUGINS_TO_INSTALL}; do
	mv ${TMP_DIR}/lib/lv2/${p} ${LV2_DIR}/
done

rm -rf /tmp/lib

popd

rm -rf ${TMP_DIR}


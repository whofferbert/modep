#!/bin/bash -e

PLUGIN=rkrlv2
GIT_URI="https://github.com/BlokasLabs/${PLUGIN}"
TMP_DIR=/tmp/${PLUGIN}

#unset PKG_CONFIG_DIR
#unset PKG_CONFIG_LIBDIR
#unset PKG_CONFIG_SYSROOT_DIR

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN} -DCMAKE_INSTALL_PREFIX=${TMP_DIR}/install -DBUILD_GUI=OFF -DBUILD_SSE=OFF

make -j4
make install

mv ${TMP_DIR}/install/lib/lv2/rkr.lv2 ${LV2_DIR}/rkr.lv2

popd

rm -rf ${TMP_DIR}


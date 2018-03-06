#!/bin/bash -e

PLUGIN=rkrlv2
GIT_URI="https://github.com/BlokasLabs/${PLUGIN}"
TMP_DIR=/tmp/${PLUGIN}

#unset PKG_CONFIG_DIR
#unset PKG_CONFIG_LIBDIR
#unset PKG_CONFIG_SYSROOT_DIR

CMAKE_TOOLCHAIN=$(mktemp /tmp/cmake.toolchain.XXXXXXX)
cat << EOT > $CMAKE_TOOLCHAIN
    SET(CMAKE_SYSTEM_NAME Linux)
    SET(CMAKE_SYSTEM_VERSION 1)

    SET(CMAKE_C_COMPILER   /usr/bin/arm-linux-gnueabihf-gcc)
    SET(CMAKE_CXX_COMPILER /usr/bin/arm-linux-gnueabihf-g++)

    SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
EOT
export CMAKE_TOOLCHAIN

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


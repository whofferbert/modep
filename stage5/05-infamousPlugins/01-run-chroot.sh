#!/bin/bash -e

PLUGIN=infamousPlugins
GIT_URI="https://github.com/BlokasLabs/${PLUGIN} -b gui"
TMP_DIR=/tmp/${PLUGIN}

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
cmake .. -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN} -DCMAKE_INSTALL_PREFIX=${TMP_DIR}/install

make VERBOSE=1 -j4
make install

PLUGINS_TO_INSTALL="ewham.lv2 powercut.lv2 hip2b.lv2 stuck.lv2"

for p in ${PLUGINS_TO_INSTALL}; do
	mv ${TMP_DIR}/install/lib/lv2/${p} ${LV2_DIR}/
done

popd

rm -rf ${TMP_DIR}


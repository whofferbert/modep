#!/bin/bash -e

PLUGIN=tap-lv2
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}

pushd ${TMP_DIR}

sed -e "s/-Werror //g" -i Makefile.mk
make NOOPT=true -j4 -C ${TMP_DIR}

make install INSTALL_PATH=${LV2_DIR}

popd

rm -r ${TMP_DIR}


#!/bin/bash -e

echo "installing GxSlowGear plugin..."

PLUGIN=GxSlowGear.lv2
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=/tmp/${PLUGIN}

export NOOPT=true

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

make -j4

cd ${TMP_DIR}
make install INSTALL_DIR=${LV2_DIR}

popd

rm -r ${TMP_DIR}

echo "installing GxSwitchlessWah plugin.."
PLUGIN=GxSwitchlessWah.lv2
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}
make -j4

make install INSTALL_DIR=${LV2_DIR}

popd

rm -r ${TMP_DIR}


#!/bin/bash -e

PLUGIN=mda-lv2
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}
./waf configure --lv2dir=${LV2_DIR}
./waf build -j4
./waf -j1 install
popd

# Force copying of GUI from mod-lv2-data.
rm -r ${LV2_DIR}/mod-mda-Combo.lv2/modgui

rm -r ${TMP_DIR}


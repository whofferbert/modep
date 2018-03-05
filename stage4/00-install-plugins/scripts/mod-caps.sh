#!/bin/bash -e

PLUGIN=caps-lv2
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}

pushd ${TMP_DIR}

make -j4

make install LV2_DEST=${LV2_DIR}
rm -r ${LV2_DIR}/mod-caps-Eq4p.lv2 ${LV2_DIR}/mod-caps-EqFA4p.lv2

popd

rm -r ${TMP_DIR}


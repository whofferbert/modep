#!/bin/bash -e

PLUGIN=Freaked
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}

pushd ${TMP_DIR}

make NOOPT=true -j4
make install PREFIX=${LV2_DIR} SUFFIX=

# Remove modgui folders, so that mod-lv2-data gets copied over in a later step.
rm -rf $LV2_DIR/Freakclip.lv2/modgui
rm -rf $LV2_DIR/Granulator.lv2/modgui

popd

rm -r ${TMP_DIR}


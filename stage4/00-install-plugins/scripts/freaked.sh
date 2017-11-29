PLUGIN=Freaked
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}

pushd ${TMP_DIR}

make NOOPT=true -j4
make install PREFIX=${LV2_ABS_DIR} SUFFIX=

rm -rf $LV2_ABS_DIR/Freakclip.lv2
rm -rf $LV2_ABS_DIR/Granulator.lv2

popd

rm -r ${TMP_DIR}


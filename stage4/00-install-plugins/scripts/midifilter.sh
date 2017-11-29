PLUGIN=midifilter.lv2
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}

pushd ${TMP_DIR}

make MOD=y OPTIMIZATIONS="-ffast-math -fomit-frame-pointer -O3 -fno-finite-math-only" -j4
make MOD=y LV2DIR=${LV2_ABS_DIR} install

popd

rm -r ${TMP_DIR}


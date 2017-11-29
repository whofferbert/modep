PLUGIN=mod-utilities
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}

pushd ${TMP_DIR}

make -j4
make install INSTALL_PATH=${LV2_ABS_DIR}

popd
rm -r ${TMP_DIR}


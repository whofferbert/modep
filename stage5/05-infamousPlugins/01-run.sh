PLUGIN=infamousPlugins
GIT_URI="https://github.com/BlokasLabs/${PLUGIN} -b gui"
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

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
	mv ${TMP_DIR}/install/lib/lv2/${p} ${LV2_ABS_DIR}/
done

popd

rm -rf ${TMP_DIR}


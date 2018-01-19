PLUGIN=guitarix
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-ld
export STRIP=arm-linux-gnueabihf-strip

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}/trunk
./waf configure --lv2dir=${LV2_ABS_DIR} --lv2-only --no-lv2-gui --disable-sse --no-faust --cxxflags="--sysroot=${ROOTFS_DIR}" --ldflags="--sysroot=${ROOTFS_DIR}"
./waf build -j4 # -vvv
./waf -j1 install
popd

PLUGINS_WITHOUT_GUI="gx_aclipper.lv2 gx_alembic.lv2 gx_bmp.lv2 gx_bossds1.lv2 gx_mxrdist.lv2 gx_slowgear.lv2 gxtape.lv2 gxtape_st.lv2 gx_vibe.lv2 gx_w20.lv2 gxtuner.lv2"

for i in ${PLUGINS_WITHOUT_GUI}; do
	rm -r ${LV2_ABS_DIR}/$i
done

# Does not work.
rm -rf ${LV2_ABS_DIR}/gx_mbcompressor.lv2

# Remove modgui folders so that mod-lv2-data gets copied over.
rm -r ${LV2_ABS_DIR}/gxts9.lv2/modgui
rm -r ${LV2_ABS_DIR}/gxmetal_head.lv2/modgui
rm -r ${LV2_ABS_DIR}/gxmetal_amp.lv2/modgui

rm -r ${TMP_DIR}


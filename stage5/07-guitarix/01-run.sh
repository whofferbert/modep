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

rm -r ${TMP_DIR}


PLUGIN=setbfree
GIT_URI="https://github.com/BlokasLabs/${PLUGIN}"
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-gcc
export STRIP=arm-linux-gnueabihf-strip

export MOD=1
export DESTDIR=${ROOTFS_DIR}
export lv2dir=${LV2_DIR}
export OPTIMIZATIONS="-ffast-math -fomit-frame-pointer -O3 -fno-finite-math-only"

mkdir -p ${LV2_ABS_DIR}/b_whirl_xt
cp ${LV2_ABS_DIR}/b_whirl/b_whirl.so ${LV2_ABS_DIR}/b_whirl_xt/

make -j4
make install 

popd

rm -rf ${TMP_DIR}


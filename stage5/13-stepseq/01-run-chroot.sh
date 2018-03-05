#!/bin/bash -e

PLUGIN=stepseq.lv2
GIT_URI="https://github.com/BlokasLabs/${PLUGIN}"
TMP_DIR=/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-gcc
export STRIP=arm-linux-gnueabihf-strip

export OPTIMIZATIONS="-fno-finite-math-only"
export MOD=1
export LV2DIR=${LV2_DIR}

export N_STEPS=8
export N_NOTES=4
make -j4
make install 
make clean

export N_STEPS=8
export N_NOTES=8
make -j4
make install 
make clean

export N_STEPS=8
export N_NOTES=16
make -j4
make install
make clean

popd

rm -rf ${TMP_DIR}


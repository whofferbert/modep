#!/bin/bash -e

PLUGIN=triceratops.lv2
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=/tmp/${PLUGIN}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-ld
export STRIP=arm-linux-gnueabihf-strip

export CXXFLAGS="-fPIC"
export LDFLAGS="-fPIC"

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}
./waf configure --prefix=/usr/ --lv2dir=${LV2_DIR}
./waf build -j4 -v
./waf -j1 install
popd

rm -r ${TMP_DIR}


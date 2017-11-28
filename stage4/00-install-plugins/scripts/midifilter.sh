PLUGIN=midifilter.lv2
GIT_URI=https://github.com/x42/${PLUGIN}.git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
make MOD=y OPTIMIZATIONS="-ffast-math -fomit-frame-pointer -O3 -fno-finite-math-only" -j4 -C ${TMP_DIR}

on_chroot << EOF
	cd /tmp/${PLUGIN}
	make MOD=y install
EOF

rm -r ${TMP_DIR}


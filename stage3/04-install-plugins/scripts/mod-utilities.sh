PLUGIN=mod-utilities
GIT_URI=https://github.com/moddevices/${PLUGIN}.git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
make -j4 -C ${TMP_DIR}

on_chroot << EOF
	cd /tmp/${PLUGIN}
	make install
EOF

rm -r ${TMP_DIR}


PLUGIN=Freaked
GIT_URI=https://github.com/pjotrompet/${PLUGIN}.git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone --depth 1 ${GIT_URI} ${TMP_DIR}
make NOOPT=true -j4 -C ${TMP_DIR}

on_chroot << EOF
	cd /tmp/${PLUGIN}
	make install
EOF

rm -rf $LV2_DIR/Freakclip.lv2
rm -rf $LV2_DIR/Granulator.lv2

rm -r ${TMP_DIR}


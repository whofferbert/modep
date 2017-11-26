PLUGIN=caps-lv2
GIT_URI=https://github.com/BlokasLabs/${PLUGIN}.git
TMP_DIR=${ROOTFS_DIR}/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone ${GIT_URI} ${TMP_DIR}
make -j4 -C ${TMP_DIR}

on_chroot << EOF
	cd /tmp/${PLUGIN}
	make install
	rm -r /usr/local/lib/lv2/mod-caps-Eq4p.lv2 /usr/local/lib/lv2/mod-caps-EqFA4p.lv2
EOF

rm -r ${TMP_DIR}


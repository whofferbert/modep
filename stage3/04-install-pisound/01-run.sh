#!/bin/bash -e

rm -rf ${ROOTFS_DIR}/usr/local/modep/modep-btn-scripts
git clone https://github.com/BlokasLabs/modep-btn-scripts.git ${ROOTFS_DIR}/usr/local/modep/modep-btn-scripts

cp files/pisound.conf ${ROOTFS_DIR}/etc/
install -m 644 files/*.service ${ROOTFS_DIR}/usr/lib/systemd/system

on_chroot << EOF
	apt-get remove -y python-openssl # Improves 'import requests' load time
	systemctl daemon-reload
	systemctl enable pisound-hotspot
EOF


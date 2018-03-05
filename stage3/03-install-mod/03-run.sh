#!/bin/bash -e

# Set up startup for mod

mkdir -p ${ROOTFS_DIR}/usr/lib/systemd/system
install -m 644 files/*.service ${ROOTFS_DIR}/usr/lib/systemd/system

sed -i 's@\[placeholder\]@'"${LV2_DIR}"'@g' ${ROOTFS_DIR}/usr/lib/systemd/system/mod-host.service ${ROOTFS_DIR}/usr/lib/systemd/system/mod-ui.service

on_chroot << EOF
	systemctl daemon-reload
	systemctl enable jack
	systemctl enable mod-host
	systemctl enable mod-ui
EOF


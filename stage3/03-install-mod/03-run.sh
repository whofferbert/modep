# Set up startup for mod

mkdir -p ${ROOTFS_DIR}/usr/lib/systemd/system
install -m 644 files/*.service ${ROOTFS_DIR}/usr/lib/systemd/system

on_chroot << EOF
	systemctl daemon-reload
	systemctl enable jack
	systemctl enable mod-host
	systemctl enable mod-ui
EOF


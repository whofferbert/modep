# Set up startup for mod

echo HOHOHOHOAEOYAYH

mkdir -p ${ROOTFS_DIR}/usr/lib/systemd/system
install -m 644 files/*.service ${ROOTFS_DIR}/usr/lib/systemd/system

echo OPAAAAAAAAA

on_chroot << EOF
	systemctl daemon-reload
	systemctl enable jack
	systemctl enable mod-host
	systemctl enable mod-ui
EOF

echo OPAPAPAPAPAPA


# Fix up the custom phantomjs which gets overwritten by 01 step...

curl -o ${ROOTFS_DIR}/tmp/phantomjs_2.1.1_armhf.deb -sSL https://github.com/fg2it/phantomjs-on-raspberry/releases/download/v2.1.1-wheezy-jessie-armv6/phantomjs_2.1.1_armhf.deb

on_chroot << EOF
	dpkg -i /tmp/phantomjs_2.1.1_armhf.deb
EOF

rm ${ROOTFS_DIR}/tmp/phantomjs_2.1.1_armhf.deb


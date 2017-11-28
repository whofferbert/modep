git clone https://github.com/BlokasLabs/modep-btn-scripts.git ${ROOTFS_DIR}/usr/local/modep/modep-btn-scripts

cp files/pisound.conf ${ROOTFS_DIR}/etc/

on_chroot << EOF
	apt-get remove -y python-openssl # Improves 'import requests' load time
EOF


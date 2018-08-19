#!/bin/bash -e

rm -rf ${ROOTFS_DIR}/usr/local/modep/modep-btn-scripts
git clone https://github.com/BlokasLabs/modep-btn-scripts.git ${ROOTFS_DIR}/usr/local/modep/modep-btn-scripts

cp files/pisound.conf ${ROOTFS_DIR}/etc/
install -m 644 files/*.service ${ROOTFS_DIR}/usr/lib/systemd/system

on_chroot << EOF
	apt-get remove -y python-openssl # Improves 'import requests' load time
	systemctl daemon-reload
	systemctl enable pisound-hotspot
	systemctl enable cpu_performance_scaling_governor
	systemctl disable raspi-config # raspi-config is only enabling 'ondemand' governor as of 2018.08.19
EOF

rm -rf ${ROOTFS_DIR}/usr/local/pisound-ctl/modep
git clone https://github.com/BlokasLabs/modep-ctl-scripts.git ${ROOTFS_DIR}/usr/local/pisound-ctl/modep
echo echo system/system.yml > ${ROOTFS_DIR}/usr/local/pisound-ctl/category_list.sh
echo echo modep/modep.yml >> ${ROOTFS_DIR}/usr/local/pisound-ctl/category_list.sh

cp files/hostapd.conf ${ROOTFS_DIR}/usr/local/pisound/scripts/pisound-btn/hostapd.conf


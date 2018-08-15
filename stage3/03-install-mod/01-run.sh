#!/bin/bash -e

# Install mod-ui

MODEP_DIR=${ROOTFS_DIR}/usr/local/modep

mkdir -p ${MODEP_DIR}
rm -rf ${MODEP_DIR}/mod-ui
git clone https://github.com/BlokasLabs/mod-ui.git ${MODEP_DIR}/mod-ui

on_chroot << EOF
	cd /usr/local/modep/mod-ui/
	make -C utils -j4
	pip3 install -r requirements.txt
	python3 setup.py install --prefix=/usr
EOF


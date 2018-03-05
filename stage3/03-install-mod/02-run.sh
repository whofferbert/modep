#!/bin/bash -e

# Install mod-host

MODEP_DIR=${ROOTFS_DIR}/usr/local/modep

mkdir -p ${MODEP_DIR}
rm -rf ${MODEP_DIR}/mod-host
git clone https://github.com/BlokasLabs/mod-host.git ${MODEP_DIR}/mod-host

on_chroot << EOF
	cd /usr/local/modep/mod-host/
	make -j4
	make install
EOF


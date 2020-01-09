#!/bin/bash -e

#kernel_source="BlokasLabs"
kernel_source="whofferbert"

wget https://github.com/$kernel_source/rpi-kernel-rt/archive/${RT_KERNEL_VERSION}.tar.gz -O /tmp/${RT_KERNEL_VERSION}.tar.gz

# Remove regular kernel modules.
rm -r ${ROOTFS_DIR}/lib/modules/*

tar -xvf /tmp/${RT_KERNEL_VERSION}.tar.gz --strip 1 -C ${ROOTFS_DIR}/
rm /tmp/${RT_KERNEL_VERSION}.tar.gz


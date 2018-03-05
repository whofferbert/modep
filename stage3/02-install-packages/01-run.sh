#!/bin/bash -e

# Customizations for Jack.
echo @audio - memlock 256000 >> ${ROOTFS_DIR}/etc/security/limits.conf
echo @audio - rtprio 75 >> ${ROOTFS_DIR}/etc/security/limits.conf


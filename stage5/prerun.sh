#!/bin/bash -e

if [ ! -d "${ROOTFS_DIR}" ]; then
	copy_previous

	# Convert absolute symlinks to relative links, so links with absolute path don't
	# interfere with building plugins.

on_chroot << EOF
	symlinks -cr .
EOF

fi


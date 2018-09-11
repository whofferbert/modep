#!/bin/bash -e

# Enable ssh.
touch ${ROOTFS_DIR}/boot/ssh

# Set the new hostname.
CURRENT_HOSTNAME=`cat ${ROOTFS_DIR}/etc/hostname | tr -d " \t\n\r"`
echo $HOSTNAME > ${ROOTFS_DIR}/etc/hostname
sed -i 's/127.0.1.1.*'"$CURRENT_HOSTNAME"'/127.0.1.1\t'"$HOSTNAME"'/g' ${ROOTFS_DIR}/etc/hosts

sed -i 's/weekly/size 1M/g' ${ROOTFS_DIR}/etc/logrotate.d/rsyslog
sed -i 's/daily/size 1M/g' ${ROOTFS_DIR}/etc/logrotate.d/rsyslog

if [ -f ${ROOTFS_DIR}/etc/cron.daily/logrotate ]; then
	mv ${ROOTFS_DIR}/etc/cron.daily/logrotate ${ROOTFS_DIR}/etc/cron.hourly/
fi

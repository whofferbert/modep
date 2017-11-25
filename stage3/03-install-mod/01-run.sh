# Install mod-ui

MODEP_DIR=${ROOTFS_DIR}/usr/local/modep

mkdir -p ${MODEP_DIR}
git clone https://github.com/BlokasLabs/mod-ui.git ${MODEP_DIR}/mod-ui
curl -o ${ROOTFS_DIR}/tmp/phantomjs_2.1.1_armhf.deb -sSL https://github.com/fg2it/phantomjs-on-raspberry/releases/download/v2.1.1-wheezy-jessie-armv6/phantomjs_2.1.1_armhf.deb

on_chroot << EOF
	cd /usr/local/modep/mod-ui/
	make -C utils -j4
	pip3 install -r requirements.txt
	python3 setup.py install --prefix=/usr
	dpkg -i /tmp/phantomjs_2.1.1_armhf.deb
EOF

rm ${ROOTFS_DIR}/tmp/phantomjs_2.1.1_armhf.deb


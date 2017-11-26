echo "installing MOD CAPS suite.."

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-ld

scripts/mod-caps.sh
#echo
#echo "installing MOD MDA suite.."
#sudo chmod +x $MODEP_DIR/scripts/plugins/mod-mda.sh
#$MODEP_DIR/scripts/plugins/mod-mda.sh
#echo
#echo "installing MOD TAP suite.."
#sudo chmod +x $MODEP_DIR/scripts/plugins/mod-tap.sh
#$MODEP_DIR/scripts/plugins/mod-tap.sh
#echo
#echo "installing Midifilter suite.."
#sudo chmod +x $MODEP_DIR/scripts/plugins/midifilter.sh
#$MODEP_DIR/scripts/plugins/midifilter.sh
#echo
#echo "installing MOD Distortion suite.."
#sudo chmod +x $MODEP_DIR/scripts/plugins/mod-distortion.sh
#$MODEP_DIR/scripts/plugins/mod-distortion.sh	
#echo
#echo "installing MOD Utilities suite.."
#sudo chmod +x $MODEP_DIR/scripts/plugins/mod-utilities.sh
#$MODEP_DIR/scripts/plugins/mod-utilities.sh
#echo
#echo "installing Freaked suite.."
#sudo chmod +x $MODEP_DIR/scripts/plugins/freaked.sh
#$MODEP_DIR/scripts/plugins/freaked.sh
#echo
#echo "installing FluidPlug suite.."
#sudo chmod +x $MODEP_DIR/scripts/plugins/fluid.sh
#$MODEP_DIR/scripts/plugins/fluid.sh	
#echo "installing other plugins.."
#sudo chmod +x $MODEP_DIR/scripts/plugins/random-plugins.sh
#$MODEP_DIR/scripts/plugins/random-plugins.sh
#if [ -z "$1" ]; then
#	echo
#	read -n 1 -p "Press any key to continue.."
#fi


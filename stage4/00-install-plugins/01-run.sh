export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-ld
export STRIP=arm-linux-gnueabihf-strip

echo "installing MOD CAPS suite..."
scripts/mod-caps.sh

echo
echo "installing MOD MDA suite..."
scripts/mod-mda.sh

echo
echo "installing MOD TAP suite..."
scripts/mod-tap.sh

echo
echo "installing Midifilter suite..."
scripts/midifilter.sh

echo
echo "installing MOD Distortion suite..."
scripts/mod-distortion.sh

echo
echo "installing MOD Utilities suite..."
scripts/mod-utilities.sh

echo
echo "installing Freaked suite..."
scripts/freaked.sh

echo
echo "installing FluidPlug suite..."
scripts/fluid.sh	

echo
echo "installing other plugins..."
scripts/random-plugins.sh


#!/bin/sh
amidithru touchosc &
PORT_ID=$(/usr/local/bin/touchosc2midi list ports 2>&1 | grep touchosc | head -n 1 | egrep -o "\s+[0-9]+: " | egrep -o "[0-9]+")
/usr/local/bin/touchosc2midi --ip 172.24.1.1 --midi-in=$PORT_ID --midi-out=$PORT_ID


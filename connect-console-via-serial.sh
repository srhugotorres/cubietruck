#!/bin/bash
SCRIPT_DIR=${SCRIPT_DIR:-`pwd`}
. ${SCRIPT_DIR}/lib.sh

SERIAL_DEVICE=${SERIAL_DEVICE:-"/dev/ttyUSB0"} # Assuming Prolific PL2303 like chip

f_logINFO "Set write permission (temporary)"
sudo chmod 666 ${SERIAL_DEVICE}
ls -l ${SERIAL_DEVICE}

f_logINFO "Turning off output hardware flow control on ${SERIAL_DEVICE} - "
# https://github.com/linux-sunxi/sunxi-bsp
# See also http://www.tldp.org/HOWTO/Serial-HOWTO-4.html"

stty -F ${SERIAL_DEVICE} -crtscts

f_logINFO "Connecting to ${SERIAL_DEVICE} ... "
sudo cu -s 115200 -l ${SERIAL_DEVICE} 

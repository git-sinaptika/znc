#!/bin/sh
# ZNC entrypoint
# Only checks if config exist
# Else --makeconfig
# info@sinaptika.net

set -e

export TZ=${TZ}

if [ -e ${Z_DIR}/configs/znc.conf ]
then
	exec znc -f -d ${Z_DIR}
else
	exec znc -c -d ${Z_DIR}
fi

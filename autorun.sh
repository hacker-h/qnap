#!/bin/bash

#This script needs to be executed on a QNAP NAS to install itself

#full path to this bash script (autorun.sh)
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

#fix security vulnerabilities
rm -rf /usr/sbin/noip2
rm -rf /usr/sbin/noip2c

#add autorun if necessarry
grep autorun /etc/config/qpkg.conf > /dev/null || \
(
echo "

[autorun]
Name = autorun
Version = 1.0
QPKG_File = autorun.qpkg // Ohne diese Zeile wird das Script deaktiviert!
Shell = /share/CE_CACHEDEV1_DATA/.qpkg/autorun/autorun.sh // ggf. anpassen
Install_Path = /share/CE_CACHEDEV1_DATA/.qpkg/autorun // ggf. anpassen
Enable = TRUE
Official = 0
" >> /etc/config/qpkg.conf && \
rm -rf /share/CE_CACHEDEV1_DATA/.qpkg/autorun && \
mkdir -p /share/CE_CACHEDEV1_DATA/.qpkg/autorun && \
cp "${SCRIPTPATH}" /share/CE_CACHEDEV1_DATA/.qpkg/autorun/autorun.sh && \
chmod +x /share/CE_CACHEDEV1_DATA/.qpkg/autorun/autorun.sh
)

#!/bin/bash

#fix security vulnerabilities
rm -rf /usr/sbin/noip2
rm -rf /usr/sbin/noip2c

#ensure autorun script is executable
chmod +x /share/CE_CACHEDEV1_DATA/.qpkg/autorun/autorun.sh

#update dash profile
rm -f /root/.profile
cp /share/CE_CACHEDEV1_DATA/autorun/.profile /root/.profile

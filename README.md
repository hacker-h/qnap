# qnap NAS config

## .profile
`/root/.profile`

## /etc/config/autorun.sh aktivieren
https://wiki.qnap.com/wiki/Running_Your_Own_Application_at_Startup
Starting from QTS 4.3.3 it's required to enable the autorun.sh processing in the Control Panel -> Hardware -> General: Run user defined startup processes (autorun.sh)

`cat /etc/config/autorun.sh`
```
#!/bin/sh
/share/CE_CACHEDEV1_DATA/autorun/autorun.sh
```

## /share/CE_CACHEDEV1_DATA/autorun.sh
Executable defined in `autorun.sh`

## qpkg.conf
`/etc/config/qpkg.conf`

# qnap NAS config

## .profile
`/root/.profile`

## activate /etc/config/autorun.sh
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

## Entware Installation
https://github.com/Entware/Entware/wiki/Install-on-QNAP-NAS

## Git Installation
`opkg install git`

## strace Installation
`opkg install strace`



# Mount drives from a qnap NAS on ubuntu linux

### manually discover the logical volume of your qnap raid
```
sudo lvscan
```

### activate the logical volume
```
sudo lvchange -ay /dev/vg288/lv1
```

### validate that the logical volume is now ACTIVE
```
sudo lvscan | grep ACTIVE
```

### generate luks password from qnap encryption pass phrase
```
gcc qnap_encryption_convert.c -lcrypt

./a.out
```

### unlock the luks partition
```
sudo cryptsetup luksOpen /dev/vg288/lv1 cryptodisk
```

### mount the luks partition
```
sudo mount -r /dev/mapper/cryptodisk /mnt
```

### unmount the luks partition
```
sudo umount /dev/mapper/cryptodisk
```

### lock the luks partition
```
sudo cryptsetup close cryptodisk
```

# Versions
```
cryptsetup 2.0.2
gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
```

# References:
https://forum.qnap.com/viewtopic.php?t=133127

http://jonamiki.com/2015/05/17/mount-encrypted-qnap-disk-crypto_luks-on-an-external-computer/

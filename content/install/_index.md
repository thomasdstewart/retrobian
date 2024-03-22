---
title: "Install"
description: "Installation Notes and Instructions"
---
## Virtual Hardware
This was all created using QEMU with default hardware. The machine type used was the default on Debian testing/sid as of 5th May 2020:

```
$ qemu-system-i386 --machine help | grep def
pc-i440fx-4.2        Standard PC (i440FX + PIIX, 1996) (default)
```

## Disk layout
The machines have two IDE disks, the first is the OS disk and the second is a disk with a mirror of the repository. This is done to make the installation easier, eg the deb files are just on a local disk, so no messing about disk CD's or networking. The OS disk has one big partition for the root (/) dir. This is 1G in size except for 0.91 where it is smaller. The repo disk varies in size and is based on the size of the repo. Remember this is old, so IDE disks disks they appear as /dev/hda1 and /dev/hdb2.

## Virtual Network Card
The network card for all the machines is a ISA NE2000. The reason for this is that it's supported in QEMU and across all the versions of Debian. Being an ISA card, the io and irq ports needs to be given as parameters when the Linux Kernel module is loaded, these are: "irq=9 io=0x300".

## Networking and DHCP
Believe it on not, but a DHCP client didn't land until round 2.2. Thus all the machines are statically configured with the IP 192.168.122.10 which is in the default libvirt network of 192.168.122.0/24.

## Filesystems
To create an ext2 file system that is readable on old Linux (1.2) the main option that is needed is "-r 0" to set the file system revision to 0. However to create a file system that is most similar to the one created in Debian 0.93 use:
* mkfs.ext2 -b 1024 -r 0 -i 4096 -F \<device\>
* tune2fs -E hash_alg=legacy \<device\>

## Tricks with sfdisk
The sfdisk utility can be used to save and destroy partition tables. To save a partition run "sfdisk -d /dev/nbd". This can be restored in a shell script thus:

```
cat << EOF | sudo sfdisk /dev/nbd0
label: dos
label-id: 0x00000000
device: /dev/nbd0
unit: sectors

/dev/nbd0p1 : start=          63, size=     2064321, type=83
EOF
```

This can then define what ever layout that is needed.

## X11 Configuration
Over the years the method to configure X11 has changed and throughout it's been somewhat a dark art combined with a lot of trial and error. I have created a template XF86Config and individual XF86Config configuration files for each Debian release. They are avaliable here: https://gitlab.com/thomasdstewart/retrobian/-/tree/master/files

## Choosing X server
In the olden days there were multiple binaries for the X server, one for each type of graphics card. So there is a symbolic link (/etc/X/X11) pointing to the one to be used which by default is /usr/X11R6/bin/X_VGA16. This can be set or changed with:

```ln -s /usr/X11R6/bin/X_VGA16 /etc/X11/X```

## List of Random Websites that were usefull
 * https://www.ibiblio.org/pub/historic-linux/distributions/debian-1.1/i386/
 * https://archive.fosdem.org/2018/schedule/event/vai_qemu_jungle/attachments/slides/2539/export/events/attachments/vai_qemu_jungle/slides/2539/qemu_cli_jungle.pdf
 * https://web.archive.org/web/20160429214913/http://www.h7.dion.ne.jp/~qemu-win/HowToNetwork-en.html
 * http://archive.debian.org/debian/dists/Debian-1.1/
 * http://ftp.e.kth.se/pub/mpkg/distfiles/netscape/4.7/
 * https://fadeevab.com/how-to-setup-qemu-output-to-console-and-automate-using-shell-script/
 * https://serverfault.com/questions/471719/how-to-start-qemu-directly-in-the-console-not-in-curses-or-sdl
 * https://web.archive.org/web/20180104171638/http://nairobi-embedded.org/qemu_monitor_console.html
 * https://serverfault.com/questions/329287/free-up-not-used-space-on-a-qcow2-image-file-on-kvm-qemu
 * https://manpages.debian.org/buster/qemu-system-x86/qemu-system-i386.1.en.html

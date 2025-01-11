---
title: "Install"
description: "Installation Notes and Instructions"
featured_image: "/install/0.93-debian-login.png"
---
## Virtual Hardware
In the past I've used Bochs for trying old Debian releases however this entire project used Qemu. I used the default i386 hardware. The machine type used was the default on Debian testing/Sid as of 5th May 2020:

```
$ qemu-system-i386 --machine help | grep def
pc-i440fx-4.2        Standard PC (i440FX + PIIX, 1996) (default)
```

Update on 9th Jan 2025 on on Debian testing/Sid:
```
$ qemu-system-i386 --machine help | grep def
pc-i440fx-9.2        Standard PC (i440FX + PIIX, 1996) (default)
```

## Disk devices
This is old, and before the block device unification, so only real scsi devices appear are /dev/sda. I have used IDE disks throughout which appear as /dev/hda and /dev/hdb.

## Disk layout
The machines have two IDE disks, the first is the OS disk and the second is a disk with a mirror of the repository. This is done to make the installation easier, eg the deb files are just on a local disk, so no messing about with disk CD's or networking. The OS disk has one big partition for the root (/) dir. This is 1G in size except for ersion 0.91 where it is smaller. The repo disk varies in size and is based on the size of the repo.

## Virtual Network Card
The network card for all the machines is a ISA NE2000. The reason for this is that it's supported in QEMU and across all the versions of Linux that are in all the Debian releases. Being an ISA card, the io and irq ports needs to be given as parameters when the Linux Kernel module is loaded. There were ways the probe these but it's far easier to just hard code them these to the correct vaules by giving the module these parameters: "irq=9 io=0x300".

## Networking and DHCP
A DHCP client didn't land in Debian until 2.2. Thus to keep all the machines consistent all the machines are statically configured with the IP 192.168.122.10 which is in the default libvirt network of 192.168.122.0/24.

## Filesystems
To create an ext2 file system that is readable on old Linux (1.2) the main option that is needed for mkfs.ext2 is "-E revision=0" to set the file system revision to 0 (note that older versions of mkfs.ext used "-r 0" for this functionality). However to create a file system that is most similar to the one created in Debian 0.93 use:
```
# mkfs.ext2 -b 1024 -E revision=0 -i 4096 -F <device>
# tune2fs -E hash_alg=legacy <device>
```

## Tricks with sfdisk
The sfdisk utility can be used to save and destroy partition tables. To save a partition run "sfdisk -d <device>". This can be restored in a shell script thus:

```
cat << EOF | sudo sfdisk /dev/sda
label: dos
label-id: 0x00000000
device: /dev/sda
unit: sectors

/dev/sda1 : start=          63, size=     2064321, type=83
EOF
```

This can then define the required layout needed.

## X11 Configuration
Over the years the method to configure X11 has changed and throughout it's been somewhat a dark art combined with a lot of trial and error. I have created a template XF86Config and individual XF86Config configuration files for each Debian release. They are avaliable here: https://gitlab.com/thomasdstewart/retrobian/-/tree/master/files

## Choosing the X server
In the olden days there were multiple binaries for the X server, one for each type of graphics card. So there is a symbolic link (/etc/X/X11) pointing to the one to be used which by default is /usr/X11R6/bin/X_VGA16. This can be set or changed with:

```ln -s /usr/X11R6/bin/X_VGA16 /etc/X11/X```

## List of Random Websites that were usefull
 * https://www.ibiblio.org/pub/historic-linux/distributions/debian-1.1/i386/
 * https://archive.fosdem.org/2018/schedule/event/vai_qemu_jungle/attachments/slides/2539/export/events/attachments/vai_qemu_jungle/slides/2539/qemu_cli_jungle.pdf
 * https://web.archive.org/web/20160429214913/http://www.h7.dion.ne.jp/~qemu-win/HowToNetwork-en.html
 * http://archive.debian.org/debian/dists/buzz/
 * http://ftp.e.kth.se/pub/mpkg/distfiles/netscape/4.7/
 * https://fadeevab.com/how-to-setup-qemu-output-to-console-and-automate-using-shell-script/
 * https://serverfault.com/questions/471719/how-to-start-qemu-directly-in-the-console-not-in-curses-or-sdl
 * https://web.archive.org/web/20180104171638/http://nairobi-embedded.org/qemu_monitor_console.html
 * https://serverfault.com/questions/329287/free-up-not-used-space-on-a-qcow2-image-file-on-kvm-qemu
 * https://manpages.debian.org/buster/qemu-system-x86/qemu-system-i386.1.en.html

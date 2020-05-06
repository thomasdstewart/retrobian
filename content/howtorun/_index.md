---
title: "How to Run"
---
The concept is that all that is needed to run these Old Debian releases is in the retrobian repository: https://gitlab.com/thomasdstewart/retrobian.git. It contain this website, a helper shell script and some config fies.

The idea is that it's easy to create and install new virtual machines ready to install old versions of Debians. Alternativly one can run the existing virtual machines that I have created, either by streaming the disk images via http or downloading them.

I've only tested this on Debian, but it should work on other distributions. The disk images target QEMU hardware, so in order to work you need to have QEMU installed. That said probably any virtulisation software could probably be persuaded to work.

Given that DHCP clients are a new invention, all the machines have a statically configured IP of 192.168.122.10/24. If you install libvirt then usually a virbr0 bridge is created with this subnet. So you can either use these deftaults or configure your own networking.

Steps to run VM:
1. Install Qemu: "apt install qemu-system-gui qemu-system-x86 libvirt-clients libvirt-daemon"
1. Clone the repo: ```git clone https://gitlab.com/thomasdstewart/retrobian.git```
1. Enter the repo root dir: ```cd retrobian```
1. Run the helpter shell script: ```retrobian run <version>``` eg: ```retrobian run 0.93```
1. This will start a graphical virtual machine, it will access both the operating system disk and the repo disk via http. Once X has started you should be able to login alternativly you can telnet to 192.168.122.10.
1. You login with username:thomas and password:Password99.

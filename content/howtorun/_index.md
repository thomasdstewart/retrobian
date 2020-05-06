---
title: "How to Run"
---
I've only tested this on Debian, but it should work on other distributions too. The disk images target QEMU hardware, so in order to work you need to have QEMU installed. Given than DHCP clients didn't exist the machines networking is statically configured with an IP of 192.168.122.10/24. If you install libvirt then usually a virbr0 bridge is created with this subnet.

and Libvirt installed. In order to get networking working you need the default bridge with a subnet of 192.168.122.0/24.

Steps:
1. Install Qemu: "apt install qemu-system-gui qemu-system-x86 libvirt-clients libvirt-daemon"
1. Clone the repo: ```git clone https://gitlab.com/thomasdstewart/retrobian.git```
1. Enter the repo root dir: ```cd retrobian```
1. Run the helpter shell script: ```retrobian run 0.93```

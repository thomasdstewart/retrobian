---
title: "Run"
description: "Running Debian"
---
# Concept
The concept is that all that is needed to run these Old Debian releases is in the retrobian repository: https://gitlab.com/thomasdstewart/retrobian.git. It contain this website, a helper shell script and some config fies.

The idea is that it's easy to create and install new virtual machines ready to install old versions of Debians. Alternativly one can run the existing virtual machines that I have created, either by streaming the disk images via http or downloading them. These disk images are not stored in gitlab but on a random VPS of mine that may or may not dissapear. However by following the instructions it should be straight forward to reporoduce them.

# Details
I've only tested this on Debian, but it should work on any other Linux distribution. The disk images target QEMU hardware, so in order to work you need to have QEMU installed. That said probably any virtulisation software could be persuaded to work.

Given that DHCP clients are a new invention, all the machines have a statically configured IP of 192.168.122.10/24. If you install libvirt then usually a virbr0 bridge is created with this subnet. So you can either use these deftaults or configure your own networking.

# Steps to Run
(with my http hosted disk images):
1. Install Qemu: "apt install qemu-system-gui qemu-system-x86 libvirt-clients libvirt-daemon"
1. Clone the repo: "git clone https://gitlab.com/thomasdstewart/retrobian.git "
1. Enter the repo root dir: "cd retrobian"
1. Note that you are about to run some random persons shell script which in turns runs an entire x86 virtual machine that will be connected to the internet.
1. Run the helper shell script: "./retrobian run \<version\>" eg: "./retrobian run 0.93"
1. This will start a graphical virtual machine, it will access both the operating system disk and the repo disk via http. Once X has started you should be able to login alternativly you can telnet to 192.168.122.10.
1. You login with username:thomas and password:Password99.

# Steps to Install
1. Follow steps 1-4 from above
1. Run the helper shell script: "./retrobian genrepo \<version\>" eg: "./retrobian genrepo 1.1"
1. This will download a copy of the Debian repository and create a qemu disk image with these files in
1. Run the helper shell script: "./retrobian build \<version\>" eg: "./retrobian build 1.1"
1. This will start a graphical virtual machine with the right disks inserted to perform an installation. Just follow the steps in the Versions section from the menu above.


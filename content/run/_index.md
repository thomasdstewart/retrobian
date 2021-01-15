---
title: "Run"
description: "Running Debian"
---
# The Retrobian Concept
The concept is that all that is needed to try an old Debian release is in the retrobian repository: https://gitlab.com/thomasdstewart/retrobian.git. It contain this website, a helper shell script and some config fies. The idea is that with these tools there is enought information to make it easy to create and install new virtual machines ready to install old versions of Debians. Information on what type of viertial machine is required and intructions on how to install each version is given.

Alternativly it is possbile to run an existing virtual machine that I have created, either by streaming the disk images via http and using QEMU copy on wright functionality, or downloading the images directly. These disk images are not stored in gitlab but on a machine of mine that may or may not dissapear. However by following the instructions it should be straight forward to reporoduce them.

# Details
I have only tested these scripts on my Debian laptop, but it should work on any Linux distribution. The disk images target virtual QEMU hardware, so in order to work you need to have QEMU installed. That said probably any virtulisation software could be persuaded to work.

Given that DHCP clients are a new invention, all the machines have a statically configured IP of 192.168.122.10/24. If you install libvirt then usually a virbr0 bridge is created with this subnet. So you can either use these defaults or configure your own networking.

# Steps to Run my Images
1. Install QEMU
> ```apt install qemu-system-gui qemu-system-x86 libvirt-clients libvirt-daemon```

2. Clone the repo:
> ```git clone https://gitlab.com/thomasdstewart/retrobian.git```

3. Enter the repo root dir
> ```cd retrobian```

4. (Note that you are about to run some random persons shell script which in turns runs an entire x86 virtual machine that will be connected to the internet. What can go wrong...)

5. Run the helper shell script with the desired version
> ```./retrobian run 0.93```

6. This will start a graphical virtual machine. It will attach the operating system disk via http qcow if not fully downloaded. If downloaded it will create a qcow from the local disk also if present it will attach the repo disk.

7. Once X has started you should be able to login with username "thomas" and password "Password99" alternativly you can
> ```telnet 192.168.122.10```

# Steps to Install
1. Follow steps 1-4 from above

2. Run the helper shell script with the desired version to download a copy of the Debian repository and create a QEMU disk image with these files in
> ```./retrobian genrepo 1.1```

3. Run the helper shell script to start a graphical virtual machine with the right disks inserted to perform an installation. Just follow the steps in the [install]({{< relref "../install/_index.md" >}}) section.
> ```./retrobian build 1.1```

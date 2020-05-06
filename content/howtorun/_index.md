---
title: "How to Run"
---
I've only tested this on Debian, but it should work on other distros too. In order to work you need to have QEMU and Libvirt installed. In order to get networking working you need the default bridge with a subnet of 192.168.122.0/24.

Steps:
1. Clone the repo: ```git clone https://gitlab.com/thomasdstewart/retrobian.git```
1. Enter the repo root dir: ```cd retrobian```
1. Run the helpter shell script: ```retrobian run 0.93```

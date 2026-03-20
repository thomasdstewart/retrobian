#!/usr/bin/expect
set timeout -60
set capture 1
set n 1
spawn telnet localhost 3333
expect "(qemu)"
while { $n < 61 } {
    set pn [format %04s $n]
    send "screendump /tmp/shot-$pn.ppm\r";
    expect "(qemu)"
    incr n
    sleep 1
}

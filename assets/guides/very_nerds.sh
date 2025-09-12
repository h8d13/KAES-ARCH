#!/bin/bash
## remove sddm from boot
systemctl disable sddm
## this will drop you to a tty on next reboot
# login with your user (or root but thats hella not recommended)
# startplasma-wayland or systemctl start sddm
# you can also use chvt 1, 2, 3 etc to change tty's > or ctrl + alt + f1, f2, f3, etc 
#whenever you need graphical session and can set an alias for this & the same for stop

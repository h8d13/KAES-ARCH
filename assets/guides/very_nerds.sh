#!/bin/bash
## remove sddm from boot
systemctl disable sddm
## this will drop you to a tty on next reboot
# login with your user (or root but thats hella not recommended)
# startplasma-wayland or systemctl start sddm
#whenever you need graphical session and can set an alias for this & the same for stop

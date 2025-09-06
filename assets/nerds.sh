#!/bin/sh
## remove sddm from boot
systemctl disable sddm
## this will drop you to a tty on next reboot

systemctl start sddm 
#whenever you need graphical session and can set an alias for this =) 

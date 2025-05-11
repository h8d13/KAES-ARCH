# KAES-ARCH
Post Install for Arch KDE 

--- 

This assumes you have a working latest version KDE Arch install.

Can download the iso here: [ArchDownload](https://archlinux.org/download/)

> Use rufus or dd to flash. 

### Setup network 
> (Ethernet works out of the box)
> For wifi: `nmcli device wifi connect "SSID" password "password"`

> `ping google.com` for test 

Then `archinstall` (for noobs) make sure to go through all the steps: select KDE Plasma & Create a user with sudo
When prompted to chroot press no. 
Reboot **to hard disk.**  

---

```
pacman -Sy git
git clone https://github.com/h8d13/KAES-ARCH
cd KAES-ARCH/
```
Edit the targets: `user` and `kb` using editor of your choice.

```
TARGET_USER=hadean
KB_LAYOUT=us
VARIANT=""
```
> Variant is optional, can be left empty.
> This makes it so that you can apply this to individual profiles + root (with handling of permissions).

Make exec `chmod +x post` Then run: `./post`



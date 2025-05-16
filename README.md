# KAES-ARCH
Post Install for Arch KDE.
A single setup script from a default install.

--- 
Can download the iso here: [ArchDownload](https://archlinux.org/download/)

> Use rufus or dd to flash USB.

### Setup network 
> (Ethernet works out of the box)
> For wifi: `nmcli device wifi connect "SSID" password "password"`

> `ping google.com` for test 

Then `archinstall` (for noobs) make sure to go through all the steps: select KDE Plasma & Create a user with sudo

When prompted to chroot press no. 

Reboot **to hard disk.**  

---

```
sudo pacman -Sy git
git clone https://github.com/h8d13/KAES-ARCH
cd KAES-ARCH/
```
Edit the targets: `user` and `kb` using editor of your choice.

`sudo vim post`

```
TARGET_USER=hadean
KB_LAYOUT=us
VARIANT=""
```
> Variant is optional, can be left empty.
> This makes it so that you can apply this to individual profiles + root (with handling of permissions).
> Using vim you can use insert to edit, ESC to enter command made and !wq to write changes.

Make exec `sudo chmod +x post` Then run: `sudo ./post`

---

You can then use `topac` to edit your pacman repos. And more useful stuff...`comms` for commands :)

## The 4 shells

Basically sets up zsh and bash for both the user and root. 
And a lot of KDE stuff. 

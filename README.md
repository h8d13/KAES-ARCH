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

Then `archinstall` (for noobs, btw) make sure to go through all the steps: select KDE Plasma & Create a user with sudo, walk through every single step.
> IMPORTANT: Make sure to select mirrors, network manager, time zone, etc... Don't skip any. I also like Grub instead of systemd boot. Pipewire for audio as it's dep of KDE.

When prompted to chroot press no. 

Reboot **to hard disk.**  

> Login normally using the user you created. This will let KDE create all the files it needs.

---

Open Konsole.

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
> Using vim you can use insert to edit, ESC to enter command mode and !wq to write changes.

Make exec `sudo chmod +x post` Then run: `sudo ./post`

---

You can then use `topac` to edit your pacman repos. And more useful stuff...`comms` for commands :)

## The 4 shells

Basically sets up zsh and bash for both the user and root. 
And a lot of KDE stuff.

Install example video can be found here: [K2-ArchiNoob](https://cae-sura.com/archinoob)

![Screenshot_20250525_141656](https://github.com/user-attachments/assets/9dd36e50-1085-4369-bae8-22270fecfab7)

## Pacman GUI 

PacToPac can be found here: [PacToPac](https://github.com/h8d13/PacToPac)

## Further config

#### Tiling 
`System Settings` > `Window Management` > `Kwin` > `Get New` > `Krohnkite`

#### Or Bg blur
`System Settings` > `Wallpaper` > `Get New` > `Active Blur` 

## Sensors for temps

Install `mission-center` for overview
`pacman -S lm_sensors && sensors-detect`
`systemctl enable --now fancontrol`


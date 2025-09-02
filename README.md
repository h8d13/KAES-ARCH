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

Run `pacman -S archinstall`

Then `archinstall` (for noobs, btw) make sure to go through all the steps: Select KDE Plasma.

> IMPORTANT DO NOT SKIP ANU STEPS: Make sure to select mirrors, time zone, etc...
> Create a user with sudo (required for KDE/SDDM) 
> For formatting I usually use Ext4. 
> I also like Grub instead of systemd boot.
> Pipewire for audio as it's dep of KDE.
> Also use NetworkManager in network section.
> For gaphics drivers select appropriate to your hardware.
> Don't skip any step.

When prompted to chroot into new installation press no. Then type "poweroff" or "reboot" 

Reboot **to hard disk.** (Make sure to switch in BIOS, or you install again?)

> Login normally using the user you created. This will let KDE create all the files it needs.

---

Open Konsole.

```
sudo pacman -S git
git clone https://github.com/h8d13/KAES-ARCH
cd KAES-ARCH/
```
Edit the targets: `user` and `kb` using editor of your choice.

`sudo vim post`

```
TARGET_USER=johndoe
KB_LAYOUT=us
VARIANT=""
```
> Variant is optional, can be left empty.
> Using vim you can use insert to edit, ESC to enter command mode and !wq to write changes.

Make exec `sudo chmod +x post` Then run: `sudo ./post`

---

## More useful stuff...

Use `comms` for commands :)

To configure aliases: 
```
alias ecomms="vim ~/.config/aliases"
```

Modify what you need then source: . `~/.config/aliases` 
This should work both for bash and zsh. 

## The 4 shells

Basically sets up zsh and bash for both the user and root. 
And a lot of KDE stuff.

![Screenshot_20250525_141656](https://github.com/user-attachments/assets/9dd36e50-1085-4369-bae8-22270fecfab7)


## Pacman GUI 

PacToPac can be found here: [PacToPac](https://github.com/h8d13/PacToPac)

## Further config

#### Tiling 
`System Settings` > `Window Management` > `Kwin` > `Get New` > `Krohnkite`

#### Or Bg blur
`System Settings` > `Wallpaper` > `Get New` > `Active Blur` 


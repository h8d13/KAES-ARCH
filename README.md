# KAES-ARCH
Post Install for Arch KDE.
A single setup script from a default install.

--- 
Can download the iso here: [ArchDownload](https://archlinux.org/download/)

> Use [rufus](https://rufus.ie/en/) or dd to flash USB. Use GPT/MBR appropriate to hardware. 

Boot off the USB with DEL or f10 or f12 to get to BIOS.

### Setup network 
> (Ethernet works out of the box)
> For wifi: `nmcli device wifi connect "SSID" password "password"`

> `ping google.com` for test 

Run `pacman-key --init && pacman -Sy archinstall` then `y`.

Then `archinstall` (for noobs, btw) make sure to go through all the steps:

> ! IMPORTANT DO NOT SKIP ANY STEPS: Make sure to select mirrors, time zone, etc... etc!

- Create a user with sudo (required for KDE/SDDM)
- For formatting I usually use Ext4. (Or btrfs with snapper) 
- I also like Grub instead of systemd boot.
- Pipewire for audio as it's dep of KDE.
- Also use NetworkManager in network section.
- Kernels: try linux-zen for gaming !
- For gaphics drivers select appropriate to your hardware.
- Type Desktop/Plasma
- Personal preferences for reference. Use your prefered set-up.

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

`sudo vim post` or `sudo nano post`

```
# Theme: light or dark
DTHEME=dark
KB_LAYOUT=us
VARIANT=""
MANUAL_USER=""
```
> Variant is optional, can be left empty. And so is manual_user (if you wish to use it on another profile?)
> Applies for the current sudo user by default.

> Using vim you can use insert to edit, ESC to enter command mode and :wq to write changes.
> You can also go through some of the rest of the code as there might be some programs you want to add/remove.

Make exec `sudo chmod +x post` Then run: `sudo ./post`

You are done !

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

<img width="1015" height="175" alt="image" src="https://github.com/user-attachments/assets/0912aa56-5799-48fb-9a78-45527bcaf9c4" />

## New context menus!

<img width="362" height="422" alt="image" src="https://github.com/user-attachments/assets/3937feab-91b9-48a8-af6a-6417b3985a42" />

<img width="611" height="474" alt="image" src="https://github.com/user-attachments/assets/e259ed41-50b8-4eaf-ae3a-7a5e2356dc78" />

## Pacman GUI 

PacToPac can be found here: [PacToPac](https://github.com/h8d13/PacToPac)

## Further config

#### Tiling 
`System Settings` > `Window Management` > `Kwin` > `Get New` > `Krohnkite`

#### Or Bg blur
`System Settings` > `Wallpaper` > `Get New` > `Active Blur` 

## Preview 

![Screenshot_20250525_141656](https://github.com/user-attachments/assets/9dd36e50-1085-4369-bae8-22270fecfab7)

### More info:
- ISO size: 1,4 GB
- Total download size avg: 5GB Space on disk: ~8,5GB
- With decent internet total install time should be around 20-30 minutes. 

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

<img width="669" height="682" alt="Screenshot_20250909_135016" src="https://github.com/user-attachments/assets/807f9d22-1490-40d3-a366-f69bda5d7081" />

You should see this neat menu ^^ 

> ! IMPORTANT DO NOT SKIP ANY STEPS: Make sure to select mirrors, time zone, etc... etc!
- Keymap select your own.
- Locales: Use `en_GB.UTF-8` for European format, `en_US.UTF-8` for PM/AM.
- Locale encoding can be left as `UTF-8` if not using some special alphabets.

- Mirrors: Select a region where download speed will be fast.
  
- For formatting: Use-best effort (This WILL wipe data on this disk)
> I usually use Ext4. (With seperate home partition)

- Swap zram: Enabled (Creates a 4GB in case of memory need)
- Bootloader: Grub

- Hostname: lowercase and descriptive
- Authentification: Strong root password 
> Create a user with sudo (required for KDE/SDDM)
> Make the password strong and different from root ideally.

- Profile: Type Desktop/Plasma
  - Graphics drivers: select appropriate to your hardware.
  - Greeter: sddm

- Applications: Pipewire for audio as it's dep of KDE + Bluetooth set-up if needed. 
- Kernels: try linux-zen for gaming ! You can even install mutiple and they should show up in your Grub entries.
- Network Configuration: NetworkManager for GUI access.

- Timezone: Select your region in list.
- NTP: Enabled

> Personal preferences for reference. Use your prefered set-ups. Only real dependancy is Sddm and KDE-Plasma. 

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
DTHEME=dark
KB_LAYOUT=us
VARIANT=""
```
> Variant is optional, can be left empty.
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

Pac2Pac can be found here: [PacToPac](https://github.com/h8d13/PacToPac)

The idea was having a settings section > common operations you do on an arch system to do anything... Flatpak, multi-lib, etc 

## Further config

#### Tiling 
`System Settings` > `Window Management` > `Kwin` > `Get New` > `Krohnkite`

#### Or Bg blur
`System Settings` > `Wallpaper` > `Get New` > `Active Blur` 

## Preview 

![Screenshot_20250525_141656](https://github.com/user-attachments/assets/9dd36e50-1085-4369-bae8-22270fecfab7)

### More info:
- Arch ISO size: 1,4 GB
- Total download size avg: 5-6GB Space used on disk: 8,4GB
- With Steam/Firefox:(700mb download) Space used on disk: 9,6 GB

- With decent internet total install time should be around 20-30 minutes. With good internet less then 15 minutes. 


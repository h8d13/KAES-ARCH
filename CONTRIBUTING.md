# Contribs

## Get started helping out !

Create a testing user on your existing KDE install. Make sure you have logged-in once at least normally (this first loading screen is slightly longer because it creates all the files for the user). From this we can learn anything on a system is CRUD. So we can reverse engineer it quite easily if we understand it's origin, and how interaction update these values.

`$ sudo pacman -S inotify-tools`

Common locations of important things:

```
/usr/share
/var/lib
/.local
/.config
```

Then use this:

```
CONFIG_DIR="$HOME/.config"

echo "Watching $CONFIG_DIR for changes..."

inotifywait -m -r -e modify,create,delete,move "$CONFIG_DIR" \
  --format '%T %e %w%f' --timefmt '%F %T' |
while read -r line; do
  echo "$line"
done
```

While it's running I go to settings page or wherever in KDE that I want, and watch which files got modified/created/deleted. The `-r` sets it to be recursive.

I then create a dump of the file before edit and after. 

Example output:
```
2025-04-22 00:46:30 CREATE /home/harch/.config/ksmserverrc.lock
2025-04-22 00:46:30 MODIFY /home/harch/.config/ksmserverrc.lock
2025-04-22 00:46:30 MODIFY /home/harch/.config/#3179144
2025-04-22 00:46:30 CREATE /home/harch/.config/ksmserverrc.mrSOsU
2025-04-22 00:46:30 MOVED_FROM /home/harch/.config/ksmserverrc.mrSOsU
/home/harch/.config/ksmserverrc
[General]
loginMode=emptySession

MOVED_TO /home/harch/.config/kglobalshortcutsrc

cat /home/harch/.config/kscreenlockerrc
[Daemon]
Timeout=10

2025-04-22 00:46:30 DELETE /home/harch/.config/ksmserverrc.lock
2025-04-22 00:46:57 CREATE /home/harch/.config/ksmserverrc.lock
2025-04-22 00:46:57 MODIFY /home/harch/.config/ksmserverrc.lock
2025-04-22 00:46:57 MODIFY /home/harch/.config/#3179143
2025-04-22 00:46:57 CREATE /home/harch/.config/ksmserverrc.wIqinP
2025-04-22 00:46:57 MOVED_FROM /home/harch/.config/ksmserverrc.wIqinP
2025-04-22 00:46:57 MOVED_TO /home/harch/.config/ksmserverrc
2025-04-22 00:46:57 DELETE /home/harch/.config/ksmserverrc.lock
```

Then we can create a simple test script. For this I use qemu with a rollback mechanism (basically just a fresh install of ArchKDE that I test on). But essentially this helps me not look for things on forums instead I can directly see what is happening under the hood.

## Some useful things

KDE has neat built-in stuff for programmers: `kbuildsycoca6` rebuild system cached files .

```
kwriteconfig6 --file plasma-org.kde.plasma.desktop-appletsrc \
    --group "Containments" --group "2" --group "Applets" --group "5" --group "Configuration" --group "General" \
    --key "launchers" "applications:org.kde.konsole.desktop"
``` 
They can be a bit inconsistent sometimes. Perhaps of my wrong usage.

## Special thanks

[ArchInstallDevs](https://github.com/archlinux/archinstall/) 
> They are especially responsive even even with the most random of small bugs in their install menu which basically creates a system of thin air. Big props to them!

[KDE-plasmaDevs](https://kde.org/)

[This Github Repo](https://github.com/shalva97/kde-configuration-files) 


### Why?

I've been called lasy. But my idea was more that, I'd like to be able to get a new mini-pc under the TV and not have to do 100 things manually, instead be able to install from my couch over a bluetooth keyboard and that in less than 15 minutes. A lot of dev work is hidden under toggles, settings files, etc... Here I can gather best practices as one unified script.

### Downsides

Being downstream from most things and interaction with system files as so can be a bit tricky. Has to be correct and accurate with some edge cases handled. Also thoroughly test from scratch, no cutting corners.  

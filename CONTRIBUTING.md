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

killall plasmashell; plasmashell & disown
``` 

## Special thanks

[This Github Repo](https://github.com/shalva97/kde-configuration-files) 


## Current Scope

- KDE Default values I didn't like: Empty sessions, Lock-out grace, Powerprofiles
- KDE Dolphin interaction menus
- Keymaps SDDM & KDE
- SDDM Auto-change theme
- Sysctl & UFW
- Bash/Zsh: Aliases & look-feel
- Pacman GUI

### Why?

I've been called lasy. But my idea was more that, I'd like to be able to get a new mini-pc under the TV and not have to do 100 things manually, instead be able to install from my couch over a bluetooth keyboard and that in less than 15 minutes. A lot of developement work is hidden under toggles, settings files, etc... Heere I can gather best practices as one unified script.

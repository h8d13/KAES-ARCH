# Contribs

## Get started helping out !

Create a testing user on your existing KDE install. 

`$ sudo pacman -S inotify-tools`

Common locations of important things:

```
/usr/share
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

While it's running I go to settings page or wherever in KDE that I want, and watch which files got modified/created/deleted. 

Then we can create a simple test script. For this I use qemu with a rollback mechanism (basically just a fresh install of ArchKDE that I test on). 

## Some useful things

KDE has neat built-in stuff for programmers too: `kbuildsycoca6` rebuild system cached files .

```
kwriteconfig6 --file plasma-org.kde.plasma.desktop-appletsrc \
    --group "Containments" --group "2" --group "Applets" --group "5" --group "Configuration" --group "General" \
    --key "launchers" "applications:org.kde.konsole.desktop"

killall plasmashell; plasmashell &
``` 


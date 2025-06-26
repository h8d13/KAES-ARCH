#!/bin/sh
# sudo pacman -s pacman-contrib

while true; do
    # checkupdates syncs to a temp db without requiring root
    updates=$(checkupdates)
    if [ -n "$updates" ]; then
        count=$(echo "$updates" | wc -l)
        notify-send "System Updates" "Available: $count packages can be upgraded."
    else
        notify-send "System Updates" "System is up to date."
    fi
    sleep 1800
done

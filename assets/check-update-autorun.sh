#!/bin/sh
while true; do
    updates=$(pacman -Qu)
    if [ -n "$updates" ]; then
        count=$(echo "$updates" | wc -l)
        notify-send "System Updates Available: $count can be upgraded."
    else
        notify-send "No updates yet, check in 30."
    fi
    sleep 1800  
done

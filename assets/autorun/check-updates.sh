#!/bin/sh
# update-checker-installer.sh - Run once to set notifications up for KDE. 
CHECK_INTERVAL=7200 # 2H default #86400 for 24h #1800 for 30 mins

SCRIPT_DIR="$HOME/.local/bin"
AUTOSTART_DIR="$HOME/.config/autostart"
SCRIPT_NAME="update-checker"

# Create directories
mkdir -p "$SCRIPT_DIR" "$AUTOSTART_DIR"

# Create the main script
cat > "$SCRIPT_DIR/$SCRIPT_NAME" << EOF
#!/bin/sh
# Self-contained update checker

command_exists() { 
    command -v "\$1" >/dev/null 2>&1
}

send_notification() {
    if command_exists notify-send; then
        notify-send "\$1" "\$2"
    else
        echo "[\$1] \$2"
    fi
}

check_updates_safe() {
    tmpdir=\$(mktemp -d)
    trap "rm -rf \$tmpdir" EXIT
    
    if fakeroot pacman -Sy --dbpath "\$tmpdir" --logfile /dev/null >/dev/null 2>&1; then
        pacman -Qu --dbpath "\$tmpdir" 2>/dev/null
    fi
}

while true; do
    updates=\$(check_updates_safe)
    if [ -n "\$updates" ]; then
        count=\$(echo "\$updates" | wc -l)
        send_notification "Updates" "\$count packages available"
    else
        send_notification "Updates" "System up to date"
    fi
    sleep $CHECK_INTERVAL
done
EOF

# Make executable
chmod +x "$SCRIPT_DIR/$SCRIPT_NAME"

# Create desktop entry
cat > "$AUTOSTART_DIR/update-checker.desktop" << EOF
[Desktop Entry]
Type=Application
Exec=$SCRIPT_DIR/$SCRIPT_NAME
Hidden=false
NoDisplay=false
Name=Update Checker
Comment=Automatic update notifications
EOF

echo "Setup complete. Restart session or run: $SCRIPT_DIR/$SCRIPT_NAME &"

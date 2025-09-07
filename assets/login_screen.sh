#!/bin/bash

TARGET_USER=hadean

mkdir -p /var/lib/sddm/.config
cp -r "/home/$TARGET_USER/.config/kdeglobals"
/var/lib/sddm/.config/ 2>/dev/null || true
cp -r "/home/$TARGET_USER/.config/kdedefaults"
/var/lib/sddm/.config/ 2>/dev/null || true

# Set SDDM to use the plasma theme
cat > /etc/sddm.conf.d/kde_settings.conf << 'EOF'
[Theme]
Current=breeze
CursorTheme=breeze_cursors

[Users]
MaximumUid=60513
MinimumUid=1000
EOF

# Set proper ownership for SDDM configs
chown -R sddm:sddm /var/lib/sddm/.config

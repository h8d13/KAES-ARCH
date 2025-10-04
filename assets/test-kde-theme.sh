#!/bin/bash
# Standalone KDE theme configuration test script
# Usage: sudo ./test-kde-theme.sh [username] [theme]
# Example: sudo ./test-kde-theme.sh hadeaneon dark

TARGET_USER="${1:-$SUDO_USER}"
DTHEME="${2:-dark}"
D_WPP="Mountain/"

echo "[INFO] Testing KDE theme configuration"
echo "[INFO] Target user: $TARGET_USER"
echo "[INFO] Theme: $DTHEME"
echo "[INFO] Wallpaper dir: $D_WPP"
echo ""

# Setup runtime environment
USERID=$(id -u "$TARGET_USER")
RUNTIME_DIR="/run/user/$USERID"

# Create runtime dir if it doesn't exist
if [ ! -d "$RUNTIME_DIR" ]; then
    echo "[INFO] Creating runtime directory: $RUNTIME_DIR"
    mkdir -p "$RUNTIME_DIR"
    chown "$TARGET_USER:$TARGET_USER" "$RUNTIME_DIR"
    chmod 700 "$RUNTIME_DIR"
fi

# Apply theme based on DTHEME setting
sudo -u "$TARGET_USER" \
  XDG_RUNTIME_DIR="$RUNTIME_DIR" \
  DBUS_SESSION_BUS_ADDRESS="unix:path=$RUNTIME_DIR/bus" \
  bash << EOF
if [ "$DTHEME" = "light" ]; then
    WALLPAPER="/usr/share/wallpapers/$D_WPP/contents/images/5120x2880.png"
else
    plasma-apply-desktoptheme breeze-dark
    plasma-apply-colorscheme BreezeDark
    kwriteconfig6 --file kdeglobals --group "General" --key "ColorScheme" "BreezeDark"
    kwriteconfig6 --file kdeglobals --group "KDE" --key "LookAndFeelPackage" "org.kde.breezedark.desktop"
    WALLPAPER="/usr/share/wallpapers/$D_WPP/contents/images_dark/5120x2880.png"
fi
# Taskbar tweaks
kwriteconfig6 --file plasmashellrc --group "PlasmaViews" --group "Panel 2" --group "Defaults" --key "thickness" 40
kwriteconfig6 --file plasma-org.kde.plasma.desktop-appletsrc \
  --group "Containments" --group "2" --group "Applets" --group "5" --group "Configuration" --group "General" \
  --key "launchers" "applications:org.kde.konsole.desktop"
# Wallpaper
kwriteconfig6 --file plasma-org.kde.plasma.desktop-appletsrc \
  --group "Containments" --group "1" --group "Wallpaper" --group "org.kde.image" --group "General" \
  --key "Image" "\$WALLPAPER"
# Taskbar icon
kwriteconfig6 --file plasma-org.kde.plasma.desktop-appletsrc --group "Containments" --group "2" --group "Applets" \
  --group "3" --group "Configuration" --group "General" \
  --key "icon" "/usr/share/pixmaps/kaes-logo.png"
EOF

echo ""
echo "[INFO] Test complete. Check for any errors above."
echo "[INFO] If you see D-Bus errors, the user needs to be logged in for this to work."

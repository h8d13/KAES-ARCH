#!/bin/bash
# Simple user script to configure KDE theme
# Usage: ./test-kde-theme.sh [dark|light]

DTHEME="${1:-dark}"
D_WPP="Mountain/"

echo "[INFO] Configuring KDE theme: $DTHEME"
echo ""

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
  --key "Image" "$WALLPAPER"

# Taskbar icon
kwriteconfig6 --file plasma-org.kde.plasma.desktop-appletsrc --group "Containments" --group "2" --group "Applets" \
  --group "3" --group "Configuration" --group "General" \
  --key "icon" "/usr/share/pixmaps/kaes-logo.png"

echo ""
echo "[INFO] Configuration complete!"
echo "[INFO] Restart Plasma to see changes: kquitapp6 plasmashell && plasmashell &"

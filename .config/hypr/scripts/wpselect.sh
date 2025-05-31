##!/bin/bash

wallpaper=$1

# Extract the filename (e.g., mywallpaper.jpg)
wp=$(basename "$wallpaper")

# update hyperlock config
#hlock="$HOME/.config/hypr/hyprlock.conf"
#sed -i "s|^\([[:space:]]*\)path[[:space:]]*=[[:space:]]*.*|\1path = $wallpaper|" "$hlock"


# Send a desktop notification
#notify-send "Wallpaper Changed" "$wp"

# Generate matugen and pywal colors from the new wallpaper
wal -i $wallpaper -n
matugen image $wallpaper

# Update Spicetify colors (custom Spotify theme)
/bin/bash ~/.config/spicetify/update-colors.sh

# Update Firefox theme using pywalfox
pywalfox update

# Reload your waybar
#/bin/bash ~/.config/hypr/scripts/reloadbar.sh

# Reload swaync
/bin/bash reloadswaync

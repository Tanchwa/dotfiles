#!/bin/sh
set -euo pipefail

case "$1" in
        light)
        gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
        gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox-Light"
        gsettings set org.gnome.desktop.interface icon-theme "Gruvbox-Plus-Light"
        folders-color-chooser.sh --color=rust
        pkill -USR2 foot
        # if monitor is DP-1, set wallpaper to Alps.jpg
        if [[ "$(xrandr --query | grep -e '^DP-1 connected')" ]]; then
                swww img Pictures/Wallpapers/Dual_wide/Alps.jpg -o DP-1
        fi
        swww img Pictures/Wallpapers/gruvbox_light/anime_road.png -o eDP-1
        sed -i 's/initial-color-theme.*/initial-color-theme=light/' ~/.config/hypr/hyprland.conf
        ;;
        dark)
        gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
        gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox-Dark"
        gsettings set org.gnome.desktop.interface icon-theme "Gruvbox-Plus-Dark"
        folders-color-chooser.sh --color=highland
        pkill -USR1 foot
        # if monitor is DP-1, set wallpaper to city_lights.jpg
        if [[ "$(xrandr --query | grep -e '^DP-1 connected')" ]]; then
                swww img Pictures/Wallpapers/Dual_wide/city_lights.jpg -o DP-1
        fi
        swww img Pictures/Wallpapers/gruvbox_dark/wallhaven-2e2xyx.jpg -o eDP-1
        sed -i 's/initial-color-theme.*/initial-color-theme=dark/' .config/hypr/hyprland.conf
        ;;
        *)
        echo "Usage: ${0##*/} [--light|--dark]"
        exit 1
        ;;
esac

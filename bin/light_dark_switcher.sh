#!/bin/sh
set -euo pipefail

case "$1" in
        --light)
        gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
        gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox-Light"
        gsettings set org.gnome.desktop.interface icon-theme "Gruvbox-Plus-Light"
        folders-color-chooser.sh --color=rust
        swww img ~/Pictures/Wallpapers/gruvbox_light/gruvbox_1.gif
        ;;
        --dark)
        gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
        gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox-Dark"
        gsettings set org.gnome.desktop.interface icon-theme "Gruvbox-Plus-Dark"
        folders-color-chooser.sh --color=highland
        swww img ~/Pictures/Wallpapers/gruvbox_dark/wallhaven-2e2xyx.jpg
        ;;
        *)
        echo "Usage: ${0##*/} [--light|--dark]"
        exit 1
        ;;
esac

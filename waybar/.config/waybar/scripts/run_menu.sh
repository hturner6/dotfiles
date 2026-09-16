#!/usr/bin/env bash
# Replaces the waybar XML "custom/menu" popup: GtkMenu popups spawned via
# waybar's menu-file mechanism never inherit style.css (only the system
# GTK theme), so they can't be themed/rounded. rofi is already themed
# elsewhere in this setup, so route through it instead.

choice=$(printf '%s\n' \
    "Run" \
    "Reload configs" \
    "Neofetch" \
    "Update" \
    | rofi -dmenu -i -p "Menu")

case "$choice" in
    "Run")            rofi -show drun ;;
    "Reload configs") "$HOME/.config/waybar/scripts/reload.sh" ;;
    "Neofetch")        kitty --hold --detach -e neofetch ;;
    "Update")          kitty --hold -e sudo pacman -Syu ;;
    *)                 exit 0 ;;
esac

#!/usr/bin/env bash
# Screenshot menu: pick a capture mode, then edit/annotate in swappy.
# swappy saves to ~/Pictures/Screenshots and copies to the clipboard on demand.

mkdir -p "$HOME/Pictures/Screenshots"

choice=$(printf '%s\n' \
    "Region" \
    "Window" \
    "Full screen" \
    "Region (3s delay)" \
    | rofi -dmenu -i -p "Screenshot")

case "$choice" in
    "Region")            hyprshot -m region -z -s --raw | swappy -f - ;;
    "Window")            hyprshot -m window -s --raw | swappy -f - ;;
    "Full screen")       hyprshot -m output -s --raw | swappy -f - ;;
    "Region (3s delay)") sleep 3; hyprshot -m region -z -s --raw | swappy -f - ;;
    *)                   exit 0 ;;
esac

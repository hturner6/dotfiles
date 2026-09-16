#!/usr/bin/env bash
FOLDER=~/Pictures/wallpapers

set_wallpaper() {
    local IMAGE="$1"
    wallust pywal -i "$IMAGE"
    hyprctl hyprpaper preload "$IMAGE"
    hyprctl hyprpaper wallpaper "eDP-1,$IMAGE"
}

menu() {
    CHOICE=$(nsxiv -otb $FOLDER/*)
    case $CHOICE in
        *.*) set_wallpaper "$CHOICE" ;;
        *) exit 0 ;;
    esac
}

case "$#" in
    0) menu ;;
    1) set_wallpaper "$1" ;;
    2) wallust pywal -i "$1" -f "$2"
       hyprctl hyprpaper preload "$1"
       hyprctl hyprpaper wallpaper "eDP-1,$1" ;;
    *) exit 0 ;;
esac

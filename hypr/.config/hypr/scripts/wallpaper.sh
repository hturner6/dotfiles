#!/usr/bin/env bash
FOLDER=~/Pictures/wallpapers

set_wallpaper() {
    local IMAGE="$1"
    wal -i "$IMAGE" --contrast 2
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
    2) wal -i "$1" --theme $2 --contrast 2
       hyprctl hyprpaper preload "$1"
       hyprctl hyprpaper wallpaper "eDP-1,$1" ;;
    *) exit 0 ;;
esac

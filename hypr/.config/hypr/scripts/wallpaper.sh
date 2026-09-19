#!/usr/bin/env bash
FOLDER=~/Pictures/wallpapers
CACHE_DIR=~/.cache/wallpaper-hint
CAPTION="Super + Shift + /  —  show all shortcuts"

mkdir -p "$CACHE_DIR"

# Burns the shortcuts-cheat-sheet hint into a copy of the image so it's
# literally part of the wallpaper (top-center, faint) rather than a
# separate overlay window — reapplied fresh every time a wallpaper is set.
caption_wallpaper() {
    local IMAGE="$1"
    local OUT="$CACHE_DIR/$(basename "$IMAGE")"
    local HEIGHT
    HEIGHT=$(magick identify -format "%h" "$IMAGE")
    local SIZE=$((HEIGHT / 55))
    # Offset is generous (not just a few px) because hyprpaper center-crops
    # to the monitor's aspect ratio — a caption too close to the true top
    # edge gets cropped away whenever the wallpaper's aspect ratio doesn't
    # match the screen's.
    # No background box — a thin dark stroke around the letters keeps it
    # legible against bright/busy wallpapers instead.
    magick "$IMAGE" -gravity north -font "JetBrains-Mono-Bold" -pointsize "$SIZE" \
        -fill none -stroke '#00000090' -strokewidth 3 \
        -annotate +0+"$((HEIGHT / 12))" "$CAPTION" \
        -fill '#ffffff80' -stroke none \
        -annotate +0+"$((HEIGHT / 12))" "$CAPTION" \
        "$OUT"
    echo "$OUT"
}

set_wallpaper() {
    local IMAGE="$1"
    wallust pywal -i "$IMAGE"
    local CAPTIONED
    CAPTIONED=$(caption_wallpaper "$IMAGE")
    hyprctl hyprpaper preload "$CAPTIONED"
    hyprctl hyprpaper wallpaper "eDP-1,$CAPTIONED"
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
       CAPTIONED=$(caption_wallpaper "$1")
       hyprctl hyprpaper preload "$CAPTIONED"
       hyprctl hyprpaper wallpaper "eDP-1,$CAPTIONED" ;;
    *) exit 0 ;;
esac

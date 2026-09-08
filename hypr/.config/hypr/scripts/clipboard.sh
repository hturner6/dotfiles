#!/usr/bin/env bash
# Clipboard history picker (cliphist + rofi)
#   clipboard.sh          -> pick an entry, copy it back to the clipboard
#   clipboard.sh delete   -> pick an entry, remove it from history
#   clipboard.sh wipe     -> clear the whole history

case "$1" in
    delete)
        cliphist list | rofi -dmenu -p "Delete" | cliphist delete
        ;;
    wipe)
        cliphist wipe
        ;;
    *)
        cliphist list | rofi -dmenu -p "Clipboard" | cliphist decode | wl-copy
        ;;
esac

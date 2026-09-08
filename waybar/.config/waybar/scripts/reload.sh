#!/usr/bin/env bash
# Restart waybar. (`hyprctl dispatch exec` can't be used here — this Hyprland
# runs the Lua config backend and mis-parses it as Lua.)

pkill -x waybar
sleep 0.3
setsid -f waybar >/dev/null 2>&1

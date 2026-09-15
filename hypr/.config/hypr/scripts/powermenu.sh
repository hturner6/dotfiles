#!/usr/bin/env bash

# Rofi power menu — alternative to wlogout (Super+M), bound to Super+Shift+M.
# Actions mirror wlogout/.config/wlogout/layout.

declare -A options=(
    [Lock]="hyprlock"
    [Suspend]="systemctl suspend"
    [Hibernate]="systemctl hibernate"
    [Logout]="loginctl terminate-user $USER"
    [Reboot]="systemctl reboot"
    [Shutdown]="systemctl poweroff"
)

chosen=$(printf '%s\n' "${!options[@]}" | sort | rofi -dmenu -i -p "Power" \
    -theme-str '#inputbar { enabled: false; }' \
    -theme-str "#listview { lines: ${#options[@]}; }")

[[ -z "$chosen" ]] && exit 0

exec ${options["$chosen"]}

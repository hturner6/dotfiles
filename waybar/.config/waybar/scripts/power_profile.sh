#!/usr/bin/env bash
# Replaces waybar's built-in power-profiles-daemon module: that module has
# no concept of AC/charging state, so its icon could never turn green like
# #battery does. This reports the same info plus a "charging" class.

profile=$(powerprofilesctl get)

case "$profile" in
    performance) icon=$'\uf06d' ;;
    power-saver) icon=$'\uf06c' ;;
    *)           icon=$'\uf24e' ;;  # balanced
esac

class=""
if [ "$(cat /sys/class/power_supply/AC/online 2>/dev/null)" = "1" ]; then
    class="charging"
fi

printf '{"text":"%s","tooltip":"Power profile: %s","class":"%s"}\n' "$icon" "$profile" "$class"

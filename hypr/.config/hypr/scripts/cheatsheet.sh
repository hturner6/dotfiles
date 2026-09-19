#!/usr/bin/env bash

# Rofi cheat sheet of Hyprland keybinds, bound to Super+Shift+Slash.
# Parses keybinds.lua directly so the list can't drift out of sync.

keybinds="$HOME/.config/hypr/configs/keybinds.lua"

awk '
    /^hl\.bind\(/ {
        line = $0
        key = line
        sub(/^hl\.bind\(/, "", key)
        sub(/,.*/, "", key)
        gsub(/"/, "", key)
        gsub(/mainMod/, "SUPER", key)
        gsub(/ *\.\. */, " + ", key)
        gsub(/\+ +\+/, "+", key)

        desc = line
        sub(/^[^,]+,\s*/, "", desc)
        sub(/\)\s*(,\s*\{[^}]*\})?\s*$/, "", desc)

        # Humanize: pull just the quoted command/script (basename only) or
        # defaults.* name out of exec_cmd(...); drop dispatcher boilerplate
        # everywhere else.
        if (key == "SUPER + F") {
            desc = "window.fullscreen()"
        } else if (desc ~ /exec_cmd\(defaults\./) {
            cmd = desc
            sub(/^.*exec_cmd\(defaults\./, "", cmd)
            sub(/\).*$/, "", cmd)
            desc = cmd
        } else if (match(desc, /exec_cmd\((home \.\. )?"[^"]*"/)) {
            cmd = substr(desc, RSTART, RLENGTH)
            sub(/^exec_cmd\((home \.\. )?"/, "", cmd)
            sub(/"$/, "", cmd)
            sub(/^.*\//, "", cmd)   # basename only
            desc = cmd
        } else {
            sub(/^hl\.dsp\./, "", desc)
        }

        printf "%-24s %s\n", key, desc
    }
' "$keybinds" | rofi -dmenu -i -p "Keybinds" -theme-str '#inputbar { enabled: false; }' \
    -theme-str '#listview { lines: 15; }' -theme-str '#element { font: "monospace 10"; }' \
    -theme-str '#window { width: 900px; }' \
    -kb-row-down "j,Down" -kb-row-up "k,Up" \
    -kb-accept-entry "l,Return" -kb-cancel "h,Escape" \
    > /dev/null

# TODO

Backlog for the Arch + Hyprland setup. Grouped by app; every item carries a
priority, effort, and risk so "what next?" is answerable at a glance.

- **Priority** — P1 do next · P2 soon · P3 someday
- **Effort** — S ≤30 min · M ~an afternoon · L ~a weekend
- **Risk** — ⚠️ can break the session (login / display / audio / idle-lock); do these with time to recover

## Do next (P1)

1. Clipboard history — `cliphist` + `wl-clip-persist`, `Super+V` via rofi
2. Screenshot menu — `Print` → rofi picker → `hyprshot` → `swappy`
3. On-screen display — `swayosd` for volume/brightness feedback
4. `dots` alias — `git -C ~/dotfiles`
5. Fix the waybar media module — lock to Spotify (display + click + scroll)

---

## General

| Item | Priority | Effort | Risk | Status | Notes |
|---|---|---|---|---|---|
| Add dotfiles to git | — | — | | ✅ done | GNU stow, `github.com/hturner6/dotfiles` |
| `dots` alias for `git -C ~/dotfiles` | P1 | S | | todo | Frictionless config commits |
| `pkglist.txt` (`pacman -Qqe`) + `bootstrap.sh` | P2 | M | | todo | Installs stow + packages + stows everything; makes a dead SSD recoverable |
| Configure zsh | P3 | S | | todo | `zsh-autosuggestions` + `zsh-syntax-highlighting` + `fzf` keybindings + history dedup/size tuning |

## Theming (wallust epic)

Single cross-cutting piece of work. Migrate from pywal to **wallust** (maintained,
proper contrast thresholds) and drive colours from the wallpaper everywhere.

| Item | Priority | Effort | Risk | Status | Notes |
|---|---|---|---|---|---|
| Install wallust, port `wal` → `wallust` in scripts | P2 | M | | todo | Backend + contrast threshold so bar/menus stay legible |
| Template: waybar | P2 | M | | todo | Was "configure waybar colors" + "use different font colors" |
| Template: wlogout | P2 | S | | todo | Restyle only — functionality is fine |
| Template: rofi | P2 | S | | todo | Was "use pywal colors" |
| Restyle swaync panel + DND toggle | P3 | S | | todo | swaync = the notification daemon; works, just needs theme match |
| `hypr/colors.conf` fed by wallust | P2 | S | | todo | Was "define colors in hypr/config/colors.conf" |
| `wallpaper.sh` regenerates palette + reloads waybar/rofi/swaync/hypr | P2 | S | | todo | The "persist color schemes" item, done properly |

## Hypr

| Item | Priority | Effort | Risk | Status | Notes |
|---|---|---|---|---|---|
| Move tiles with hjkl | — | — | | ✅ done | |
| Toggle floating with Space | — | — | | ✅ done | |
| hyprpaper wallpaper | — | — | | ✅ done | |
| hyprpicker | — | — | | ✅ done | |
| hyprlock + fingerprint | — | — | | ✅ done | |
| hypridle | — | — | | ✅ done | |
| Workspace swipe animation | — | — | | ✅ done | |
| Fix audio buttons | — | — | | ✅ done | Fixed a while back, never ticked |
| Resize submap — `Super+R` then `hjkl`, `Esc` to exit | P2 | S | | todo | `Super+Shift+hjkl` is taken by move-window |
| Floating windows spawn centred | P2 | S | | todo | `windowrulev2 = center, floating:1` |
| hyprcursor setup | P2 | S | ⚠️ | todo | Cursor theme can misbehave across toolkits |
| Weather widget on lockscreen | P3 | S | | todo | Vanity; low stakes, low priority |
| Don't swipe "in" when moving a window to a workspace | P3 | S | | todo | Animation tweak |

## Waybar

| Item | Priority | Effort | Risk | Status | Notes |
|---|---|---|---|---|---|
| Base setup | — | — | | ✅ done | |
| Icons same colour | — | — | | ✅ done | |
| Fix media module | P1 | S | | todo | `on-click`/`on-scroll`/`exec` all lock to `--player spotify`; stops Firefox/VLC hijacking |
| Weather module | P3 | S | | todo | Replaces the cut lockscreen-weather idea |
| Different font colours | P2 | S | | todo | Falls out of the wallust template |
| Separate media-transport bar (play/pause, shuffle, loop) | P3 | M | | todo | Second waybar instance; nice-to-have toy — fn keys cover daily use |

## Rofi

| Item | Priority | Effort | Risk | Status | Notes |
|---|---|---|---|---|---|
| App launcher | — | — | | ✅ done | |
| Power menu launcher | P3 | S | | todo | Keeping wlogout on `Super+M`; only build this if wlogout annoys |
| Customise config (layout/behaviour beyond theme) | P3 | S | | todo | |

## Additions (new — from setup review)

| Item | Priority | Effort | Risk | Status | Notes |
|---|---|---|---|---|---|
| Clipboard history — `cliphist` + `wl-clip-persist`, `Super+V` rofi | P1 | S | | todo | No clipboard history today |
| Screenshot menu — `Print` → rofi (Region/Window/Full/Delayed) → `hyprshot` → `swappy`, save to `~/Pictures/Screenshots/` + clipboard | P1 | S | | todo | `hyprshot`/`grim`/`slurp` installed but unbound |
| On-screen display — `swayosd` | P1 | M | | todo | No visual feedback on fn keys |
| `power-profiles-daemon` + add to waybar module list | P2 | S | | todo | Module already configured; daemon not installed. T480 battery |
| `hyprpolkit-agent` + autostart | P2 | S | | todo | Nothing draws privilege prompts (USB mount in Thunar, GParted, gnome-disks fail silently) |
| Track `~/.vim_runtime/my_configs.vim` in the `vim` stow package | P2 | M | | todo | Leader maps, plugins, colours to match |
| Ranger JSON preview | P2 | S | | todo | `scope.sh` + `jq` |
| `xdg-desktop-portal-hyprland` | P3 | S | | todo | Only needed if screen-sharing (Discord/browser) |

---

## Cut

Recorded so they don't get re-added later.

| Item | Reason |
|---|---|
| Move entire workspace to another monitor | Single monitor; never using an external one (tablet handles TV) |
| Shutdown from lockscreen text input | Security surface; long-press power button already does a clean shutdown |
| jrnl configuration | Not journaling; revisit if that changes |
| Screensaver via hypridle | IPS panel — no burn-in risk; adds a moving part to the risky idle/lock chain |
| "Handle YouTube in Firefox" in media module | That's the hijacking bug reported, not a wanted feature — fixed by locking to Spotify |

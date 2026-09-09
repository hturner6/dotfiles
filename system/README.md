# system/

Machine-level units that can't be stow-linked into `$HOME` (they need root and
live under `/etc`). These are **reference copies** — installing them is manual.

## Install

    sudo cp system/<unit>.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable --now <unit>.service

## Units

| Unit | Purpose |
|------|---------|
| `battery-charge-end-threshold.service` | Caps both batteries at 80% charge (calendar-life). Stop service + write 100 to the sysfs nodes before travel. Re-run after an external-battery hot-swap. |
| `bluetooth-unblock.service` | Runs `rfkill unblock bluetooth` at boot; the ThinkPad hardware switch otherwise soft-blocks BT on every boot. |

See `~/Documents/Todos/thinkpad-t480-upgrades.md` for context.

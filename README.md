# dotfiles

Arch Linux + Hyprland (Wayland) config, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level directory is a stow package mirroring `$HOME`:

    dotfiles/hypr/.config/hypr/...  ->  ~/.config/hypr/...

## Usage

    sudo pacman -S stow
    git clone https://github.com/hturner6/dotfiles ~/dotfiles
    cd ~/dotfiles
    stow hypr waybar rofi wlogout swaync wal alacritty kitty dunst ranger jrnl zsh bash vim
    stow --no-folding easyeffects

Remove a package's symlinks with `stow -D <pkg>`; refresh after adding files with `stow -R <pkg>`.

## Packages

| Package   | Target |
|-----------|--------|
| hypr      | `~/.config/hypr` |
| waybar    | `~/.config/waybar` |
| rofi      | `~/.config/rofi` |
| wlogout   | `~/.config/wlogout` |
| swaync    | `~/.config/swaync` |
| wal       | `~/.config/wal` (pywal templates + colorschemes) |
| alacritty | `~/.config/alacritty` |
| kitty     | `~/.config/kitty` |
| dunst     | `~/.config/dunst` |
| ranger    | `~/.config/ranger` |
| jrnl      | `~/.config/jrnl/jrnl.yaml` (config only) |
| zsh       | `~/.zshrc` |
| bash      | `~/.bashrc` |
| vim       | `~/.vimrc` |
| easyeffects | `~/.config/autostart/`, `~/.config/easyeffects/`, `~/.local/share/easyeffects/output/` — audio DSP for the laptop speakers (`t480-speakers` preset). Needs `stow --no-folding` since the target dirs hold non-stow files. |

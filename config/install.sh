#!/usr/bin/env bash
set -e

sudo pacman -S --needed --noconfirm hyprland hyprpaper alacritty nvim wl-clipboard ttf-jetbrains-mono-nerd inter-font

mv ~/dotfiles/config/hypr ~/.config
mv ~/dotfiles/config/.bashrc ~/
source ~/.bashrc

echo "Process finished"


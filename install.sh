#!/usr/bin/env bash
set -e

sudo pacman -S --needed --noconfirm \
    hyprland \
    hyprpaper \
    alacritty \
    neovim \
    wl-clipboard \
    ttf-jetbrains-mono-nerd \
    inter-font \

if ! command -v yay &> /dev/null; then
    echo "Installing yay..."

    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
fi

echo "Installing Google Chrome..."
yay -S --needed --noconfirm google-chrome

mkdir -p ~/.config

cp -r ~/dotfiles/config/hypr ~/.config/
cp ~/dotfiles/config/.bashrc ~/.bashrc
source ~/.bashrc

echo "Process finished"

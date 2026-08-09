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
    glib2 \

if ! command -v yay &> /dev/null; then
    echo "Installing yay..."

    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (
        cd /tmp/yay
        makepkg -si --noconfirm
    )
    rm -rf /tmp/yay
fi

echo "Installing Google Chrome..."
yay -S --needed --noconfirm google-chrome

mkdir -p ~/.config
mkdir -p ~/.local/share/themes
mkdir -p ~/.local/share/icons

cp -r ~/dotfiles/config/hypr ~/.config/
cp -r ~/dotfiles/config/alacritty ~/.config/
cp -r ~/dotfiles/config/nvim ~/.config/
cp ~/dotfiles/config/.bashrc ~/.bashrc
cp -r ~/dotfiles/config/Colloid-Dark ~/.local/share/themes/
cp -r ~/dotfiles/config/Papirus-Dark ~/.local/share/icons/

gsettings set org.gnome.desktop.interface gtk-theme "Colloid-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

echo "Process finished"

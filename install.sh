#!/usr/bin/env bash
set -e

# dotfiles repo is wherever this script itself lives (you already cloned it
# to get this file, so no need to clone it again)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- base tools needed before anything else (git assumed already present) --
sudo pacman -S --needed --noconfirm \
    base-devel \
    curl \
    hyprland \
    hyprpaper \
    alacritty \
    neovim \
    wl-clipboard \
    ttf-jetbrains-mono-nerd \
    inter-font \
    glib2 \
    dconf \
    sddm

sudo systemctl enable sddm

# --- yay (AUR helper) --------------------------------------------------
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

# --- directories ---------------------------------------------------------
mkdir -p ~/.config
mkdir -p ~/.local/share/themes
mkdir -p ~/.local/share/icons
sudo mkdir -p /usr/share/sddm/themes/
sudo mkdir -p /etc/sddm.conf.d
printf '[Theme]\nCurrent=sddm-theme\n' | sudo tee /etc/sddm.conf.d/theme.conf

# --- copy configs from dotfiles ------------------------------------------
cp -r "$DOTFILES_DIR/config/hypr" ~/.config/
cp -r "$DOTFILES_DIR/config/alacritty" ~/.config/
cp -r "$DOTFILES_DIR/config/nvim" ~/.config/
cp "$DOTFILES_DIR/config/.bashrc" ~/.bashrc
cp -r "$DOTFILES_DIR/config/Colloid-Dark" ~/.local/share/themes/
cp -r "$DOTFILES_DIR/config/Papirus-Dark" ~/.local/share/icons/
sudo cp -r "$DOTFILES_DIR/config/sddm-theme" /usr/share/sddm/themes/

# --- gtk theming (dconf now installed, so gsettings works) ---------------
gsettings set org.gnome.desktop.interface gtk-theme "Colloid-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

echo "Process finished"

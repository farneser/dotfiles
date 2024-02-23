#!/bin/bash

base_packages=( 
curl 
grim 
gvfs 
gvfs-mtp
imagemagick 
jq
kitty
kvantum
nano  
neovim
network-manager-applet 
pamixer 
pavucontrol
pipewire-alsa 
playerctl
polkit-gnome
python-requests
python-pywal 
qt5ct
qt6ct
qt6-svg
rofi-lbonn-wayland-git 
slurp 
swappy 
swayidle 
swaync 
swww 
waybar
python-pydbus
python-psutil
wget
wl-clipboard
wlogout
xdg-user-dirs
xdg-utils 
zsh
yad
)

hypr_packages=(
gsettings-desktop-schemas
brightnessctl 
btop
cava
eog
gnome-system-monitor
mousepad 
mpv
mpv-mpris 
nvtop
nwg-look-bin
pacman-contrib
vim
yt-dlp
lazygit
nemo
file_roller
sddm
blueman
hyprland
xdg-desktop-portal-hyprland
)

fonts=(
noto-fonts-emoji
otf-font-awesome 
ttf-droid 
ttf-fira-code
ttf-jetbrains-mono 
ttf-jetbrains-mono-nerd 
)

uninstall=(
  dunst
  mako
)

source "$(dirname "$(readlink -f "$0")")/globals.sh"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PARENT_DIR="$SCRIPT_DIR/.."

cd "$PARENT_DIR" || exit 1

install_package_pacman "yay"

install_packages "${base_packages[@]}" "${hypr_packages[@]}" "${fonts[@]}"; do

sudo systemctl enable sddm --now
sudo systemctl enable bluetooth --now

#!/bin/bash

Extra=(

)

hypr_package=( 
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
wget
wl-clipboard
wlogout
xdg-user-dirs
xdg-utils 
yad
)

hypr_package_2=(
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
sddm
hyprland
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

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || exit 1

printf "\n%s - Installing hyprland packages.... \n" "${NOTE}"

for PKG1 in "${hypr_package[@]}" "${hypr_package_2[@]}" "${fonts[@]}" "${Extra[@]}"; do
  yay -S "$PKG1" --noconfirm 
  if [ $? -ne 0 ]; then
    echo -e "\e[1A\e[K${ERROR} - $PKG1 install had failed, please check the log"
    exit 1
  fi
done

printf "\n%s - Checking if mako or dunst are installed and removing for swaync to work properly \n" "${NOTE}"
for PKG in "${uninstall[@]}"; do
  yay -R "$PKG" 
  if [ $? -ne 0 ]; then
    echo -e "\e[1A\e[K${ERROR} - $PKG uninstallation had failed, please check the log"
    exit 1
  fi
done

clear

sudo systemctl enable sddm

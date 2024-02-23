#!/bin/bash

base_packages=( 
firefox-developer-edition
64gram-desktop-bin
spotify-wayland
nextcloud-client
onlyoffice-bin
keepassxc
jetbrains-toolbox
docker-desktop
docker-compose
obsidian
)

source "$(dirname "$(readlink -f "$0")")/globals.sh"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PARENT_DIR="$SCRIPT_DIR/.."

cd "$PARENT_DIR" || exit 1

install_packages "${base_packages[@]}"


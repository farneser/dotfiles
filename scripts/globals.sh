#!/bin/bash

backup_path() {
    timestamp=$(date +"%Y%m%d%H%M%S")
    
    backup_path="$1.backup_${timestamp}"
    
    mv $1 ${backup_path}
}

install_package_pacman() {
  if pacman -Q "$1" &>/dev/null ; then
    echo -e "$1 is already installed. Skipping..."
  else
    echo -e "Installing $1 ..."
    sudo pacman -S --noconfirm "$1" 2>&1
    if pacman -Q "$1" &>/dev/null ; then
      echo -e "${OK} $1 was installed."
    else
      echo -e "${ERROR} $1 failed to install. You may need to install manually."
      exit 1
    fi
  fi
}


ISAUR=$(command -v yay || command -v paru)

install_package() {
  if $ISAUR -Q "$1" &>> /dev/null ; then
    echo -e "$1 is already installed. Skipping..."
  else
    echo -e "Installing $1 ..."
    $ISAUR -S --noconfirm "$1" 2>&1
    if $ISAUR -Q "$1" &>> /dev/null ; then
      echo -e "$1 was installed."
    else
      echo -e "$1 failed to install. You may need to install manually!"
      exit 1
    fi
  fi
}

uninstall_package() {
  if pacman -Qi "$1" &>> /dev/null ; then
    echo -e "Uninstalling $1 ..."
    sudo pacman -Rns --noconfirm "$1" 2>&1 
    if ! pacman -Qi "$1" &>> /dev/null ; then
      echo -e "$1 was uninstalled."
    else
      echo -e "$1 failed to uninstall."
      exit 1
    fi
  fi
}


# uning like install_packages "${hypr_packages[@]}" "${hypr_packages2[@]}"
install_packages() {
    local packages=("${@}")
    for PKG1 in "${packages[@]}"; do
        install_package "$PKG1"
    done
}


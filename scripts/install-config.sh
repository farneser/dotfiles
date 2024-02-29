#!/bin/bash

script_location="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_folder="$script_location/../config"
target_folder="$HOME/.config"
home_configs="$scripts_location/../home"

#cp $home_configs/* ~/

config_names=()

# Check if the directory exists
if [ -d "$config_folder" ]; then
    # Iterate over folders in the config directory
    for folder in "$config_folder"/*; do
        # Check if the item is a directory
        if [ -d "$folder" ]; then
            # Extract the folder name and add it to the array
            folder_name=$(basename "$folder")
            config_names+=("$folder_name")
        fi
    done
else
    echo "Error: $config_folder does not exist or is not a directory."
    exit 1
fi

for config_name in "${config_names[@]}"; do
  config_path="$config_folder/$config_name"
  target_config_path="$target_folder/$config_name"

  # Check if config folder exists
  if [ -d "$config_path" ]; then
    # Create backup folder inside target config folder
    timestamp=$(date +"%Y%m%d%H%M%S")
    backup_folder="${target_config_path}_backup_${timestamp}"
    mkdir -p "$backup_folder"

    # Copy contents of config folder to backup folder
    mv "$target_config_path"/* "$backup_folder"
    echo "Backup created for configuration folder '$target_config_path' in '$backup_folder'"

    # Copy config to $HOME/.config/
    cp -r "$config_path" "$target_folder"
    echo "Configuration folder '$config_name' copied to '$target_folder'"
  else
    echo "Configuration folder '$config_name' does not exist. Skipping."
  fi
done

gsettings set org.cinnamon.desktop.default-applications.terminal exec terminator
xdg-mime default nemo.desktop inode/directory

# Allow scripts 
chmod +x ${target_folder}/scripts/*.sh

gsettings set org.gnome.desktop.interface gtk-theme "Tokyonight-Storm-B"
gsettings set org.gnome.desktop.wm.preferences  theme "Tokyonight-Storm-B"

gsettings set org.gnome.gedit.preferences.editor editor-font 'JetBrainsMonoNL Nerd Font Mono Italic 12'
gsettings set org.gnome.gedit.preferences.editor scheme 'solarized-dark'

mkdir ~/temp_config_install

git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme ~/temp_config_install/theme

mkdir ~/.icons

cp ~/temp_config_install/theme/themes/Tokyonight-Light ~/.icons/Tokyonight-Light

gsettings set org.gnome.desktop.interface icon-theme 'oomox-Tokyonight-Light'

rm -rf ~/temp_config_install

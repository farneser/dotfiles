#!/bin/bash

script_location="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_folder="$script_location/../config"
target_folder="$HOME/.config"
config_names=("cava" "hypr" "kitty" "nvim" "rofi" "swappy" "waybar")

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
    echo "Backup created for configuration folder '$target_config_name' in '$backup_folder'"

    # Copy config to $HOME/.config/
    cp -r "$config_path" "$target_folder"
    echo "Configuration folder '$config_name' copied to '$target_folder'"
  else
    echo "Configuration folder '$config_name' does not exist. Skipping."
  fi
done


#!/bin/bash

script_location="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_folder="$script_location/../config"
config_names=("cava" "hypr" "kitty" "nvim" "rofi" "swappy" "waybar")

for config_name in "${config_names[@]}"; do
  config_path="$config_folder/$config_name"

  # Check if config folder exists
  if [ -d "$config_path" ]; then
    timestamp=$(date +"%Y%m%d%H%M%S")
    backup_folder="$config_path/backup_${timestamp}"

    # Create backup folder inside config folder
    mkdir -p "$backup_folder"

    # Copy contents of config folder to backup folder
    cp -r "$config_path"/* "$backup_folder"
    echo "Backup created for configuration folder '$config_name' in '$backup_folder'"
  else
    echo "Configuration folder '$config_name' does not exist. Skipping."
  fi
done

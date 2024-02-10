#!/bin/bash

echo "Starting installing aur dependencies"

./scripts/install-deps-aur.sh 

echo "Starting installing configurations"

./scripts/install-config.sh 

read -p "Do you want to install laptop configuration? (y/N): " choice

# If the input is empty, default to "no"
if [ -z "$choice" ]; then
  choice="n"
fi

case "$choice" in
  [yY]|[yY][eE][sS])
    echo "Starting installing laptop configurations"
    sudo ./scripts/logind-power-buttons.sh 
      ;;
  [nN]|[nN][oO])
    echo "Laptop config skipped"
    ;;
  *)
    echo "Invalid input. Please enter Y or n."
    ;;
esac



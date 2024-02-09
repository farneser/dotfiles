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
    echo "Laptop config skipped"
    ;;
  [nN]|[nN][oO])
    echo "Starting installing laptop configurations"
    ./scripts/logind-power-buttons.sh 
    ;;
  *)
    echo "Invalid input. Please enter Y or n."
    ;;
esac



#!/bin/bash

# Function to install apps via mas with verification
install_app() {
  local app_name=$1
  local app_id=$2

  echo "Installing $app_name..."
  if mas list | grep "$app_id"; then
    echo "$app_name is already installed."
  else
    if mas install "$app_id"; then
      echo "$app_name installed successfully."
    else
      echo "Failed to install $app_name."
    fi
  fi
}

install_app "WhatsApp" 310633997
install_app "CleanMyMac" 1339170533
install_app "Telegram" 747648890
install_app "DaVinci Resolve" 571213070
install_app "Dropover" 1355679052
install_app "Bitwarden" 1352778147

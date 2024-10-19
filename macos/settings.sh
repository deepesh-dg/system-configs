#!/bin/bashn

# Set date and time automatically
sudo systemsetup -setusingnetworktime on

# Enable 24-hour time format
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

echo "Date and time set to automatic and 24-hour time format enabled!"

# Enable Hover Text
defaults write com.apple.universalaccess hoverTextEnabled -bool true

# Set Hover Text activation to 'Cmd' key
defaults write com.apple.universalaccess hoverTextActivationModifier -string "command"

echo "Hover Text enabled, press 'Cmd' to display large text."


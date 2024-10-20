#!/bin/bash

echo "Resetting LaunchPad to show all Brew-installed apps..."
defaults write com.apple.dock ResetLaunchPad -bool true
killall Dock
echo "LaunchPad reset successfully!"

echo "Setting date and time to automatic..."
if sudo systemsetup -setusingnetworktime on; then
  echo "Date and time set to automatic."
else
  echo "Failed to set date and time to automatic."
fi

echo "Enabling 24-hour time format..."
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true
echo "24-hour time format enabled!"

echo "Enabling Hover Text..."
defaults write com.apple.universalaccess hoverTextEnabled -bool true
defaults write com.apple.universalaccess hoverTextActivationModifier -string "command"
echo "Hover Text enabled. Press 'Cmd' to display large text."

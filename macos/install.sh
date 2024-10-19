#!/bin/bash

echo "clone git system configs"
git clone git@github.com:deepesh-dg/system-configs.git ~/system-configs

echo "Installing Oh My Zsh"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing dotfiles"

# Symlink dotfiles to home directory
ln -sf ~/system-configs/macos/dotfiles/.zshrc ~/.zshrc
ln -sf ~/system-configs/macos/dotfiles/.vimrc ~/.vimrc
ln -sf ~/system-configs/macos/dotfiles/.gitconfig ~/.gitconfig

echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing brew files"
brew bundle --file ~/system-configs/macos/dotfiles/Brewfile

echo "installing mas apps from appstore"
echo "installing WhatsApp"
mas install 310633997
echo "installing CleanMyMac"
mas install 1339170533
echo "installing Telegram"
mas install 747648890
echo "installing DaVinciResolve"
mas install 571213070
echo "installing Dropover"
mas install 1355679052

# Set zsh as default shell
chsh -s $(which zsh)

echo "Setup completed. Restarting your system..."

sudo shutdown -r now

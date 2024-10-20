#!/bin/bash

echo "clone git system configs"
git clone https://github.com/deepesh-dg/system-configs.git ~/system-configs

echo "Installing dotfiles"

# Symlink dotfiles to home directory
ln -sf ~/system-configs/macos/dotfiles/.zshrc ~/.zshrc
ln -sf ~/system-configs/macos/dotfiles/.vimrc ~/.vimrc
ln -sf ~/system-configs/macos/dotfiles/.gitconfig ~/.gitconfig

echo "Installing brew"
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing brew files"
brew bundle --file ~/system-configs/macos/dotfiles/Brewfile

echo "installing mas apps from appstore"
/bin/bash ~/system-configs/macos/mas.sh

echo "MacOS System settings configuration started..."
/bin/bash ~/system-configs/macos/settings.sh

# Set zsh as default shell
chsh -s $(which zsh)

echo "Installing Oh My Zsh"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "applying new zshrc config"
source ~/.zshrc

echo "Installing oh-my-zsh plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git $ZSH_CUSTOM/plugins/zsh-completions

echo "Setup completed. Please restart your system..."

#!/bin/bash

echo "Cloning git system configs"
if git clone https://github.com/deepesh-dg/system-configs.git ~/system-configs; then
  echo "Git clone successful"
else
  echo "Failed to clone git repository. Exiting..."
  exit 1
fi

echo "Installing dotfiles"

# Symlink dotfiles to home directory
ln -sf ~/system-configs/macos/dotfiles/.zshrc ~/.zshrc
ln -sf ~/system-configs/macos/dotfiles/.vimrc ~/.vimrc
ln -sf ~/system-configs/macos/dotfiles/.gitconfig ~/.gitconfig

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing brew dependencies from Brewfile"
if brew bundle --file ~/system-configs/macos/dotfiles/Brewfile; then
  echo "Brew dependencies installed"
else
  echo "Brew failed to install some dependencies"
fi

echo "Installing MAS apps from App Store"
/bin/bash ~/system-configs/macos/mas.sh

echo "Configuring macOS system settings"
/bin/bash ~/system-configs/macos/settings.sh

# Set zsh as the default shell
echo "Setting zsh as default shell"
chsh -s "$(which zsh)"

echo "Installing Oh My Zsh (without modifying .zshrc)"
# Install Oh My Zsh without overwriting your custom ~/.zshrc
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Manually source Oh My Zsh from your custom .zshrc
echo "source $ZSH/oh-my-zsh.sh" >> ~/.zshrc

echo "Installing Oh My Zsh plugins"

# Ensure $ZSH_CUSTOM is set before cloning plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git $ZSH_CUSTOM/plugins/zsh-completions

echo "installing oh-my-posh theme"
if git clone https://github.com/JanDeDobbeleer/oh-my-posh.git ~/.oh-my-posh; then
  echo "Git clone successful"
else
  echo "Failed to clone git repository. Exiting..."
  exit 1
fi

echo "Applying new zshrc configuration"
zsh -c "source ~/.zshrc"

echo "Setup completed. Please restart your system..."

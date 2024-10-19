# Basic Zsh configuration

# Add custom bin directories to PATH
export PATH="$HOME/bin:$PATH"

# Enable command auto-correction
setopt CORRECT

# Enable globbing
setopt GLOB_COMPLETE

# Set the history options
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Customize the prompt (example)
PROMPT="%n@%m %1~ %# "
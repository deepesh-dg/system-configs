# Basic Zsh configuration

# Add custom bin directories to PATH
export PATH="$HOME/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

# Enable command auto-correction
setopt CORRECT

# Enable globbing
setopt GLOB_COMPLETE

# Set the history options
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

alias ls="ls --color"

# Customize the prompt (example)
PROMPT="%n@%m %1~ %# "

# ZSH Theme
ZSH_THEME="dracula"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

source $ZSH/oh-my-zsh.sh

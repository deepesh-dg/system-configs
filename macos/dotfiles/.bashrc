
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


# pnpm
export PNPM_HOME="/Users/deepesh/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

PS1="\[\e[32m\]\u@\h \[\e[34m\]\w\[\e[0m\]\$ "
# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Bind custom key combinations
bindkey \^U backward-kill-line

# Configure the title for xterm sessions
DISABLE_AUTO_TITLE="true"
case $TERM in
  screen*)
    precmd () {
       # TAB TITLE
       printf '\ePtmux;\e\e]1;%s\a\e\\' "${PWD/#$HOME/~}"
       # WINDOW TITLE
       printf '\ePtmux;\e\e]2;%s\a\e\\' "${USER}@$(hostname -s)"
       # TMUX TITLE
       printf '\ek%s\e\\' "${PWD/#$HOME/~}"
    }
  ;;
  xterm*)
    precmd () {
       # TAB TITLE
       printf '\e]1;%s\a' "${PWD/#$HOME/~}"
       # WINDOW TITLE
       printf '\e]2;%s\a' "${USER}@$(hostname -s)"
    }
  ;;
esac

# Add new items to path from ~/.lib/paths
if [ -f ~/.lib/path_helper ]; then
  . ~/.lib/path_helper
fi

# Add new SSH proxy functions
if [ -f ~/.lib/proxy ]; then
  . ~/.lib/proxy
fi

# Add any new aliases to this file
if [ -f ~/.lib/aliases ]; then
  . ~/.lib/aliases
fi

# Add new fixssh() function for terminal multiplexers
if [ -f ~/.lib/grabssh ]; then
  . ~/.lib/grabssh
fi

# Add any local customizations
if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

# Load RVM if it is installed
if [ -s "${HOME}/.rvm/scripts/rvm" ]; then
  . "${HOME}/.rvm/scripts/rvm"
fi

# Add new items to path from ~/.lib/paths
if [ -f ~/.lib/path_deduper ]; then
  . ~/.lib/path_deduper
fi

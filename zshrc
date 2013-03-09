# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Configure the title for xterm sessions
case $TERM in
  xterm*)
    DISABLE_AUTO_TITLE="true"
    precmd () {
       # TAB TITLE
       echo -ne "\e]1;${PWD/#$HOME/~}\a"
       # WINDOW TITLE
       echo -ne "\e]2;${USER}@$(hostname -s) : ${PWD/#$HOME/~}\a"
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

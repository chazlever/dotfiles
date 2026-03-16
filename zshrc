#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Chaz Lever <chaz@noreply.users.github.com>
#

# Setup ZSH key bindings
bindkey \^U backward-kill-line

# Add any local customizations
if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

# Add new items to PATH from ~/.lib/paths
if [ -f ~/.lib/path_helper ]; then
  . ~/.lib/path_helper
fi

# Remove duplicate paths from PATH
if [ -f ~/.lib/path_deduper ]; then
  . ~/.lib/path_deduper
fi

# Add any new aliases to this file
if [ -f ~/.lib/aliases ]; then
  . ~/.lib/aliases
fi

# Add new fixssh() function for terminal multiplexers
if [ -f ~/.lib/grabssh ]; then
  . ~/.lib/grabssh
fi

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Setup Homebrew completions if they exist
homebrew_completions="$(brew --prefix)/share/zsh/site-functions"
if [[ -d "$homebrew_completions" ]]; then
  fpath=(
    "$homebrew_completions"
    "${fpath[@]}"
  )
  autoload -Uz compinit
  compinit -u
fi

# Created by `pipx` on 2024-04-04 22:14:37
export PATH="$PATH:/Users/chaz/.local/bin"
if [ -f "/Users/chaz/.config/fabric/fabric-bootstrap.inc" ]; then 
  . "/Users/chaz/.config/fabric/fabric-bootstrap.inc"; 
fi
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/chaz/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

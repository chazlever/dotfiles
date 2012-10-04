# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew gem osx pip redis-cli)

source $ZSH/oh-my-zsh.sh

# Add new items to path from ~/.lib/paths
if [ -f ~/.lib/path_helper ]; then
  . ~/.lib/path_helper
fi

# If not running interactively, don't do anything
[ -z "${PS1}" ] && return 

# Add new SSH proxy functions
if [ -f ~/.lib/proxy ]; then
  . ~/.lib/proxy
fi

# Add any new aliases to this file
if [ -f ~/.lib/aliases ]; then
  . ~/.lib/aliases
fi

# Add the bashmarks script to this file
if [ -f ~/.lib/bashmarks ]; then
  . ~/.lib/bashmarks
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
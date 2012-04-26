#!/bin/bash
#
# Author: Chaz Lever
# Date: 06/25/2011

# Add new items to path from ~/.bash/paths
if [ -f ~/.bash/path_helper ]; then
  . ~/.bash/path_helper
fi

# If not running interactively, don't do anything
[ -z "${PS1}" ] && return

# Add new SSH proxy functions
if [ -f ~/.bash/proxy ]; then
  . ~/.bash/proxy
fi

# Add any new exports to this file
if [ -f ~/.bash/exports ]; then
  . ~/.bash/exports
fi

# Add any new aliases to this file
if [ -f ~/.bash/aliases ]; then
  . ~/.bash/aliases
fi

# Add the bashmarks script to this file
if [ -f ~/.bash/bashmarks ]; then
  . ~/.bash/bashmarks
fi

# Add new fixssh() function for terminal multiplexers
if [ -f ~/.bash/grabssh ]; then
  . ~/.bash/grabssh
fi

# Add any new auto completions to this file
if [ -f ~/.bash/completions ]; then
  . ~/.bash/completions
fi

# Add any local customizations
if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

if [ ! -z "$TERM" ]; then
  # don't put duplicate lines in the history. See bash(1) for more options
  export HISTCONTROL=ignoredups

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize
  shopt -s cdspell

  # Disable XON/XOFF flow control since it interferes with some BASH key
  # bindings
  stty -ixon

  # set a fancy prompt (non-color, unless we know we "want" color)
  case "$TERM" in
    screen-256color | xterm-256color | xterm-color)
      color_prompt=yes;;
  esac

  # If this is an xterm set the title to user@host:dir
  case "$TERM" in
    xterm*|rxvt*)
      PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
      ;;
    *)
      ;;
  esac

  # Check for color support and set prompt accordingly
  tput=$(which tput)
  if [ ! -z ${tput} ] && ${tput} setaf 1 >&/dev/null; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W \[\033[33m\]⚡\[\033[00m\] '
  else
    PS1='\u@\h:\W ⚡ '
  fi
  unset color_prompt tput
fi

# Make sure that bash completion is enabled
if [ -s /etc/bash_completion ]; then
  . /etc/bash_completion
elif [ -s /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# Load RVM if it is installed
if [ -s "${HOME}/.rvm/scripts/rvm" ]; then
  . "${HOME}/.rvm/scripts/rvm"
fi

# Set RWX permissions only for user and group
umask 007


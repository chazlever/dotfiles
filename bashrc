#!/bin/bash
#
# Author: Chaz Lever
# Date: 06/25/2011

# If not running interactively, don't do anything
[ -z "${PS1}" ] && return

# Add any new paths to this file
if [ -f ~/.bash/paths ]; then
  . ~/.bash/paths
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
if [ -f ~/.bash/bashmarks.sh ]; then
  . ~/.bash/bashmarks.sh
fi

# Add any new auto completions to this file
if [ -f ~/.bash/completions ]; then
  . ~/.bash/completions
fi

# Add any local customizations
if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[00;32m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Set RWX permissions only for user and group
umask 007


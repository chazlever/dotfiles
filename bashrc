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


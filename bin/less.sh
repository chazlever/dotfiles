#!/bin/bash
#
# Author: Chaz Lever
# Date: 06/25/2011
#
# Use vim as a replacement less. 
# Don't like vimpager because it's too slow.

if test -t 1; then
   # Output is a terminal, pass arguments or stdin to vim
   if test $# = 0; then
      vim -MRn -c 'set nomod nolist nospell nonu' \
         -c 'nm q :qa!<CR>' -c 'nm <end> G' -c 'nm <home> gg' -
   else
      vim -MRn -c 'set nomod nolist nospell nonu' -c 'nm q :qa!<CR>' \
         -c 'nm <end> G' -c 'nm <home> gg' -p "$@"
   fi
else
   # Output is not a terminal, cat arguments or stdin
   if test $# = 0; then
      cat
   else
      cat "$@"
   fi
fi


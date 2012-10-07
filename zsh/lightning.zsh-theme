function return_indicator {
   if [ "$?" -eq 0 ]; then
      echo "%{$fg[yellow]%}⚡"
   else
      echo "%{$fg[red]%}✗"
   fi
}

PROMPT='%{$fg_bold[green]%}%n@%m%{$fg_bold[magenta]%} ➜ %{$fg[cyan]%}${PWD/#$HOME/~} $(return_indicator) %{$reset_color%}% '
RPROMPT='%{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[cyan]%}%{$reset_color%}%'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}[%{$fg[green]%}± %{$fg[yellow]%}<"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="> %{$fg[red]%}✗%{$fg_bold[blue]%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="> %{$fg[green]%}✓%{$fg_bold[blue]%}]"

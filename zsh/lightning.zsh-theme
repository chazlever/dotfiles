function return_indicator {
   if [ "$?" -eq 0 ]; then
      echo "%{$fg[yellow]%}⚡"
   else
      echo "%{$fg[red]%}✗"
   fi
}

PROMPT='%{$fg_bold[green]%}%n@%m%{$fg_bold[magenta]%} ➜ %{$fg_bold[cyan]%}${PWD/#$HOME/~} $(return_indicator) %{$reset_color%}%'
RPROMPT='$(git_prompt_info)%{$reset_color%}%'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}[%{$fg[green]%}± %{$fg_bold[yellow]%}<"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="> %{$fg_bold[red]%}✗%{$fg_bold[blue]%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="> %{$fg_bold[green]%}✓%{$fg_bold[blue]%}]"

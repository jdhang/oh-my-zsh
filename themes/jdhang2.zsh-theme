#➤ ᐅ⮀⮂▶◀⮁⮃

setopt promptsubst

autoload -U add-zsh-hook

PROMPT='%{$bg[blue]%}%{$fg[white]%} %T %{$reset_color%}%{$bg[cyan]%}%{$fg[blue]%}⮀%{$bg[cyan]%}%{$fg[white]%} %c %{$reset_color%}%{$fg[cyan]%}⮀ %f'
RPROMPT='%{$bg[green]%}%{$fg[white]%} $(git_prompt_info) $(git_prompt_status)%{$reset_color%}%f'

ZSH_THEME_GIT_PROMPT_PREFIX="⭠  "
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✘%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" $FG[077]✔%f"
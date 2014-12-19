#➤ ᐅ⮀⮂▶◀⮁⮃''

setopt promptsubst

autoload -U add-zsh-hook

# RPROMPT='$(git_prompt_info)$(git_prompt_status)%{$reset_color%}%f'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}⮂%{$reset_color%}%{$bg[green]%}%{$fg[white]%}⭠"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
# ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✘%f"
# ZSH_THEME_GIT_PROMPT_CLEAN=" $FG[077]✔%f"

CURRENT_BG='NONE'
SEGMENT_SEPARATOR='⮀'
SEGMENT_SEPARATOR_SKINNY='⮁'
SEGMENT_SEPARATOR_LEFT='⮂ '

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

prompt_git() {
  local ref dirty
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    ZSH_THEME_GIT_PROMPT_DIRTY='±'
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green white
    fi
    echo -n "${ref/refs\/heads\//⭠ }$dirty "
  fi
}

prompt_user() {
  prompt_segment black white ' %n '
}

prompt_dir() {
  prompt_segment cyan white ' %3c '
}

prompt_time() {
  prompt_segment blue white '%T '
}

build_prompt() {
  RETVAL=$?
  prompt_time
  prompt_user
  prompt_dir
  prompt_end
}

RPROMPT='$(prompt_git)'
PROMPT='$(build_prompt) '
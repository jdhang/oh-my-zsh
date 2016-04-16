<<<<<<< HEAD
# reference colors
GREEN="%{$fg_bold[green]%}"
RED="%{$fg_bold[red]%}"
CYAN="%{$fg_bold[cyan]%}"
YELLOW="%{$fg_bold[yellow]%}"
BLUE="%{$fg_bold[blue]%}"
MAGENTA="%{$fg_bold[magenta]%}"
WHITE="%{$fg_bold[white]%}"

COLOR_ARRAY=($GREEN $RED $CYAN $YELLOW $BLUE $MAGENTA $WHITE)

# color reset
RESET_COLOR="%{$reset_color%}"

# which color should be applied?
USERNAME_NORMAL_COLOR=$WHITE
USERNAME_ROOT_COLOR=$RED
HOSTNAME_NORMAL_COLOR=$BLUE
# uncomment next line if you want auto-generated hostname color
#for i in `hostname`; HOSTNAME_NORMAL_COLOR=$COLOR_ARRAY[$[((#i))%7+1]]
HOSTNAME_ROOT_COLOR=$RED
HOSTNAME_COLOR=%(!.$HOSTNAME_ROOT_COLOR.$HOSTNAME_NORMAL_COLOR)
CURRENT_DIR_COLOR=$CYAN

# zsh commands
USERNAME_COMMAND="%n"
HOSTNAME_COMMAND="%m"
CURRENT_DIR="%~"

# output: colors + commands
USERNAME_OUTPUT="%(!..$USERNAME_NORMAL_COLOR$USERNAME_COMMAND$RESET_COLOR@)"
HOSTNAME_OUTPUT="$HOSTNAME_COLOR$HOSTNAME_COMMAND$RESET_COLOR"
CURRENT_DIR_OUTPUT="$CURRENT_DIR_COLOR$CURRENT_DIR"
LAST_COMMAND_OUTPUT="%(?.%(!.$RED.$GREEN).$YELLOW)"

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="("
=======
# Michele Bologna's theme
# http://michelebologna.net
#
# This a theme for oh-my-zsh. Features a colored prompt with:
# * username@host: [jobs] [git] workdir % 
# * hostname color is based on hostname characters. When using as root, the 
# prompt shows only the hostname in red color.
# * [jobs], if applicable, counts the number of suspended jobs tty
# * [git], if applicable, represents the status of your git repo (more on that
# later)
# * '%' prompt will be green if last command return value is 0, yellow otherwise.
# 
# git prompt is inspired by official git contrib prompt: 
# https://github.com/git/git/tree/master/contrib/completion/git-prompt.sh
# and it adds:
# * the current branch
# * '%' if there are untracked files
# * '$' if there are stashed changes
# * '*' if there are modified files
# * '+' if there are added files
# * '<' if local repo is behind remote repo
# * '>' if local repo is ahead remote repo
# * '=' if local repo is equal to remote repo (in sync)
# * '<>' if local repo is diverged

local green="%{$fg_bold[green]%}"
local red="%{$fg_bold[red]%}"
local cyan="%{$fg_bold[cyan]%}"
local yellow="%{$fg_bold[yellow]%}"
local blue="%{$fg_bold[blue]%}"
local magenta="%{$fg_bold[magenta]%}"
local white="%{$fg_bold[white]%}"
local reset="%{$reset_color%}"

local -a color_array
color_array=($green $red $cyan $yellow $blue $magenta $white)

local username_normal_color=$white
local username_root_color=$red
local hostname_root_color=$red

# calculating hostname color with hostname characters
for i in `hostname`; local hostname_normal_color=$color_array[$[((#i))%7+1]]
local -a hostname_color
hostname_color=%(!.$hostname_root_color.$hostname_normal_color)

local current_dir_color=$blue
local username_command="%n"
local hostname_command="%m"
local current_dir="%~"

local username_output="%(!..$username_normal_color$username_command$reset@)"
local hostname_output="$hostname_color$hostname_command$reset"
local current_dir_output="$current_dir_color$current_dir$reset"
local jobs_bg="${red}fg: %j$reset"
local last_command_output="%(?.%(!.$red.$green).$yellow)"

ZSH_THEME_GIT_PROMPT_PREFIX=""
>>>>>>> d310fac7f65d31f7494532201e02ebf67c9d9555
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="$blue%%"
ZSH_THEME_GIT_PROMPT_MODIFIED="$red*"
ZSH_THEME_GIT_PROMPT_ADDED="$green+"
ZSH_THEME_GIT_PROMPT_STASHED="$blue$"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="$green="
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=">"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="<"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="$red<>"

PROMPT='$username_output$hostname_output:$current_dir_output%1(j. [$jobs_bg].)'
GIT_PROMPT='$(out=$(git_prompt_info)$(git_prompt_status)$(git_remote_status);if [[ -n $out ]]; then printf %s " $white($green$out$white)$reset";fi)'
PROMPT+="$GIT_PROMPT"
PROMPT+=" $last_command_output%#$reset "
RPROMPT=''

USER_OK_COLOR="159"
USER_ERR_COLOR="009"
HOSTNAME_COLOR="116"
DIRECTORY_COLOR="014"
DIRECTORY_DEPTH=6
GIT_COLOR="080"

right_triangle() {
   echo $'\ue0b0'
}

prompt_indicator() {
   echo $'%B\u276f%b'
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

ok_username() {
   ARROW_FG="016"
   ARROW_BG="$USER_OK_COLOR"
   NEXT_ARROW_BG="$HOSTNAME_COLOR"
   NEXT_ARROW_FG="$USER_OK_COLOR"
   echo "$(arrow_start) %n $(arrow_end)"
}

err_username() {
   ARROW_FG="016"
   ARROW_BG="$USER_ERR_COLOR"
   NEXT_ARROW_BG="$HOSTNAME_COLOR"
   NEXT_ARROW_FG="$USER_ERR_COLOR"
   echo "$(arrow_start) %n $(arrow_end)"
}

# return err_username if there are errors, ok_username otherwise
username() {
   echo "%(?.$(ok_username).$(err_username))"
}

hostname() {
   ARROW_FG="016"
   ARROW_BG="$HOSTNAME_COLOR"
   NEXT_ARROW_BG="$DIRECTORY_COLOR"
   NEXT_ARROW_FG="$HOSTNAME_COLOR"
   echo "$(arrow_start) %M $(arrow_end)"
}

directory() {
   ARROW_FG="016"
   ARROW_BG="$DIRECTORY_COLOR"
   NEXT_ARROW_BG="$GIT_COLOR"
   NEXT_ARROW_FG="$DIRECTORY_COLOR"
   echo "$(arrow_start) %${DIRECTORY_DEPTH}~ $(arrow_end)"
}

current_time() {
   echo "%{$fg[white]%}%*%{$reset_color%}"
}

git_prompt() {
   ARROW_FG="016"
   ARROW_BG="$GIT_COLOR"
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="$GIT_COLOR"
   echo "$(arrow_start) $(git_prompt_info) $(arrow_end)"
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

PROMPT='$(username)$(hostname)$(directory)$(git_prompt)
$(prompt_indicator) '
RPROMPT='$(git_prompt_status) $(current_time)'

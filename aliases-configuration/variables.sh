#!/bin/bash

# Color
color_reset='\033[0m'
color_black='\033[0;30m'
color_red='\033[0;31m'
color_green='\033[0;32m'
color_yellow='\033[0;33m'
color_blue='\033[0;34m'
color_purple='\033[0;35m'
color_cyan='\033[0;36m'
color_white='\033[0;37m'

# Used to compute how long the current command lasts
function command_start {
  command_start=${command_start:-${SECONDS}}
}

function command_stop {
  command_time=$((SECONDS - command_start))
  unset command_start
}

trap 'command_start' DEBUG
PROMPT_COMMAND='command_stop'

# Define PSx
export PS1="\\[$color_green\\][\\[$color_cyan\\]\$?\\[$color_green\\]]\\[$color_green\\][\\[$color_red\\]\D{%F %T}\\[$color_green\\]]\\[$color_green\\][\\[$color_purple\\]\${command_time:-?}\\[$color_green\\]][\\[$color_yellow\\]\u\\[$color_green\\]@\\[$color_cyan\\]\h\\[$color_green\\]:\\[$color_blue\\]\w\\[$color_green\\]]\\[$color_reset\\]\\[$color_green\\]\$(type get_git_current_branch > /dev/null 2>&1 && get_git_current_branch) \$(type screen_get_session_name > /dev/null 2>&1 && screen_get_session_name)\\[$color_reset\\]\n \\[$color_cyan\\]$\\[$color_reset\\] \[\e]2;$(whoami)@$(hostname) - $(pwd)\a\]"
export PS2="\\[$color_cyan\\]->\\[$color_reset\\] "

# Auto correct cd command line
shopt -s cdspell

# Auto check if the window size changes
shopt -s checkwinsize

# Up Arrow
bind '"\e[A": history-search-backward'

# Down Arrow
bind '"\e[B": history-search-forward'

# Editor
export EDITOR="/usr/bin/vim"

# Pager
export PAGER=most

# History
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=8192
export HISTFILESIZE=8192
# Append to the history file instead of overwrite
shopt -s histappend

# Add the current folder in the PATH.
export PATH="${PATH}:.";

export LANG=fr_FR.UTF-8

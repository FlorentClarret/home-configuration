#!/bin/sh

# One alias to use them all
alias sudoa='sudo '
# Seems useless? If the last character of the alias value is a blank, then the next command word following the alias is also checked for alias expansion.

# ls
alias ll="ls -alh";
alias lm="ls -altrh";

# df
alias df="df -h"

# du
alias du="du -h"

# history
alias hi="history | tail -20"
alias hg="history | grep"

# cd
alias ..='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# time
alias now='date +"%T"'
alias today='date +"%d-%m-%Y"'

# path
alias path='echo -e ${PATH//:/\\n}'

# source
alias src='source'

# tail
alias tf="tail -f"

# Make them verbose
alias mv="mv -v"
alias rm="rm -vi"
alias cp="cp -v"

# clear
alias cl="clear"

# reload aliases
alias reload="source ~/.aliases/load.sh"

# ssh
alias sshconfig="${EDITOR:-vim} ~/.ssh/config"

## Fetch hostname from sshconfig and create an alias to connect to them
if [[ -f ~/.ssh/config ]]; then
  for name in $(grep -E ^Host ~/.ssh/config | grep -v '*' | grep -v '?' | sed 's/^Host \(.*\)/\1/' | tr ' ' '\n'); do
  	eval alias "$name=\"ssh $name\""
  done
fi

# tar
alias untar='tar -xvf'

# tmux
alias tmuxlast='tmux attach || tmux new-session'

tmuxo () {
    tmux attach -t $1 || tmux new -s $1
}

# miscellaneous
alias myip="curl ifconfig.me"
alias randpass="openssl rand -base64 24"

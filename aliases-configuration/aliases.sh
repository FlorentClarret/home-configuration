#!/bin/sh

# One alias to use them all
alias sudoa='sudo '
# Seems useless? If the last character of the alias value is a blank, then the next command word following the alias is also checked for alias expansion.
# You're welcome.

# ls
alias ll="ls -alh";
alias lm="ls -altrh";

# df
alias df="df -h"

# du
alias du="du -h"

# history
alias hi="history | tail -20"

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
if [ -f ~/.ssh/config ]; then
  for name in $(grep -E ^Host ~/.ssh/config | grep -v '*' | grep -v '?' | sed 's/^Host \(.*\)/\1/' | tr ' ' '\n'); do
  	eval alias "$name=\"ssh $name\""
  done
fi

## SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
  complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
fi

# tar
alias untar='tar -xvf'

# docker
alias dk='docker'
# Get latest container ID
alias dkl="docker ps -l -q"
# Get container process
alias dkps="docker ps"
# Get process included stop container
alias dkpsa="docker ps -a"
# Get images
alias dki="docker images"
# Execute interactive container, e.g., $dex base /bin/bash
alias dkex="docker exec -i -t"
# Stop and Remove all containers
alias dkrmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# miscellaneous
alias myip="curl ifconfig.me"
alias randpass="openssl rand -base64 24"

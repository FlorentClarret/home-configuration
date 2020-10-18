#!/usr/bin/env bash

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

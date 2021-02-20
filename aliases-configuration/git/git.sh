#!/bin/sh

get_git_current_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' | sed -e 's/* \(.*\)/ (branch: \1) /'
}

init_remote() {
    for remote in origin gitlab github; do
      git remote rm $remote
    done;

    git remote add origin "ssh://private-gitlab/florent.clarret/$1.git"
    git remote add gitlab "git@gitlab.com:florent.clarret/$1.git"
    git remote add github "git@github.com:FlorentClarret/$1.git"
}

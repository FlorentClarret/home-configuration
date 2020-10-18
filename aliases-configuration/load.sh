#!/bin/sh

ALIAS_FOLDER="$HOME/.aliases/"

source "$ALIAS_FOLDER/git/git.sh"
source "$ALIAS_FOLDER/screen/screen.sh"
source "$ALIAS_FOLDER/borg/borg-aliases.bash"
source "$ALIAS_FOLDER/docker/docker-aliases.bash"

source "$ALIAS_FOLDER/ssh/start-agent.sh"

source "$ALIAS_FOLDER/aliases.sh"
source "$ALIAS_FOLDER/variables.sh"

for file in $(ls ~/.config/completion/); do
  source ~/.config/completion/$file
done

# Start tmux default session

#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
#fi

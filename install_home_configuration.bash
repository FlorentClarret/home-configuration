#!/bin/bash

set -e

usage() {
  echo "./install_home_configuration.sh: "
  echo "\tDeploy the configuration files to the home directly."
  echo "Parameters: "
  echo "\t-A : Deploy everything (default mode)"
  echo "\t-a : Deploy aliases configuration files"
  echo "\t-g : Deploy git configuration files"
  echo "\t-v : Deploy vim configuration files"
  echo "\t-m : Deploy MC configuration"
  echo "\t-s : Deploy screen configuration"
  echo "\t-l : Deploy less configuration"
  echo "\t-i : Deploy idea configuration"
  echo "\t-r : Reload the aliases after the deployment (if sourced)"
  echo "\t-h : Show this usage"
}

# ================================== Main ==================================

INSTALL_ALL="YES"
INSTALL_GIT="NO"
INSTALL_ALIASES="NO"
INSTALL_MC="NO"
INSTALL_VIM="NO"
INSTALL_SCREEN="NO"
INSTALL_LESS="NO"
INSTALL_IDEA="NO"
RELOAD="NO"

while getopts "Agvamhrsli" option; do
  case $option in
    A) INSTALL_ALL="YES";;
    a) INSTALL_ALL="NO"; INSTALL_ALIASES="YES";;
    m) INSTALL_ALL="NO"; INSTALL_MC="YES";;
    v) INSTALL_ALL="NO"; INSTALL_VIM="YES";;
    g) INSTALL_ALL="NO"; INSTALL_GIT="YES";;
    s) INSTALL_ALL="NO"; INSTALL_SCREEN="YES";;
    l) INSTALL_ALL="NO"; INSTALL_LESS="YES";;
    i) INSTALL_ALL="NO"; INSTALL_IDEA="YES";;
    r) RELOAD="YES";;
    h) usage; exit 0;;
    *) usage; exit 1;;
  esac
done

if [ $INSTALL_ALL == "YES" ] || [ $INSTALL_ALIASES == "YES" ]; then
  echo "Deploy aliases..."
  rm -rf ~/.aliases
  mkdir -p ~/.aliases
  cp -R aliases-configuration/* ~/.aliases/

  if [ $RELOAD == "YES" ]; then
    echo "Reloading..."
    source ~/.aliases/load.sh
  fi

  echo "Aliases deployed."
fi

if [ $INSTALL_ALL == "YES" ] || [ $INSTALL_GIT == "YES" ]; then
  echo "Deploy gitconfig..."
  rm -rf ~/.config/git/
  mkdir -p ~/.config/git/hooks
  cp git-configuration/gitignore ~/.config/git/gitignore
  cp -R git-configuration/hooks/* ~/.config/git/hooks/
  cp git-configuration/gitconfig ~/.gitconfig
  echo "Gitconfig deployed."
fi

if [ $INSTALL_ALL == "YES" ] || [ $INSTALL_MC == "YES" ]; then
  echo "Deploy mc config..."
  mkdir -p ~/.config/mc
  cp mc-configuration/ini ~/.config/mc/ini
  echo "Mc config deployed."
fi

if [ $INSTALL_ALL == "YES" ] || [ $INSTALL_VIM == "YES" ]; then
  echo "Deploy vimrc..."
  mkdir -p ~/.vim_runtime
  cp -R vim-configuration/* ~/.vim_runtime/
  sh ~/.vim_runtime/install_awesome_vimrc.sh
  echo "Vim configuration deployed."
fi

if [ $INSTALL_ALL == "YES" ] || [ $INSTALL_SCREEN == "YES" ]; then
  echo "Deploy screenrc..."
  cp screen-configuration/screenrc ~/.screenrc
  echo "screenrc deployed."
fi

if [ $INSTALL_ALL == "YES" ] || [ $INSTALL_LESS == "YES" ]; then
  echo "Deploy less config..."
  cp less-configuration/lesskey ~/.lesskey
  echo "less config deployed."
fi

if [ $INSTALL_ALL == "YES" ] || [ $INSTALL_IDEA == "YES" ]; then
  echo "Deploy idea config..."
  mkdir -p ~/.config/idea
  cp idea-configuration/* ~/.config/idea/
  echo "idea config deployed."
fi

echo "Have fun !"

set +e
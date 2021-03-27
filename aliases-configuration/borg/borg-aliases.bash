#!/usr/bin/env bash

# Some aliases for my personal manual backup that I use occasionally
alias borg-home="borg create --verbose --list --stats --compression lzma,9 --exclude-caches --exclude /home/florentclarret/.sync /mnt/backup/florentclarret/latitude/home.borg::\"Home-Latitude-{now}\" /home/florentclarret;";
alias borg-home-no-music="borg create --verbose --list --stats --compression lzma,9 --exclude-caches --exclude /home/florentclarret/.sync --exclude /home/florentclarret/Music --exclude \"/home/florentclarret/VirtualBox VMs\" --exclude /home/florentclarret/.cache /mnt/backup/florentclarret/latitude/home.borg::\"Home-Latitude-{now}\" /home/florentclarret;";

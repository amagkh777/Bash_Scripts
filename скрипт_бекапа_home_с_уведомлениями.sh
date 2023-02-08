#!/usr/bin/env bash
  
BKP_ROOT="/backups"
BKP_DIR="$BKP_ROOT/Backups/Cron"

HOME_DIR="/home/setevoy/"

check-backups-fs() {

    bkp_root=$1

    findmnt $bkp_root
}

notify () {

    event=$1
    home_dir=$2
    at=$(date +"%d-%m-%Y %H:%M:%S")

    notify-send "Backup $event" "Backup $event for the $home_dir at $at" --icon=dialog-information
}



mkbackup() {

    bkp_dir=$1
    home_dir=$2

    sudo rsync --dry-run --archive --verbose $home_dir $bkp_dir
}

[[ $(check-backups-fs $BKP_ROOT) ]] && echo "OK: $BKP_ROOT found." || { echo "ERROR: $BKP_ROOTH not found. Exit."; exit 1; }

notify "started" $HOME_DIR

if mkbackup $BKP_DIR $HOME_DIR; then
    notify "finished" $HOME_DIR
else
    notify "FAILED" $HOME_DIR
fi

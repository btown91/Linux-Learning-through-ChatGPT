#!/bin/bash

SRC="$HOME/linux_practice" # Where the backup data comes from
DEST="$HOME/backups/backup_$(date +%Y%m%d)" # Where the backup will be stored (with today's date)

mkdir -p "$DEST"# Creates the destination folder if it doesn't already exist
cp -r "$SRC"/* "$DEST" # Copies all files from the source to the destination folder


echo "Backup done at $(date) for $DEST" >> ~/backups/backup_log.txt # Logs the backup event with timestamp
echo "Backup completed" # Prints confirmation to the screen



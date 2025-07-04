#!/bin/bash

SRC="$HOME/linux_practice"
DEST="$HOME/backups/backup_$(date +%Y%m%d)"

mkdir -p "$DEST"
cp -r "$SRC"/* "$DEST"

echo "Backup done at $(date) for $DEST" >> ~/backups/backup_log.txt
echo "Backup completed"


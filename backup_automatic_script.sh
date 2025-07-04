#Backup script so that whenever I make a change to a directory it will automatically backup to the backup directory that I made to automatically monitor the 
#direcory that I want.


#!/bin/bash

# Set the folder you want to back up
SRC="$HOME/linux_practice"

# Set the log file location (stores backup history)
LOG_FILE="$HOME/backups/backup_log.txt"

# ------------------------------------------
# Make sure the backup log folder exists
# ------------------------------------------
mkdir -p "$HOME/backups"

# ------------------------------------------
# Function to perform the backup
# ------------------------------------------
perform_backup() {
    # Create a unique destination folder with today’s date
    DEST="$HOME/backups/backup_$(date +%Y%m%d_%H%M%S)"

    # Create the backup destination folder
    mkdir -p "$DEST"

    # Copy everything from the source folder to the destination
    cp -r "$SRC"/* "$DEST"

    # Log the backup with a timestamp and destination
    echo "Backup done at $(date) to $DEST" >> "$LOG_FILE"

    # Print a message to the screen
    echo "Backup completed"
}

# ------------------------------------------
# Run one immediate backup when the script starts
# ------------------------------------------
perform_backup

# ------------------------------------------
# Watch for changes in the source directory
# When a change is detected, trigger a new backup
# ------------------------------------------
echo "Watching for changes in $SRC..."
inotifywait -m -r -e modify,create,delete,move "$SRC" | while read path action file; do
    echo "Change detected: $action $file in $path"
    perform_backup
done

#The result below is what should pop up as a successful running of the script.
:<<'Comment'
./backup_automated.sh: line 17: /home/andrew/backups/backup_log.txt: No such file or directory
Backup completed
Watching for changes in /home/andrew/linux_practice...
Setting up watches.  Beware: since -r was given, this may take a while!
Watches established.

Comment


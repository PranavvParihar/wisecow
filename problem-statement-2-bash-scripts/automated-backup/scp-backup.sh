#!/bin/bash

# Set source and destination variables
SOURCE_DIR="/path/to/local/directory"
REMOTE_USER="user"
REMOTE_HOST="remote-server.com"
REMOTE_DIR="/path/to/remote/directory"

# Run scp to copy the directory to the remote server
scp -r $SOURCE_DIR $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

# Check if scp was successful
if [ $? -eq 0 ]; then
    echo "Backup to remote server Successful: $(date)" >> /var/log/backup.log
else
    echo "Backup to remote server Failed: $(date)" >> /var/log/backup.log
fi

#!/bin/bash

# Configuration
SOURCE_FILES="/etc/nginx/sites-available/gatekeeper /etc/nginx/nginx.conf $HOME/gatekeeper/sentry.py"
BACKUP_DIR="$HOME/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FILENAME="gatekeeper_backup_$TIMESTAMP.tar.gz"

echo "📦 Starting Backup Guardian..."

# Create the compressed archive
# 'c' = create, 'z' = zip (gzip), 'f' = file
sudo tar -czf $BACKUP_DIR/$FILENAME $SOURCE_FILES 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✅ Success: Backup saved to $BACKUP_DIR/$FILENAME"
    # Keep only the last 5 backups to save space (Pro move)
    ls -t $BACKUP_DIR/gatekeeper_backup_* | tail -n +6 | xargs rm -f 2>/dev/null
else
    echo "❌ Error: Backup failed!"
    exit 1
fi

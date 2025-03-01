#!/bin/bash
# Log Rotation and Cleanup Script

LOG_DIR="/var/log"
DAYS=7  # Delete logs older than 7 days
echo "Rotating logs in $LOG_DIR older than $DAYS days"

# Find and delete old logs
find $LOG_DIR -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;
echo "Cleanup completed at $(date)"


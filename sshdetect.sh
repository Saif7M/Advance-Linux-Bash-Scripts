#!/bin/bash
# SSH Intrusion Detection

LOG_FILE="/var/log/auth.log"
ALERT_THRESHOLD=5  # Number of failed attempts before alert
TEMP_FILE="/tmp/ssh_attempts.log"

# Extract failed login attempts
grep "Failed password" $LOG_FILE | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr > $TEMP_FILE

while read COUNT IP; do
    if [ "$COUNT" -gt "$ALERT_THRESHOLD" ]; then
        echo "🚨 ALERT: SSH Brute Force Attack from $IP ($COUNT failed attempts)"
    fi
done < $TEMP_FILE


#!/bin/bash
INACTIVE_DAYS=30
CURRENT_DATE=$(date +%s)

echo "Checking for inactive users..."

for user in $(awk -F: '$3 >= 1000 {print $1}' /etc/passwd); do
    LAST_LOGIN=$(lastlog -u "$user" | awk 'NR==2 {print $4, $5, $6}')
    LAST_LOGIN_DATE=$(date -d "$LAST_LOGIN" +%s 2>/dev/null)

    if [ -n "$LAST_LOGIN_DATE" ]; then
        DIFF_DAYS=$(( (CURRENT_DATE - LAST_LOGIN_DATE) / 86400 ))
        if [ "$DIFF_DAYS" -ge "$INACTIVE_DAYS" ]; then
            echo "Disabling user: $user (Inactive for $DIFF_DAYS days)"
            sudo usermod -L "$user"
        fi
    fi
done


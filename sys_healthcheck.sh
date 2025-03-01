#!/bin/bash
# Linux System Health Check Script

LOGFILE="/var/log/system_health.log"
THRESHOLD=80  # Alert if usage exceeds this %

echo "----- System Health Check at $(date) -----" | tee -a $LOGFILE

# CPU Usage
CPU_LOAD=$(top -bn1 | grep "load average" | awk '{print $10}' | sed 's/,//')
echo "CPU Load: $CPU_LOAD" | tee -a $LOGFILE

# Memory Usage
MEMORY=$(free -m | awk '/Mem:/ { printf("%.2f"), $3/$2 * 100 }')
echo "Memory Usage: $MEMORY%" | tee -a $LOGFILE

# Disk Usage
DISK=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Disk Usage: $DISK%" | tee -a $LOGFILE

# Network Check
ping -c 2 8.8.8.8 &>/dev/null
if [[ $? -ne 0 ]]; then
    echo "⚠️ Network Issue Detected" | tee -a $LOGFILE
else
    echo "✅ Network is fine" | tee -a $LOGFILE
fi

# Alert if disk/memory is above threshold
if [[ "$DISK" -ge "$THRESHOLD" || "$MEMORY" -ge "$THRESHOLD" ]]; then
    echo "🚨 Warning: High Resource Usage!" | tee -a $LOGFILE
fi

echo "-----------------------------------------" | tee -a $LOGFILE


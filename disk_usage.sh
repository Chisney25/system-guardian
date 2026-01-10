#!/bin/bash
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
THRESHOLD=80
# Get the current date and time
NOW=$(date "+%Y-%m-%d %H:%M:%S")

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "[$NOW] ⚠️ ALERT: Disk usage is at ${USAGE}%!"
else
    echo "[$NOW] ✅ System Healthy: Disk usage is at ${USAGE}%."
fi

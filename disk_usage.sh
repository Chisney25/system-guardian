#!/bin/bash
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
THRESHOLD=80

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "⚠️ ALERT: Disk usage is at ${USAGE}%!"
else
    echo "✅ System Healthy: Disk usage is at ${USAGE}%."
fi

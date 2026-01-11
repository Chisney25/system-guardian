#!/bin/bash
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
THRESHOLD=80
NOW=$(date "+%Y-%m-%d %H:%M:%S")
WEBHOOK="https://canary.discord.com/api/webhooks/1459951341995692236/RH5aVDfiQNPVuLdUj8agyWf3Kj8x4YymGlq-iAXE46VimiCK9ZQP2YeOUTT5OhlNQIbe"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    MESSAGE="[$NOW] ⚠️ ALERT: Disk usage is at ${USAGE}% on your server!"
    echo "$MESSAGE"
    # Send to Discord
    curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"$MESSAGE\"}" $WEBHOOK=$DISCORD_WEBHOOK
else
    echo "[$NOW] ✅ System Healthy: Disk usage is at ${USAGE}%."
fi

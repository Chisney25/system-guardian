#!/bin/bash

# Configuration
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
THRESHOLD=80
NOW=$(date "+%Y-%m-%d %H:%M:%S")
WEBHOOK=$DISCORD_WEBHOOK

# Logic for Status Levels
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    COLOR=15158272 # Red
    TITLE="⚠️ DISK SPACE CRITICAL"
    DESC="The server disk usage has exceeded the threshold!\n\n**Usage:** ${USAGE}%\n**Threshold:** ${THRESHOLD}%"
else
    COLOR=3066993  # Green
    TITLE="✅ SYSTEM HEALTHY"
    DESC="Disk usage is currently within safe operational limits.\n\n**Current Usage:** ${USAGE}%"
fi

# Construct the JSON Payload
DATA=$(cat <<EOF
{
  "embeds": [{
    "title": "$TITLE",
    "description": "$DESC",
    "color": $COLOR,
    "footer": {
      "text": "System Guardian Sentinel • $NOW"
    }
  }]
}
EOF
)

# Send to Discord
curl -H "Content-Type: application/json" -X POST -d "$DATA" $WEBHOOK

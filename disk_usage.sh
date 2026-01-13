#!/bin/bash

# --- CONFIGURATION ---
THRESHOLD=80
NOW=$(date "+%Y-%m-%d %H:%M:%S")
WEBHOOK=$DISCORD_WEBHOOK

# --- 1. THE DISK CHECK ---
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# --- 2. THE SERVICE WATCHDOG (NEW!) ---
# pgrep checks if 'cron' is running. 
if pgrep cron > /dev/null; then
    SERVICE_STATUS="✅ Cron is Running"
else
    SERVICE_STATUS="❌ CRON IS DOWN!"
fi

# --- 3. LOGIC FOR THE ALERT ---
# We check if Disk is too high OR if the Service is down
if [ "$USAGE" -gt "$THRESHOLD" ] || [ "$SERVICE_STATUS" == "❌ CRON IS DOWN!" ]; then
    COLOR=15158272  # Your Yellow/Red Alert Color
    TITLE="⚠️ SYSTEM GUARDIAN ALERT"
else
    COLOR=3066993   # Healthy Green
    TITLE="✅ SYSTEM HEALTHY"
fi

# --- 4. CONSTRUCT THE MESSAGE ---
DESC="**Status Report:**\n- Disk Usage: ${USAGE}%\n- Service: $SERVICE_STATUS"

DATA=$(cat <<EOF
{
  "embeds": [{
    "title": "$TITLE",
    "description": "$DESC",
    "color": $COLOR,
    "footer": { "text": "System Guardian Sentinel • $NOW" }
  }]
}
EOF
)

# --- 5. SEND TO DISCORD ---
curl -H "Content-Type: application/json" -X POST -d "$DATA" $WEBHOOK

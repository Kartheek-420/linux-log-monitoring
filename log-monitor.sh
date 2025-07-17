#!/bin/bash

# Log file to read
LOG_FILE="/var/log/auth.log"

# Extract data
FAILED=$(grep "Failed password" $LOG_FILE | tail -5)
PRIV_ESC=$(grep -Ei "sudo|su" $LOG_FILE | grep "COMMAND=" | tail -5)
UNUSUAL=$(grep "session opened" $LOG_FILE | awk '{print $3, $0}' | awk '$1 ~/^[0-5]/')

# Create alert message
ALERT="**Security Alert from $(hostname)**

 **Failed SSH Attempts:**
$FAILED

 **Privilege Escalation Attempts:**
$PRIV_ESC

 **Unusual Login Times:**
$UNUSUAL
"

# Webhook URL 
WEBHOOK_URL="https://discord.com/api/webhooks/1395391488657068094/4W093k_QadcZ_7K-IdOOxCGOaOoO3HaLyv5YwgzYhdJl9Fl6>

# JSON payload 
echo "{\"content\": \"$ALERT\"}" > /home/nani/discord_alert.json

# Send to Discord
curl -H "Content-Type: application/json" \
     -X POST \
     -d @/home/nani/discord_alert.json \
     "$WEBHOOK_URL"





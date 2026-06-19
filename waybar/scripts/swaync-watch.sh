#!/bin/bash

prev_count=0

swaync-client -swb | while IFS= read -r line; do
    echo "$line"
    
    count=$(echo "$line" | grep -o '"text": "[0-9]*"' | grep -o '[0-9]*')
    
    if [[ -n "$count" && "$count" -gt "$prev_count" ]]; then
        echo '{"text": "'"$count"'", "alt": "notification", "tooltip": "'"$count"' Notifications", "class": "new-notification"}'
        sleep 3 &
        wait $!
        echo "$line"
    fi
    
    prev_count="${count:-$prev_count}"
done
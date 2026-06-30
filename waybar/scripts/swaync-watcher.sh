#!/usr/bin/env bash

# --- Swaync Watcher (No dependencies) ---

swaync-client -swb | while IFS= read -r line; do
    line=$(echo "$line" | \
    sed -E 's/"text"\s*:\s*0/"text":""/g; s/"text"\s*:\s*"0"/"text":""/g' | \
    sed -E 's/"text"\s*:\s*"([1-9][0-9]*)"/"text":" \1"/g; s/"text"\s*:\s*([1-9][0-9]*)/"text":" \1"/g')

    if echo "$line" | grep -q '"text":" [0-9]'; then
        line=$(echo "$line" | sed 's/}/,"class":["new-notification"]}/')
    fi

    echo "$line"
done
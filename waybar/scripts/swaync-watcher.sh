#!/usr/bin/env bash

# --- Swaync Watcher (No dependencies) ---

swaync-client -swb | while IFS= read -r line; do
    echo "$line" | \
    sed -E 's/"text"\s*:\s*0/"text":""/g; s/"text"\s*:\s*"0"/"text":""/g' | \
    sed -E 's/"text"\s*:\s*"([1-9][0-9]*)"/"text":" \1"/g; s/"text"\s*:\s*([1-9][0-9]*)/"text":" \1"/g'
done
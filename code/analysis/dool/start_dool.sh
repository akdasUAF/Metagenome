#!/bin/bash

# Check if at least one argument is provided
if [[ $# -eq 0 ]]; then
  echo "Error: Please provide a path as an argument."
  exit 1
fi

# Check if filename is empty, use default if so
path="$1"
mkdir -p "$(dirname "$path")"

# Delete the file if it exists
[[ -f "$path" ]] && rm "$path"

# Run dool in the background with user-provided filename
## Runs these settings:
# -a: all
# --aio:
## fs
# -r
# -s:
# --cpufreq 
# --disk-avgqu 
# --disk-avgrq 
# --disk-inflight 
# --disk-svctm 
# --disk-util 
# --mem-percent 

dool -afr --aio --fs --ipc --socket --tcp --unix --vm --vm-adv --zones --cpufreq --disk-avgqu --disk-avgrq --disk-inflight --disk-svctm --disk-util --mem-percent --output "$path" &

# Capture the background process PID
pid=$!

# Store the PID in a file (replace /tmp/dool.pid with your chosen location)
echo $pid > /tmp/dool.pid

### Buffer of 10 seconds to capture baseline system processes before capturing tool metrics
#sleep 10



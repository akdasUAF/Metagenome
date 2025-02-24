#!/bin/bash

# Check if at least one argument is provided
if [[ $# -eq 0 ]]; then
  echo "Error: Please provide a path as an argument."
  exit 1
fi

path="$1"

tools/analysis/dool/dool -afr --aio --fs --ipc --socket --tcp --unix --vm --vm-adv --zones --cpufreq --disk-avgqu --disk-avgrq --disk-inflight --disk-svctm --disk-util --output "$path" &


pid=$!
echo $pid >> /tmp/dool.pid
exit 0
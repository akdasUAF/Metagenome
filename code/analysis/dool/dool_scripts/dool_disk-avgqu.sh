#!/bin/bash

# Check if at least one argument is provided
if [[ $# -eq 0 ]]; then
  echo "Error: Please provide a path as an argument."
  exit 1
fi

path="$1"

dool --disk-avgqu --output "$path" &

pid=$!
echo $pid >> /tmp/dool.pid
exit 0
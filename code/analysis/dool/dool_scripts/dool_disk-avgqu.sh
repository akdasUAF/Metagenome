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


dool --disk-avgqu --output "$path" &

pid=$!
echo $pid >> /tmp/dool.pid
exit 0
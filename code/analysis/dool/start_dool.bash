#!/bin/bash

# Check if at least one argument is provided
if [[ $# -eq 0 ]]; then
  echo "Error: Please provide a path as an argument."
  exit 1
fi

# Check if filename is empty, use default if so
path="$1"

# Run dool in the background with user-provided filename
dool -a --output "$path" &

# Capture the background process PID
pid=$!

# Store the PID in a file (replace /tmp/dool.pid with your chosen location)
echo $pid > /tmp/dool.pid



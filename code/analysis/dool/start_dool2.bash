#!/bin/bash

# Prompt for user input for the output filename
read -p "Enter the desired output filename (default: report3.csv): " filename

# Check if filename is empty, use default if so
if [[ -z "$filename" ]]; then
  filename="report3.csv"
fi

# Run dool in the background with user-provided filename
dool -a --output "$filename" &

# Capture the background process PID
pid=$!

# Store the PID in a file (replace /tmp/dool.pid with your chosen location)
echo $pid > /tmp/dool.pid

# Script exits here

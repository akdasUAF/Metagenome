#!/bin/bash

## Assembly over, Echo
echo "Assembly over: Waiting before killing"

## Buffer of 10 seconds to capture baseline system processes after capturing tool metrics
sleep 10

# Read PIDs from the file
pids=( $(cat /tmp/dool.pid) )
echo "$pids"

# Loop through PIDs and kill processes
for pid in "${pids[@]}"; do
  if [[ ! -z $pid ]]; then  # Check for empty PID entries
    echo "Killing Dool process (PID: $pid)..."
    kill $pid
  fi
done

# Remove the PID file (optional)
rm /tmp/dool.pid &> /dev/null  # Suppress potential "file not found" error

exit 0

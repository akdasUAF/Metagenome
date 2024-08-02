#!/bin/bash

## Buffer of 10 seconds to capture baseline system processes after capturing tool metrics
sleep 10

# Read PIDs from the file
pids=( $(cat /tmp/dool.pid) )

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

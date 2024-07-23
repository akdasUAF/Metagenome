#!/bin/bash

# Get the PID of dool from the file (replace /tmp/dool.pid with your chosen location)
pid=$(cat /tmp/dool.pid)

# Check if PID is not empty and the file exists
if [[ ! -z $pid ]] && [[ -f /tmp/dool.pid ]]; then
  echo "Killing dool process (PID: $pid)..."
  kill $pid
  rm /tmp/dool.pid
else
  echo "dool PID file not found or PID is empty. dool process might have already finished."
fi


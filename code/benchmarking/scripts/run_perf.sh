#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <process_pid> <log_perf>"
  exit 1
fi

process_pid=$1
log_perf=$2


perf stat -p $process_pid -o $log_perf -e cycles,instructions,cache-misses

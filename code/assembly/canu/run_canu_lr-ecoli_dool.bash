#!/bin/bash
## Assembler: Canu
## Dataset: Long read Ecoli

# /usr/bin/time -v bash -c "source code/assembly/canu/run_canu_lr-ecoli.bash" 2>&1 | tee -a logs/assembly/log_assemble_canu_lr-ecoli.log

pid=$(dool -a --output report3.csv &)
echo "Background dool process started with PID: $pid"

# Wait for 3 seconds (or adjust the wait time as needed)
sleep 3

# Check if the process is still running before killing
if ps -p $pid > /dev/null 2>&1; then
  echo "Killing dool process (PID: $pid)..."
  kill $pid
else
  echo "dool process (PID: $pid) might have already finished."
fi

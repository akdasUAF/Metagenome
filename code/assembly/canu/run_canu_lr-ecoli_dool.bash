#!/bin/bash
## Assembler: Canu
## Dataset: Long read Ecoli

dool -t -a -d 1 --output system_stats.csv

/usr/bin/time -v bash -c "source code/assembly/canu/run_canu_lr-ecoli.bash" 2>&1 | tee -a logs/assembly/log_assemble_canu_lr-ecoli.log

kill -INT $(pgrep dool)
#!/bin/bash

bash code/analysis/dool/start_dool.bash logs/analysis/dool/log_dool_canu_lr-ecoli.log
/usr/bin/time -v bash -c "source code/assembly/canu/run_canu_lr-ecoli.bash" 2>&1 | tee -a logs/assembly/log_assemble_canu_lr-ecoli.log || echo 'Assembly failed : canu lr-ecoli'
bash code/analysis/dool/kill_dool.bash
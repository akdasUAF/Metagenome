#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-soil

./tools/analysis/assembly-stats/build/assembly-stats data/process/flye/lr-soil/assembly.fasta | tee logs/analysis/log_assembly-stats_flye_lr-soil.log
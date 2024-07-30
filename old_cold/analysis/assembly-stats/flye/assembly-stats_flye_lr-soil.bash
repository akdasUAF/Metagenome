#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-soil

mkdir -p data/assembled_MAG//flye/lr-soil/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//flye/lr-soil/assembly.fasta | tee data/assembled_MAG//flye/lr-soil/assembly-stats/assembly-stats_flye_lr-soil.txt
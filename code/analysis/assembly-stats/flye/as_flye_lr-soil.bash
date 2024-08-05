#!/bin/bash
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-soil

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/flye/lr-soil/assembly.fasta | tee data/analysis/flye/lr-soil/assembly-stats_flye_lr-soil.txt

#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: raven
## Dataset: lr-soil

mkdir -p data/process/raven/lr-soil/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/raven/lr-soil/assembly_raven_lr-soil.fasta | tee data/process/raven/lr-soil/assembly-stats/assembly-stats_raven_lr-soil.txt
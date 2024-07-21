#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-soil

mkdir -p data/process/canu/lr-soil/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/canu/lr-soil/lr-soil.contigs.fasta | tee data/process/canu/lr-soil/assembly-stats/assembly-stats_canu_lr-soil.txt
#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-soil

mkdir -p data/assembled_MAG//canu/lr-soil/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//canu/lr-soil/lr-soil.contigs.fasta | tee data/assembled_MAG//canu/lr-soil/assembly-stats/assembly-stats_canu_lr-soil.txt
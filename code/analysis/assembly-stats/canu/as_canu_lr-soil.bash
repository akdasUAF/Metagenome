#!/bin/bash
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-soil

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/canu/lr-soil/lr-soil.contigs.fasta | tee data/analysis/canu/lr-soil/assembly-stats_canu_lr-soil.txt

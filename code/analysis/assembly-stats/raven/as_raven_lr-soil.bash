#!/bin/bash
# Analyzer: assembly-stats
## Assembler: raven
## Dataset: lr-soil

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/raven/lr-soil/assembly_raven_lr-soil.fasta | tee data/analysis/raven/lr-soil/assembly-stats_raven_lr-soil.txt

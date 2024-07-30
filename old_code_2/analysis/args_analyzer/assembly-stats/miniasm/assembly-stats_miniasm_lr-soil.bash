#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: raven
## Dataset: lr-soil

mkdir -p data/assembled_MAG//raven/lr-soil/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//raven/lr-soil/polished_assembly_minimap_lr-soil.fa | tee data/assembled_MAG//raven/lr-soil/assembly-stats/assembly-stats_raven_lr-soil.txt
#!/bin/bash
# Analyzer: assembly-stats
## Assembler: miniasm
## Dataset: lr-soil

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/miniasm/lr-soil/polished_assembly_minimap_lr-soil.fasta | tee data/analysis/miniasm/lr-soil/assembly-stats_miniasm_lr-soil.txt

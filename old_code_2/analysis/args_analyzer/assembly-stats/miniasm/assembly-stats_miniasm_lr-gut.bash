#!/bin/bash
# Analyzer: assembly-stats
## Assembler: miniasm
## Dataset: lr-gut

mkdir -p data/assembled_MAG//miniasm/lr-gut/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//miniasm/lr-gut/polished_assembly_minimap_lr-gut.fa | tee data/assembled_MAG//miniasm/lr-gut/assembly-stats/assembly-stats_miniasm_lr-gut.txt
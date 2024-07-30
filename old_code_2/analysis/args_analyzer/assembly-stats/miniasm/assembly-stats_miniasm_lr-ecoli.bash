#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: miniasm
## Dataset: lr-ecoli

mkdir -p data/assembled_MAG//miniasm/lr-ecoli/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//miniasm/lr-ecoli/polished_assembly_minimap_lr-ecoli.fa | tee data/assembled_MAG//miniasm/lr-ecoli/assembly-stats/assembly-stats_miniasm_lr-ecoli.txt
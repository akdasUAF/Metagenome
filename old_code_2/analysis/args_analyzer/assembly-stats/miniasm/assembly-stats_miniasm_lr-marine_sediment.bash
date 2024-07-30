#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: miniasm
## Dataset: lr-marine_sediment

mkdir -p data/assembled_MAG//miniasm/lr-marine_sediment/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//miniasm/lr-marine_sediment/polished_assembly_minimap_lr-marine_sediment.fa | tee data/assembled_MAG//miniasm/lr-marine_sediment/assembly-stats/assembly-stats_miniasm_lr-marine_sediment.txt
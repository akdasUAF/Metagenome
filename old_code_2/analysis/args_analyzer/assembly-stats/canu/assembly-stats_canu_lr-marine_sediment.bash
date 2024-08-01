#!/bin/bash
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-marine_sediment

mkdir -p data/assembled_MAG//canu/lr-marine_sediment/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//canu/lr-marine_sediment/lr-marine_sediment.contigs.fasta | tee data/assembled_MAG//canu/lr-marine_sediment/assembly-stats/assembly-stats_canu_lr-marine_sediment.txt
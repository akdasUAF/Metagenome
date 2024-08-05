#!/bin/bash
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-marine_sediment

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/canu/lr-marine_sediment/lr-marine_sediment.contigs.fasta | tee data/analysis/canu/lr-marine_sediment/assembly-stats_canu_lr-marine_sediment.txt

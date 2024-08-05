#!/bin/bash
# Analyzer: assembly-stats
## Assembler: raven
## Dataset: lr-marine_sediment

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/raven/lr-marine_sediment/assembly_raven_lr-marine_sediment.fasta | tee data/analysis/raven/lr-marine_sediment/assembly-stats_raven_lr-marine_sediment.txt

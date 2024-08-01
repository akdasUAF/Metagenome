#!/bin/bash
# Analyzer: assembly-stats
## Assembler: raven
## Dataset: lr-marine_sediment

mkdir -p data/assembled_MAG//raven/lr-marine_sediment/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//raven/lr-marine_sediment/assembly_raven_lr-marine_sediment.fasta| tee data/assembled_MAG//raven/lr-marine_sediment/assembly-stats/assembly-stats_raven_lr-marine_sediment.txt
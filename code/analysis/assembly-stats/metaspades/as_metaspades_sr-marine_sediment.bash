#!/bin/bash
# Analyzer: assembly-stats
## Assembler: metaspades
## Dataset: sr-marine_sediment

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/metaspades/sr-marine_sediment/contigs.fasta | tee data/analysis/metaspades/sr-marine_sediment/assembly-stats_metaspades_sr-marine_sediment.txt

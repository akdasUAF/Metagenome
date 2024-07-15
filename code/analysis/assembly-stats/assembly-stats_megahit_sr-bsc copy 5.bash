#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: megahit
## Dataset: sr-bsc

./tools/analysis/assembly-stats/build/assembly-stats data/process/megahit/sr-bsc/final.contigs.fa | tee logs/analysis/log_assembly-stats_megahit_sr-bsc.log
#!/bin/bash
## Analyzer: metaquast
## Assembler: abyss
## Dataset: sr-bsc

conda run -n ana_assembly-stats bash code/analysis/assembly-stats/abyss/assembly-stats_abyss_sr-bsc.bash | tee data/process/abyss/sr-bsc/assembly-stats/assembly-stats_abyss_sr-bsc.txt

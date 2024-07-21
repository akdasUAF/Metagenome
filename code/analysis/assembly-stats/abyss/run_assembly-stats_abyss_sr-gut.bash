#!/bin/bash
## Analyzer: metaquast
## Assembler: abyss
## Dataset: sr-gut

conda run -n ana_assembly-stats bash code/analysis/assembly-stats/abyss/assembly-stats_abyss_sr-gut.bash | tee data/process/abyss/sr-gut/assembly-stats/assembly-stats_abyss_sr-gut.txt

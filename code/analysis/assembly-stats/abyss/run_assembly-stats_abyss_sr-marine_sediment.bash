#!/bin/bash
## Analyzer: metaquast
## Assembler: abyss
## Dataset: sr-marine_sediment

conda run -n ana_assembly-stats bash code/analysis/assembly-stats/abyss/assembly-stats_abyss_sr-marine_sediment.bash | tee data/process/abyss/sr-marine_sediment/assembly-stats/assembly-stats_abyss_sr-marine_sediment.txt

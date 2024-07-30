#!/bin/bash
## Analyzer: Megaquast
## Assembler: Megahit
## Dataset: Short Read Marine Sediment

conda run -n ana_metaquast bash code/analysis/quast/megahit/scripts/quast_megahit_sr-marine_sediment.bash | tee logs/analysis/log_quast_megahit_sr-marine_sediment.log


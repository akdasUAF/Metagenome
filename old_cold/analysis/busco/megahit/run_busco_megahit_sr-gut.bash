#!/bin/bash
## Analyzer: Busco
## Assembler: Megahit
## Dataset: Short Read Gut


conda run -n ana_busco bash code/analysis/busco/megahit/scripts/busco_megahit_sr-gut.bash | tee logs/analysis/log_busco_megahit_sr-gut.log

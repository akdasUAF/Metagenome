#!/bin/bash
## Analyzer: Busco
## Assembler: Megahit
## Dataset: Short Read


conda run -n ana_busco bash code/analysis/busco/megahit/scripts/busco_megahit_sr-marine_sediment.bash | tee logs/analysis/log_busco_megahit_sr-marine_sediment.log

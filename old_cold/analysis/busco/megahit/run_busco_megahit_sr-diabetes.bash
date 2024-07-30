#!/bin/bash
## Analyzer: Busco
## Assembler: Megahit
## Dataset: Short Read Diabetes


conda run -n ana_busco bash code/analysis/busco/megahit/scripts/busco_megahit_sr-diabetes.bash | tee -a logs/analysis/log_busco_megahit_sr-diabetes.log

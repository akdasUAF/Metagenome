#!/bin/bash
## Analyzer: Busco
## Assembler: IDBA
## Dataset: Short Read


conda run -n ana_busco bash code/analysis/busco/idba/scripts/busco_idba_sr-diabetes.bash | tee logs/analysis/log_busco_idba_sr-diabetes.log

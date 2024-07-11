#!/bin/bash
## Analyzer: Busco
## Assembler: IDBA
## Dataset: Short Read marine sediment


conda run -n ana_busco bash code/analysis/busco/idba/scripts/busco_idba_sr-marine_sediment.bash | tee logs/analysis/log_busco_idba_sr-marine_sediment.log

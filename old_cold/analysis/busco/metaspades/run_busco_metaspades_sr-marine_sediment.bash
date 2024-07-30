#!/bin/bash
## Analyzer: Busco
## Assembler: metaspades
## Dataset: Short Read marine sediment


conda run -n ana_busco bash code/analysis/busco/metaspades/scripts/busco_metaspades_sr-marine_sediment.bash | tee logs/analysis/log_busco_metaspades_sr-marine_sediment.log


#!/bin/bash
## Assembler: Abyss

conda run -n ana_busco bash code/analysis/busco/abyss/scripts/busco_abyss_sr-bsc.bash | tee logs/analysis/log_busco_abyss_sr-bsc.log

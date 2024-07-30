#!/bin/bash
## Assembler: idba
## This script runs each analysis for an assembler
## If there is a problem with an assembly, comment out the problem set and it won't run

## sr-bsc
bash code/analysis/run_all/idba/analyze_idba_sr-bsc.bash
## sr-diabetes
bash code/analysis/run_all/idba/analyze_idba_sr-diabetes.bash
## sr-gut
bash code/analysis/run_all/idba/analyze_idba_sr-gut.bash
## sr-marine_sediment
bash code/analysis/run_all/idba/analyze_idba_sr-marine_sediment.bash
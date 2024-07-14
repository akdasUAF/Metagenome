#!/bin/bash
## Assembler: abyss
## This script runs each analysis for an assembler

## sr-bsc
bash code/analysis/run_all/abyss/analyze_abyss_sr-bsc.bash || echo "Abyss: sr-bsc: Failed" | tee -a logs/analysis/log_analysis_abyss_sr-bsc.log

## sr-diabetes
# bash code/analysis/run_all/abyss/analyze_abyss_sr-diabetes.bash

## sr-gut
# bash code/analysis/run_all/abyss/analyze_abyss_sr-gut.bash

## sr-marine_sediment
bash code/analysis/run_all/abyss/analyze_abyss_sr-marine_sediment.bash
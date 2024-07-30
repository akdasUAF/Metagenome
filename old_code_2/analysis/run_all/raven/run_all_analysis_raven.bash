#!/bin/bash
## Assembler: raven
## This script runs each analysis for an assembler

## lr-ecoli
bash code/analysis/run_all/raven/analyze_raven_lr-ecoli.bash

## lr-gut
# bash old_code_2/analysis/run_all/raven/analyze_raven_lr-gut.bash

## lr-marine_sediment
bash code/analysis/run_all/raven/analyze_raven_lr-marine_sediment.bash

## lr-soil
bash code/analysis/run_all/raven/analyze_raven_lr-soil.bash

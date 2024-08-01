#!/bin/bash

## Dataset: lr-gut
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622818%5Baccn
## Assembler: canu

mkdir -p data/MAG/canu/lr-gut
mkdir -p data/analysis/canu/lr-gut
./tools/assemblers/canu-2.2/bin/canu -p lr-gut -d data/MAG/canu/lr-gut/ genomeSize=5300000 corOutCoverage=10000 corMhapSensitivity=high corMinCoverage=0 -nanopore data/raw/lr-gut/SRR18491310/SRR18491310.fastq

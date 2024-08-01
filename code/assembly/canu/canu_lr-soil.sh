#!/bin/bash

## Dataset: Long-read Soil
## Uses this dataset:  https://www.ncbi.nlm.nih.gov/sra/SRX17069014%5Baccn
## Assembler: Canu

mkdir -p data/MAG/canu/lr-soil
./tools/assemblers/canu-2.2/bin/canu -p lr-soil -d data/MAG/canu/lr-soil/ genomeSize=1620000 corOutCoverage=10000 corMhapSensitivity=high corMinCoverage=0 -nanopore data/raw/lr-soil/SRR21053856/SRR21053856.fastq
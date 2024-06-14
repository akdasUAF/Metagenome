#!/bin/bash
## Dataset: Long-read Gut
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622818%5Baccn
## Assembler: NECAT
## Part 1

mkdir -p data/process/necat/lr-gut/logs
touch data/process/necat/lr-gut/logs/log_necat_lr-gut_1.txt
{
	tools/assemblers/NECAT/Linux-amd64/bin/necat.pl config bridge data/process/necat/lr-gut/necat_lr-gut_config.pl


} > data/process/necat/lr-gut/logs/log_necat_lr-gut_1.txt


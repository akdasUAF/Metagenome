#!/bin/bash
## Dataset: Short read Diabetes
## Uses this Database:
## Assembler: IBDA-UD


mkdir -p data/process/idba/sr-diabetes

### Setting up reads. They must be in a single fasta and not two fastq
./tools/assemblers/idba/bin/fq2fa --merge --filter data/raw/sr-diabetes/SRR341725/SRR341725_1.fastq data/raw/sr-diabetes/SRR341725/SRR341725_1.fastq data/raw/sr-diabetes/SRR341725/SRR341725_combined.fasta > data/process/idba/sr-diabetes/logs/log_idba_sr-diabetes.txt



tools/assemblers/idba/bin/idba_ud -r data/raw/sr-diabetes/SRR341725/SRR341725_combined.fasta -o data/process/idba_ud/sr-diabetes/
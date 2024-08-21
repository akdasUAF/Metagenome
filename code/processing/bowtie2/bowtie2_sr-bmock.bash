#!/bin/bash

$BT2_HOME/bowtie2 -x lambda_virus -1 $BT2_HOME/example/reads/reads_1.fq -2 $BT2_HOME/example/reads/reads_2.fq -S eg2.sam
bowtie2 -x 

bowtie2 -x data/process/sr-bsc/ -1 data/process/sr-bsc/trimmed/*_1.fastq -2 data/process/sr-bsc/trimmed/*_2.fastq -S data/process/sr-bsc/sr-bsc.sam

bowtie2-build data/MAG/megahit/sr-bsc/final.contigs.fa data/process/sr-bsc/contigs
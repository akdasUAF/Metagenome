#!/bin/bash

bowtie2 -x ecoli -1 SAMPLE_R1.fastq -2 SAMPLE_R2.fastq  --no-unal -p 12 -S SAMPLE.sam

  -1              read 1 of paired reads

  -2              read 2 of paired reads

  --no-unal       ignore reads that failed to align

  -p 12          use up to 12 parallel processors

  -S SAMPLE.sam   write bowtie2 output in SAM format to file SAMPLE.sam
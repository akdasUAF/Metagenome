#!/bin/bash

trimmomatic PE -threads 24 data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq data/process/sr-bsc/sr-bsc_trimmed_1.fastq data/process/sr-bsc/sr-bsc_trimmed_1.fastq LEADING:15 TRAILING:239 TruSeq3-PE-2 ILLUMINACLIP:TruSeq3-PE-2

       PE [-version] [-threads <threads>] [-phred33|-phred64] [-trimlog <trimLogFile>] [-summary <statsSummaryFile>] [-quiet] [-validatePairs] [-basein <inputBase> | <inputFile1> <inputFile2>] [-baseout <outputBase> | <outputFile1P> <outputFile1U> <outputFile2P> <outputFile2U>] <trimmer1>...
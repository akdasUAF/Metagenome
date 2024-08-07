
scp wwinnett@137.229.25.190:metagenome_replicates/full_datasets/Metagenome/data/analysis/sr-bsc/fastqc/SRR*/*.html ../Moving/fastqc/


scp wwinnett@137.229.25.190:metagenome_replicates/full_datasets/Metagenome/data/analysis/sr-bsc/trimmed_fastqc_round2/fastqc/SRR*/*.html ../Moving/fastqc/round_2

scp wwinnett@137.229.25.190:metagenome_replicates/full_datasets/Metagenome/data/analysis/sr-ms/fastqc/SRR*/*.html ../Moving/fastqc/sr-ms/round1


mkdir ../Moving/fastqc/round_2


  trimmomatic PE -threads 24 data/raw/sr-ms/forward/SRR27456520_1.fastq data/raw/sr-ms/reverse/SRR27456520_2.fastq data/process/sr-ms/trimmed/sr-ms_trimmed_SRR27456520_1.fastq data/process/sr-ms/trimmed/sr-ms_trimmed_SRR27456520_1.fastq.unpaired data/process/sr-ms/trimmed/sr-ms_trimmed_SRR27456520_2.fastq data/process/sr-ms/trimmed/sr-ms_trimmed_SRR27456520_2.fastq.unpaired LEADING:5 TRAILING:5 SLIDINGWINDOW:4:15 MINLEN:36 

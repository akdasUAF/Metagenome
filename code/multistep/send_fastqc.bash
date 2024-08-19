
scp wwinnett@137.229.25.190:metagenome_replicates/full_datasets/Metagenome/data/analysis/sr-bsc/fastqc/SRR*/*.html ../Moving/fastqc/


scp wwinnett@137.229.25.190:metagenome_replicates/full_datasets/Metagenome/data/analysis/sr-bsc/trimmed_fastqc_round2/fastqc/SRR*/*.html ../Moving/fastqc/round_2

scp wwinnett@137.229.25.190:metagenome_replicates/full_datasets/Metagenome/data/analysis/sr-ms/fastqc/SRR*/*.html ../Moving/fastqc/sr-ms/round1


mkdir ../Moving/fastqc/round_2


  trimmomatic PE -threads 24 data/raw/sr-ms/forward/SRR27456520_1.fastq data/raw/sr-ms/reverse/SRR27456520_2.fastq data/process/sr-ms/trimmed/sr-ms_trimmed_SRR27456520_1.fastq data/process/sr-ms/trimmed/sr-ms_trimmed_SRR27456520_1.fastq.unpaired data/process/sr-ms/trimmed/sr-ms_trimmed_SRR27456520_2.fastq data/process/sr-ms/trimmed/sr-ms_trimmed_SRR27456520_2.fastq.unpaired LEADING:5 TRAILING:5 SLIDINGWINDOW:4:15 MINLEN:36 



scp wwinnett@chinook04.alaska.edu:metagenome_replicates/full_dataset/Metagenome/data/analysis/sr-ms/trimmed_fastqc_round2/fastqc/*/*.html ../Moving/fastqc/sr-ms/round2


scp wwinnett@137.229.25.190:metagenome_replicates/full_datasets/Metagenome/data/analysis/sr-ms/*_report.html ../Moving/fastp/sr-ms/



scp wwinnett@chinook04.alaska.edu:metagenome_replicates/test/Metagenome/data/analysis/metaspades/sr-marine_sediment/dool_asm_metaspades_sr-marine_sediment.csv ../Moving/


fastp -i data/raw/sr-bmock/SRR8073716/SRR8073716_1.fastq -I data/raw/sr-bmock/SRR8073716/SRR8073716_2.fastq -o data/process/sr-bmock/trimmed/sr-bmock_SRR8073716_1.fastq -O data/process/sr-bmock/trimmed/sr-bmock_SRR8073716_2.fastq -h data/analysis/sr-bmock -q 20 -p 95 -l 30 -n 10

rsync -avz wwinnett@chinook04.alaska.edu:metagenome_replicates/test/Metagenome/data/process/sr-bmock/trimmed/ data/process/sr-bmock/trimmed/
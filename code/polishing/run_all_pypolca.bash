
#### Megahit
# sr-even 
sbatch code/polishing/run_pypolca.batch "data/megahit/sr-even/final.contigs.fa" "data/raw/sr-even/sr-even_trimmed_1.fastq" "data/raw/sr-even/sr-even_trimmed_2.fastq" "megahit_sr-even_polished"

# sr-log
R1_FILES="data/raw/sr-log/SRR18488969_1.fastq,data/raw/sr-log/SRR18488971_1.fastq,data/raw/sr-log/SRR18488973_1.fastq"
R2_FILES="data/raw/sr-log/SRR18488969_2.fastq,data/raw/sr-log/SRR18488971_2.fastq,data/raw/sr-log/SRR18488973_2.fastq"
sbatch code/polishing/run_pypolca.batch "data/megahit/sr-log/final.contigs.fa" "data/raw/sr-log/sr-log_trimmed_1.fastq" "data/raw/sr-log/sr-log_trimmed_2.fastq" "megahit_sr-elog_polished"

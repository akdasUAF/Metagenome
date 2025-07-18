

### sr-even
sbatch code/processing/fastp/run_fastp.batch \
    sr-even \
    data/raw/sr-even/sr-even_trimmed_1.fastq \
    data/raw/sr-even/sr-even_trimmed_2.fastq \
    test1


### sr-log
sbatch code/processing/fastp/run_fastp.batch \
    SRR18488969 \
    data/raw/sr-log/SRR18488969_1.fastq \
    data/raw/sr-log/SRR18488969_2.fastq \
    test1

sbatch code/processing/fastp/run_fastp.batch \
    SRR18488971 \
    data/raw/sr-log/SRR18488971_1.fastq \
    data/raw/sr-log/SRR18488971_2.fastq \
    test1


sbatch code/processing/fastp/run_fastp.batch \
    SRR18488973 \
    data/raw/sr-log/SRR18488973_1.fastq \
    data/raw/sr-log/SRR18488973_2.fastq \
    test1

### sr-ms
sbatch code/processing/fastp/run_fastp.batch \
    sr-ms \
    data/raw/sr-ms/raw/sr-ms_raw_1.fastq \
    data/raw/sr-ms/raw/sr-ms_raw_2.fastq \
    test1

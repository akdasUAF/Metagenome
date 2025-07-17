### ASssembly location
## Megahit
# sr-even: data/megahit/sr-even/final.contigs.fa
# sr-log: data/megahit/sr-log/final.contigs.fa
# sr-ms: data/megahit/sr-ms/final.contigs.fa # ASSUMED PATH, user provided sr-even path
# cami-low: data/megahit/cami-low/final.contigs.fa # ASSUMED PATH
# cami-high: data/megahit/cami-high/final.contigs.fa # ASSUMED PATH
# cami-medium: data/megahit/cami-medium/final.contigs.fa # ASSUMED PATH

## Metaspades
# sr-even: data/metaspades/sr-even/contigs.fasta
# sr-log: data/metaspades/sr-log/contigs.fasta # ASSUMED PATH
# sr-ms: data/metaspades/sr-ms/contigs.fasta # ASSUMED PATH
# cami-low: data/metaspades/cami-low/contigs.fasta # ASSUMED PATH
# cami-high: data/metaspades/cami-high/contigs.fasta # CORRECTED PATH (was pointing to megahit path)
# cami-medium: data/metaspades/cami-medium/contigs.fasta # ASSUMED PATH

## Unicycler
# sr-even: data/unicycler/sr-even/assembly.fasta
# sr-log: data/unicycler/sr-log/assembly.fasta
# sr-ms: data/unicycler/sr-ms/assembly.fasta # ASSUMED PATH
# cami-low: data/unicycler/cami-low/assembly.fasta # ASSUMED PATH
# cami-high: data/unicycler/cami-high/assembly.fasta # ASSUMED PATH
# cami-medium: data/unicycler/cami-medium/assembly.fasta # ASSUMED PATH


### Raw location
# sr-even: "data/raw/sr-even/sr-even_trimmed_1.fastq" "data/raw/sr-even/sr-even_trimmed_2.fastq"
# sr-log: "data/raw/sr-log/SRR18488969_1.fastq,data/raw/sr-log/SRR18488971_1.fastq,data/raw/sr-log/SRR18488973_1.fastq" "data/raw/sr-log/SRR18488969_2.fastq,data/raw/sr-log/SRR18488971_2.fastq,data/raw/sr-log/SRR18488973_2.fastq"
# sr-ms: "data/raw/sr-ms/sr-ms_trimmed_1.fastq" "data/raw/sr-ms/sr-ms_trimmed_2.fastq"
# cami-low: "data/raw/cami-low/cami-low_trimmed.fastq.gz" # Single file - see warning above
# cami-high: "data/raw/cami-high/cami-high_trimmed.fastq.gz" # Single file - see warning above
# cami-medium: "data/raw/cami-medium/cami-medium_trimmed_1.fastq.gz" "data/raw/cami-medium/cami-medium_trimmed_2.fastq.gz"


#### Megahit
# sr-even - COMPLETE
sbatch code/polishing/run_polypolish.bash \
    "data/polished/megahit_sr-even_polished/pypolca_corrected.fasta" \
    "data/raw/sr-even/sr-even_trimmed_1.fastq" \
    "data/raw/sr-even/sr-even_trimmed_2.fastq" \
    "pypolca_megahit_sr-even_polypolished"

# sr-log - COMPLETE
sbatch code/polishing/run_pypolca.batch \
    "data/megahit/sr-log/final.contigs.fa" \
    "data/raw/sr-log/SRR18488969_1.fastq,data/raw/sr-log/SRR18488971_1.fastq,data/raw/sr-log/SRR18488973_1.fastq" \
    "data/raw/sr-log/SRR18488969_2.fastq,data/raw/sr-log/SRR18488971_2.fastq,data/raw/sr-log/SRR18488973_2.fastq" \
    "megahit_sr-log_polished"

# sr-ms - COMPLETE
sbatch code/polishing/run_pypolca.batch \
    "data/megahit/sr-ms/final.contigs.fa" \
    "data/raw/sr-ms/sr-ms_trimmed_1.fastq" \
    "data/raw/sr-ms/sr-ms_trimmed_2.fastq" \
    "megahit_sr-ms_polished"

# cami-low (WARNING: Assumed paired-end, using same file for R1/R2. Adjust if single-end)
sbatch code/polishing/run_pypolca.batch \
    "data/megahit/cami-low/final.contigs.fa" \
    "data/raw/cami-low/cami-low_trimmed.fastq.gz" \
    "data/raw/cami-low/cami-low_trimmed.fastq.gz" \
    "megahit_cami-low_polished"

# cami-high (WARNING: Assumed paired-end, using same file for R1/R2. Adjust if single-end)
sbatch code/polishing/run_pypolca.batch \
    "data/megahit/cami-high/final.contigs.fa" \
    "data/raw/cami-high/cami-high_trimmed.fastq.gz" \
    "data/raw/cami-high/cami-high_trimmed.fastq.gz" \
    "megahit_cami-high_polished"

# cami-medium - BROKEN
sbatch code/polishing/run_pypolca.batch \
    "data/megahit/cami-medium/final.contigs.fa" \
    "data/raw/cami-medium/cami-medium_trimmed_1.fastq.gz" \
    "data/raw/cami-medium/cami-medium_trimmed_2.fastq.gz" \
    "megahit_cami-medium_polished"


#### Metaspades
# sr-even - COMPLETE
sbatch code/polishing/run_pypolca.batch \
    "data/metaspades/sr-even/contigs.fasta" \
    "data/raw/sr-even/sr-even_trimmed_1.fastq" \
    "data/raw/sr-even/sr-even_trimmed_2.fastq" \
    "metaspades_sr-even_polished"

# sr-log - COMPLETE
sbatch code/polishing/run_pypolca.batch \
    "data/metaspades/sr-log/contigs.fasta" \
    "data/raw/sr-log/SRR18488969_1.fastq,data/raw/sr-log/SRR18488971_1.fastq,data/raw/sr-log/SRR18488973_1.fastq" \
    "data/raw/sr-log/SRR18488969_2.fastq,data/raw/sr-log/SRR18488971_2.fastq,data/raw/sr-log/SRR18488973_2.fastq" \
    "metaspades_sr-log_polished"

# sr-ms - COMPLETE
sbatch code/polishing/run_pypolca.batch \
    "data/metaspades/sr-ms/contigs.fasta" \
    "data/raw/sr-ms/sr-ms_trimmed_1.fastq" \
    "data/raw/sr-ms/sr-ms_trimmed_2.fastq" \
    "metaspades_sr-ms_polished"

# cami-low (WARNING: Assumed paired-end, using same file for R1/R2. Adjust if single-end)
sbatch code/polishing/run_pypolca.batch \
    "data/metaspades/cami-low/contigs.fasta" \
    "data/raw/cami-low/cami-low_trimmed.fastq.gz" \
    "data/raw/cami-low/cami-low_trimmed.fastq.gz" \
    "metaspades_cami-low_polished"

# cami-high (WARNING: Assumed paired-end, using same file for R1/R2. Adjust if single-end)
sbatch code/polishing/run_pypolca.batch \
    "data/metaspades/cami-high/contigs.fasta" \
    "data/raw/cami-high/cami-high_trimmed.fastq.gz" \
    "data/raw/cami-high/cami-high_trimmed.fastq.gz" \
    "metaspades_cami-high_polished"

# cami-medium
sbatch code/polishing/run_pypolca.batch \
    "data/metaspades/cami-medium/contigs.fasta" \
    "data/raw/cami-medium/cami-medium_trimmed_1.fastq.gz" \
    "data/raw/cami-medium/cami-medium_trimmed_2.fastq.gz" \
    "metaspades_cami-medium_polished"


#### Unicycler
# sr-even - COMPLETE
sbatch code/polishing/run_pypolca.batch \
    "data/unicycler/sr-even/assembly.fasta" \
    "data/raw/sr-even/sr-even_trimmed_1.fastq" \
    "data/raw/sr-even/sr-even_trimmed_2.fastq" \
    "unicycler_sr-even_polished"

# sr-log - COMPLETE
sbatch code/polishing/run_pypolca.batch \
    "data/unicycler/sr-log/assembly.fasta" \
    "data/raw/sr-log/SRR18488969_1.fastq,data/raw/sr-log/SRR18488971_1.fastq,data/raw/sr-log/SRR18488973_1.fastq" \
    "data/raw/sr-log/SRR18488969_2.fastq,data/raw/sr-log/SRR18488971_2.fastq,data/raw/sr-log/SRR18488973_2.fastq" \
    "unicycler_sr-log_polished"

# sr-ms
sbatch code/polishing/run_pypolca.batch \
    "data/unicycler/sr-ms/assembly.fasta" \
    "data/raw/sr-ms/sr-ms_trimmed_1.fastq" \
    "data/raw/sr-ms/sr-ms_trimmed_2.fastq" \
    "unicycler_sr-ms_polished"

# cami-low (WARNING: Assumed paired-end, using same file for R1/R2. Adjust if single-end)
sbatch code/polishing/run_pypolca.batch \
    "data/unicycler/cami-low/assembly.fasta" \
    "data/raw/cami-low/cami-low_trimmed.fastq.gz" \
    "data/raw/cami-low/cami-low_trimmed.fastq.gz" \
    "unicycler_cami-low_polished"

# cami-high (WARNING: Assumed paired-end, using same file for R1/R2. Adjust if single-end)
sbatch code/polishing/run_pypolca.batch \
    "data/unicycler/cami-high/assembly.fasta" \
    "data/raw/cami-high/cami-high_trimmed.fastq.gz" \
    "data/raw/cami-high/cami-high_trimmed.fastq.gz" \
    "unicycler_cami-high_polished"

# cami-medium
sbatch code/polishing/run_pypolca.batch \
    "data/unicycler/cami-medium/assembly.fasta" \
    "data/raw/cami-medium/cami-medium_trimmed_1.fastq.gz" \
    "data/raw/cami-medium/cami-medium_trimmed_2.fastq.gz" \
    "unicycler_cami-medium_polished"
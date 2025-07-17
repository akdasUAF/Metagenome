### Corrected location
## Megahit
# sr-even: data/polished/megahit_sr-even_polished/pypolca_corrected.fasta
# sr-log: 
# sr-ms: 
# cami-low: 
# cami-high: 
# cami-medium: 

## Metaspades
# sr-even: data/polished/metaspades_sr-even_polished/pypolca_corrected.fasta
# sr-log: 
# sr-ms: 
# cami-low: 
# cami-high: 
# cami-medium: 

## Unicycler
# sr-even: data/polished/metaspades_sr-even_polished/pypolca_corrected.fasta
# sr-log: 
# sr-ms: 
# cami-low: 
# cami-high: 
# cami-medium: 


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




**#### Megahit Assemblies (Polished with Polypolish from pypolca output)**

# sr-even 431257
sbatch code/polishing/run_polypolish.bash "data/polished/megahit_sr-even_polished/pypolca_corrected.fasta" "data/raw/sr-even/sr-even_trimmed_1.fastq" "data/raw/sr-even/sr-even_trimmed_2.fastq" "pypolca_megahit_sr-even_polypolished"

# sr-log - 431260
sbatch code/polishing/run_polypolish.bash "data/polished/megahit_sr-log_polished/pypolca_corrected.fasta" "data/raw/sr-log/SRR18488969_1.fastq,data/raw/sr-log/SRR18488971_1.fastq,data/raw/sr-log/SRR18488973_1.fastq" "data/raw/sr-log/SRR18488969_2.fastq,data/raw/sr-log/SRR18488971_2.fastq,data/raw/sr-log/SRR18488973_2.fastq" "pypolca_megahit_sr-log_polypolished"

# sr-ms - 431260
sbatch code/polishing/run_polypolish.bash "data/polished/megahit_sr-ms_polished/pypolca_corrected.fasta" "data/raw/sr-ms/sr-ms_trimmed_1.fastq" "data/raw/sr-ms/sr-ms_trimmed_2.fastq" "pypolca_megahit_sr-ms_polypolished"

# cami-low (Single-End Reads)
sbatch code/polishing/run_polypolish.bash "data/polished/megahit_cami-low_polished/pypolca_corrected.fasta" "data/raw/cami-low/cami-low_trimmed.fastq.gz" "" "pypolca_megahit_cami-low_polypolished"

# cami-high (Single-End Reads)
sbatch code/polishing/run_polypolish.bash "data/polished/megahit_cami-high_polished/pypolca_corrected.fasta" "data/raw/cami-high/cami-high_trimmed.fastq.gz" "" "pypolca_megahit_cami-high_polypolished"

# cami-medium
sbatch code/polishing/run_polypolish.bash "data/polished/megahit_cami-medium_polished/pypolca_corrected.fasta" "data/raw/cami-medium/cami-medium_trimmed_1.fastq.gz" "data/raw/cami-medium/cami-medium_trimmed_2.fastq.gz" "pypolca_megahit_cami-medium_polypolished"




#### Metaspades Assemblies (Polished with Polypolish from pypolca output)**

**# sr-even**
sbatch code/polishing/run_polypolish.bash "data/polished/metaspades_sr-even_polished/pypolca_corrected.fasta" "data/raw/sr-even/sr-even_trimmed_1.fastq" "data/raw/sr-even/sr-even_trimmed_2.fastq" "pypolca_metaspades_sr-even_polypolished"

**# sr-log**
sbatch code/polishing/run_polypolish.bash "data/polished/metaspades_sr-log_polished/pypolca_corrected.fasta" "data/raw/sr-log/SRR18488969_1.fastq,data/raw/sr-log/SRR18488971_1.fastq,data/raw/sr-log/SRR18488973_1.fastq" "data/raw/sr-log/SRR18488969_2.fastq,data/raw/sr-log/SRR18488971_2.fastq,data/raw/sr-log/SRR18488973_2.fastq" "pypolca_metaspades_sr-log_polypolished"

**# sr-ms**
sbatch code/polishing/run_polypolish.bash "data/polished/metaspades_sr-ms_polished/pypolca_corrected.fasta" "data/raw/sr-ms/sr-ms_trimmed_1.fastq" "data/raw/sr-ms/sr-ms_trimmed_2.fastq" "pypolca_metaspades_sr-ms_polypolished"

**# cami-low (Single-End Reads)**
sbatch code/polishing/run_polypolish.bash "data/polished/metaspades_cami-low_polished/pypolca_corrected.fasta" "data/raw/cami-low/cami-low_trimmed.fastq.gz" "" "pypolca_metaspades_cami-low_polypolished"

**# cami-high (Single-End Reads)**
sbatch code/polishing/run_polypolish.bash "data/polished/metaspades_cami-high_polished/pypolca_corrected.fasta" "data/raw/cami-high/cami-high_trimmed.fastq.gz" "" "pypolca_metaspades_cami-high_polypolished"

**# cami-medium**
sbatch code/polishing/run_polypolish.bash "data/polished/metaspades_cami-medium_polished/pypolca_corrected.fasta" "data/raw/cami-medium/cami-medium_trimmed_1.fastq.gz" "data/raw/cami-medium/cami-medium_trimmed_2.fastq.gz" "pypolca_metaspades_cami-medium_polypolished"

---

**#### Unicycler Assemblies (Polished with Polypolish from pypolca output)**

**# sr-even**
sbatch code/polishing/run_polypolish.bash "data/polished/unicycler_sr-even_polished/pypolca_corrected.fasta" "data/raw/sr-even/sr-even_trimmed_1.fastq" "data/raw/sr-even/sr-even_trimmed_2.fastq" "pypolca_unicycler_sr-even_polypolished"

**# sr-log**
sbatch code/polishing/run_polypolish.bash "data/polished/unicycler_sr-log_polished/pypolca_corrected.fasta" "data/raw/sr-log/SRR18488969_1.fastq,data/raw/sr-log/SRR18488971_1.fastq,data/raw/sr-log/SRR18488973_1.fastq" "data/raw/sr-log/SRR18488969_2.fastq,data/raw/sr-log/SRR18488971_2.fastq,data/raw/sr-log/SRR18488973_2.fastq" "pypolca_unicycler_sr-log_polypolished"

**# sr-ms**
sbatch code/polishing/run_polypolish.bash "data/polished/unicycler_sr-ms_polished/pypolca_corrected.fasta" "data/raw/sr-ms/sr-ms_trimmed_1.fastq" "data/raw/sr-ms/sr-ms_trimmed_2.fastq" "pypolca_unicycler_sr-ms_polypolished"

**# cami-low (Single-End Reads)**
sbatch code/polishing/run_polypolish.bash "data/polished/unicycler_cami-low_polished/pypolca_corrected.fasta" "data/raw/cami-low/cami-low_trimmed.fastq.gz" "" "pypolca_unicycler_cami-low_polypolished"

**# cami-high (Single-End Reads)**
sbatch code/polishing/run_polypolish.bash "data/polished/unicycler_cami-high_polished/pypolca_corrected.fasta" "data/raw/cami-high/cami-high_trimmed.fastq.gz" "" "pypolca_unicycler_cami-high_polypolished"

**# cami-medium**
sbatch code/polishing/run_polypolish.bash "data/polished/unicycler_cami-medium_polished/pypolca_corrected.fasta" "data/raw/cami-medium/cami-medium_trimmed_1.fastq.gz" "data/raw/cami-medium/cami-medium_trimmed_2.fastq.gz" "pypolca_unicycler_cami-medium_polypolished"
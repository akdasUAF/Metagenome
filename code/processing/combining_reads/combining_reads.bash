

./tools/assemblers/idba/bin/fq2fa --merge --filter data/raw/sr-even/sr-even_1_trimmed.fastq data/raw/sr-even/sr-even_2_trimmed.fastq data/raw/sr-even/sr-even_raw_combined.fasta


awk 'BEGIN {i=0} /^>/ { if (i % 2 == 0) { print $0 " /1"; } else { print $0 " /2"; } i++; next } { print $0 }' data/raw/sr-even/sr-even_raw_combined.fasta > data/raw/sr-even/sr-even_raw_combined_paired.fasta
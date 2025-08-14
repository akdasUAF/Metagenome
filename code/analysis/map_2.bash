






sbatch code/analysis/map_contigs_to_reads.batch \
  lr-even \
  canu \
  test3 \
  data/raw/lr-even/lr-even_raw.fastq \
  data/canu/lr-even/test3/test3.contigs.fasta \
  data/raven/lr-ms/test3/map/raven_lr-ms_test3_mapped_sorted.bam

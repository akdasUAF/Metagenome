#!/usr/bin/env bash
set -euo pipefail

# Parameters
datasets=(lr-even lr-log lr-ms)
assemblers=(metaflye canu raven)
tests=(test1 test2 test3 test4 test5)

for dataset in "${datasets[@]}"; do
  for assembler in "${assemblers[@]}"; do
    for test in "${tests[@]}"; do

      raw_fastq="data/raw/${dataset}/${dataset}_raw.fastq"
      contigs_fasta="data/${assembler}/${dataset}/${test}/medaka_consensus_simple_run/consensus.fasta"
      bam="data/${assembler}/${dataset}/${test}/map/${assembler}_${dataset}_${test}_mapped_sorted.bam"

      # Check that inputs exist before submitting
      if [[ ! -f "${raw_fastq}" ]]; then
        echo "Missing raw FASTQ: ${raw_fastq}, skipping."
        continue
      fi
      if [[ ! -f "${contigs_fasta}" ]]; then
        echo "Missing contigs FASTA: ${contigs_fasta}, skipping."
        continue
      fi
      if [[ ! -f "${bam}" ]]; then
        echo "Missing BAM: ${bam}, skipping."
        continue
      fi

      sbatch code/analysis/map_contigs_to_reads2.batch \
        "${dataset}" \
        "${assembler}" \
        "${test}" \
        "${raw_fastq}" \
        "${contigs_fasta}" \
        "${bam}"

    done
  done
done

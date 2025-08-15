#!/usr/bin/env bash
set -euo pipefail

# Parameters
datasets=(lr-even lr-log lr-ms)
assemblers=(metaflye canu raven)
tests=(test1 test2 test3 test4 test5)

for dataset in "${datasets[@]}"; do
  for assembler in "${assemblers[@]}"; do
    for test in "${tests[@]}"; do

	  raw_reads="data/raw/${dataset}/${dataset}_raw.fastq"
      contigs_fasta="data/${assembler}/${dataset}/${test}/medaka_consensus_simple_run/consensus.fasta"
	  reference_fasta="data/reference/${dataset}/${dataset}_reference_cat.fasta"


      # Check that inputs exist before submitting
      if [[ ! -f "${raw_reads}" ]]; then
        echo "Missing contigs FASTA: ${raw_reads}, skipping."
        continue
      fi

	  # Check that inputs exist before submitting
      if [[ ! -f "${contigs_fasta}" ]]; then
        echo "Missing contigs FASTA: ${contigs_fasta}, skipping."
        continue
      fi

	  # Check that inputs exist before submitting
      if [[ ! -f "${reference_fasta}" ]]; then
        echo "Missing contigs FASTA: ${reference_fasta}, skipping."
        continue
      fi

      sbatch code/analysis/semibin2.batch \
	  	${dataset} \
		${assembler} \
		${test} \
		${raw_reads} \
		${contigs_fasta} \
		${reference_fasta}

    done
  done
done
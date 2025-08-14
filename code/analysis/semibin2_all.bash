#!/usr/bin/env bash
set -euo pipefail

# Parameters
datasets=(lr-even lr-log lr-ms)
assemblers=(metaflye canu raven)
tests=(test1 test2 test3 test4 test5)

for dataset in "${datasets[@]}"; do
  for assembler in "${assemblers[@]}"; do
    for test in "${tests[@]}"; do

      contigs_fasta="data/${assembler}/${dataset}/${test}/medaka_consensus_simple_run/consensus.fasta"

      # Check that inputs exist before submitting
      if [[ ! -f "${contigs_fasta}" ]]; then
        echo "Missing contigs FASTA: ${contigs_fasta}, skipping."
        continue
      fi

      sbatch code/analysis/semibin2.batch \
	  	${datasets} \
		${assembler} \
		${run} \
		${contigs_fasta}

    done
  done
done
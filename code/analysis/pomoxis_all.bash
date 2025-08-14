#!/usr/bin/env bash
set -euo pipefail

# Parameters
datasets=(lr-even lr-log lr-ms)
assemblers=(metaflye canu raven)
tests=(test1 test2 test3 test4 test5)

for dataset in "${datasets[@]}"; do

    # Assign reference FASTA according to dataset
    case "${dataset}" in
        lr-even)
            reference_fasta="data/reference/lr-even/lr-even_reference_cat.fasta"
            ;;
        lr-log)
            reference_fasta="data/reference/lr-log/lr-log_reference_cat.fasta"
            ;;
        lr-ms)
            reference_fasta="data/reference/lr-ms/lr-ms_reference_cat.fasta"
            ;;
        *)
            echo "Unknown dataset ${dataset}, skipping."
            continue
            ;;
    esac

    # Verify reference exists
    if [[ ! -f "${reference_fasta}" ]]; then
        echo "Missing reference FASTA: ${reference_fasta}, skipping dataset ${dataset}."
        continue
    fi

  for assembler in "${assemblers[@]}"; do
    for test in "${tests[@]}"; do

      contigs_fasta="data/${assembler}/${dataset}/${test}/medaka_consensus_simple_run/consensus.fasta"

      # Check that inputs exist before submitting
      if [[ ! -f "${contigs_fasta}" ]]; then
        echo "Missing contigs FASTA: ${contigs_fasta}, skipping."
        continue
      fi


      sbatch code/analysis/pomoxis.batch \
	  	${dataset} \
		${assembler} \
		${test} \
		${contigs_fasta} \
		${reference_fasta}

    done
  done
done






 

data/${assembler}/${dataset}/${test}/


#!/usr/bin/env bash
set -euo pipefail

# Parameters
datasets=(sr-even sr-log)
assemblers=(megahit metaspades unicycler)
tests=(test1 test2 test3 test4 test5)

for dataset in "${datasets[@]}"; do
  for assembler in "${assemblers[@]}"; do
    for test in "${tests[@]}"; do

      # Determine the assembly output filename based on the assembler
      case "${assembler}" in
        metaspades)
          assembly_pre_fasta="data/${assembler}/${dataset}/${test}/contigs.fasta"
          ;;
        megahit)
          assembly_pre_fasta="data/${assembler}/${dataset}/${test}/final.contigs.fa"
          ;;
        unicycler)
          assembly_pre_fasta="data/${assembler}/${dataset}/${test}/assembly.fasta"
          ;;
        *)
          assembly_pre_fasta="data/${assembler}/${dataset}/${test}/filtered.fasta"
          ;;
      esac

      echo "Using assembly file: ${assembly_pre_fasta}"



      assembly_post_fasta="data/${assembler}/${dataset}/${test}/${assembler}_${dataset}_${test}_final-contigs.fasta

      sbatch code/analysis/map_contigs_to_reads2.batch \
        ${assembly_pre_fasta} \
        ${assembly_post_fasta}

    done
  done
done

#!/bin/bash
## Dataset: lr-bd
## Uses this dataset: 
## Assembler: miniasm


if [ $# -ne 3 ]; then
  echo "Usage: $0 <reads_in> <MAG_directory> <dataset"
  exit 1
fi

reads_in=$1
path_output=$2
dataset=$3

overlap="${path_output}/overlap_minimap_${dataset}.paf"
assembly="${path_output}/assembly_miniasm_${dataset}.gfa"
polished="${$path_output}/polished_miniasm_${dataset}.gfa"
contigs="${path_output}/${dataset}_miniasm_contigs.fasta"

log_overlap="${path_output}/log_overlap_${dataset}.log"
log_assembly="${path_output}/log_assembly_${dataset}.log"
log_polish="${path_output}/log_polish_${dataset}.log"
log_contigs="${path_output}/log_contigs_${dataset}.log"


echo "reads_in: $reads_in"
echo "path_output: $path_output"
echo "dataset: $dataset"
echo "overlap: $overlap"
echo "assembly: $assembly"
echo "polished: $polished"
echo "contigs: $contigs"
echo "log_overlap: $log_overlap"
echo "log_assembly: $log_assembly"
echo "log_polish: $log_polish"
echo "log_contigs: $log_contigs"


./tools/assemblers/minimap2/minimap2 -x ava-ont $reads_in $reads_in > $overlap | tee $log_overlap
./tools/assemblers/miniasm/miniasm -f $reads_in $overlap > $assembly | tee $log_assembly
minipolish -t 24 $reads_in $assembly > $polished | tee $log_polish

bash code/processing/convert_gfa_to_fasta.bash $polished $contigs | tee $log_contigs

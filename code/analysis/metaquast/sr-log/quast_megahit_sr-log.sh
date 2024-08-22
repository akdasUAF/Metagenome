#!/bin/env bash
## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: sr-log
## Uses this dataset: 
## Analyzer: METAQUAST
benchmark_script="code/analysis/metaquast/run_metaquast.bash"
path_megahit="code/assembly/megahit/run_megahit.sh"
path_contigs="data/sr-log/megahit/final.contigs.fa"
path_output="data/sr-log/"
dataset="sr-log"
assembler="megahit"

### Metaquast only
path_reference="code/analysis/metaquast/sr-bmock/sr-bmock_reference_paths.txt"


### 
references="$(cat $path_reference)"

quast_output=${path_output}/quast/${assembler}
path_log="${path_output}/log/log_quast_${assembler}_${dataset}.log"

mkdir -p $quast_output
mkdir -p $path_output/log/
###

echo $path_contigs
echo $quast_output
echo $references
echo $path_log

# Construct the command to be executed
command="$path_megahit $path_contigs $quast_output $references $path_log"
echo $command

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $assembler

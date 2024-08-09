#!/bin/bash
path_megahit="code/analysis/assembly-stats/run_assembly-stats.sh"
path_assembly="data/MAG/megahit/sr-log/final.contigs.fa"
path_log="data/logs/sr-log/megahit/"
dataset="sr-log"
task="assembly-stats"


path_assembly=$1
path_log_file=$2

mkdir -p ${path_log}
log_file="${path_log}/log_as_${task}_${dataset}.log"


# Construct the command to be executed
command="$path_megahit $path_assembly $MAG_output $log_file"

# Execute the benchmark script with the constructed command
"$command"


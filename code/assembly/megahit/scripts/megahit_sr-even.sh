#!/bin/bash
benchmark_script="code/benchmarking/benchmark.bash"
path_megahit="code/assembly/megahit/run_megahit.sh"
path_forward="data/raw/sr-even/sr-even_1_trimmed.fastq"
path_reverse="data/raw/sr-even/sr-even_2_trimmed.fastq"
path_output="data/megahit/sr-even/"
path_log="data/megahit/logs/sr-even/"
dataset="sr-even"
task="megahit"

mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"


echo "Command to pass to benchmark.bash: ${command}"
echo "Dataset: ${dataset}"
echo "Task: ${task}"

# Execute the benchmark script with the constructed command
bash "$benchmark_script" "$command" "$dataset" "$task"





# declare -r DATASET_ID="$1"          # e.g., lr-even
# declare -r ASSEMBLER_ID="$2"         # e.g., flye
# declare -r RAW_READS_FULLPATH="$3"   # e.g., data/raw/lr-even/lr-even_raw.fastq
# declare -r DRAFT_ASSEMBLY_FULLPATH="$4" # e.g., data/flye/lr-even/assembly.fasta


### Raw reads
# lr-even: data/raw/lr-even/lr-even_raw.fastq
# lr-log: data/raw/lr-log/Zymo-GridION-LOG-BB-SN.fq
# lr-ms: data/raw/lr-ms/lr-ms_raw.fastq



### ASssembly location
## Flye
# lr-even: data/flye/lr-even/assembly.fasta
# lr-log: data/flye/lr-log/assembly.fasta
# lr-ms: data/flye/lr-ms/assembly.fasta

## Canu
# lr-even: data/canu/lr-even/lr-even_task.contigs.fasta
# lr-log: data/canu/lr-log/lr-log_task.contigs.fasta
# lr-ms: data/canu/lr-ms/lr-ms_task.contigs.fasta

## Raven
# lr-even: data/raven/lr-even/assembly_raven_lr-even.fasta
# lr-log: data/raven/lr-log/assembly_raven_lr-log.fasta
# lr-ms: data/raven/lr-ms/assembly_raven_lr-ms.fasta
#root_dir=$(pwd)
#cd tools/polishing/herro/


#scripts/preprocess.sh ${root_dir}/data/raw/lr-even/lr-even_raw.fastq ${root_dir}/temp_out/ 24 1
#scripts/preprocess.sh ${root_dir}/data/raw/lr-ms/lr-ms_raw.fastq ${root_dir}/temp_out/ 24 1







######## FLYE
# 430240
sbatch code/polishing/polish2_lr-even.batch "lr-even" "flye" "data/raw/lr-even/lr-even_raw.fastq" "data/flye/lr-even/assembly.fasta"
# 430241
sbatch code/polishing/polish2_lr-even.batch "lr-log" "flye" "data/raw/lr-log/Zymo-GridION-LOG-BB-SN.fq" "data/flye/lr-log/assembly.fasta"
# 430242
sbatch code/polishing/polish2_lr-even.batch "lr-ms" "flye" "data/raw/lr-ms/lr-ms_raw.fastq" "data/flye/lr-ms/assembly.fasta"



######## CANU
# 430243
sbatch code/polishing/polish2_lr-even.batch "lr-even" "canu" "data/raw/lr-even/lr-even_raw.fastq" "data/canu/lr-even/lr-even_task.contigs.fasta"
# 430244
sbatch code/polishing/polish2_lr-even.batch "lr-log" "canu" "data/raw/lr-log/Zymo-GridION-LOG-BB-SN.fq" "data/canu/lr-log/lr-log_task.contigs.fasta"
# 430251
sbatch code/polishing/polish2_lr-even.batch "lr-ms" "canu" "data/raw/lr-ms/lr-ms_raw.fastq" "data/canu/lr-ms/lr-ms_task.contigs.fasta"



######## RAVEN
# 430246
sbatch code/polishing/polish2_lr-even.batch "lr-even" "raven" "data/raw/lr-even/lr-even_raw.fastq" "data/raven/lr-even/assembly_raven_lr-even.fasta"
# 430247
sbatch code/polishing/polish2_lr-even.batch "lr-log" "raven" "data/raw/lr-log/Zymo-GridION-LOG-BB-SN.fq" "data/raven/lr-log/assembly_raven_lr-log.fasta"
# 430248
sbatch code/polishing/polish2_lr-even.batch "lr-ms" "raven" "data/raw/lr-ms/lr-ms_raw.fastq" "data/raven/lr-ms/assembly_raven_lr-ms.fasta"





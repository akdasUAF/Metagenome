


declare -r DATASET_ID="$1"          # e.g., lr-even
declare -r ASSEMBLER_ID="$2"         # e.g., flye
declare -r RAW_READS_FULLPATH="$3"   # e.g., data/raw/lr-even/lr-even_raw.fastq
declare -r DRAFT_ASSEMBLY_FULLPATH="$4" # e.g., data/flye/lr-even/assembly.fasta

sbatch code/polishing/polish.batch "lr-even" "flye" "data/raw/lr-even/lr-even_raw.fastq" "data/flye/lr-even/assembly.fasta"
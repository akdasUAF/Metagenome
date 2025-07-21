
sbatch << EOF
#!/bin/bash
#SBATCH --partition=t1small        # Adjust as needed (e.g., highmem, if you have it)
#SBATCH --ntasks=1                 # Total number of tasks
#SBATCH --cpus-per-task=24         # Number of CPU cores for Herro (corresponds to -t in Herro)
#SBATCH --mem=64G                  # Total memory for the job (Herro can be memory intensive for large metagenomes)
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name="herro_single" # Default job name if not overridden by command line
#SBATCH --output=logs/slurm_herro_single_%j.log # Default stdout log if not overridden
#SBATCH --error=logs/slurm_herro_single_err_%j.log # Default stderr log if not overridden

declare -r DATASET_ID="lr-even"          # e.g., lr-even
declare -r RAW_READS_PATH="data/raw/lr-even/lr-even_raw.fastq"   # e.g., data/raw/lr-even/lr-even_raw.fastq
declare -r TEST_ID="1" # e.g., 1-5
# declare -r DRAFT_ASSEMBLY_FULLPATH="$4" # e.g., data/flye/lr-even/assembly.fasta

# --- Conda Initialization ---
CONDA_BASE=$(conda info --base)
if [ -f "${CONDA_BASE}/etc/profile.d/conda.sh" ]; then
    . "${CONDA_BASE}/etc/profile.d/conda.sh"
    echo "Conda initialized from ${CONDA_BASE}/etc/profile.d/conda.sh"
else
    echo "ERROR: conda.sh not found at ${CONDA_BASE}/etc/profile.d/conda.sh."
    echo "Please ensure Conda is installed and 'conda init bash' has been run."
    exit 1
fi

declare -r ROOT_DIR=$(pwd)
declare -r RAW_READS="${ROOT_DIR}/${RAW_READS_PATH}"
declare -r HERRO_OUT_DIR="${ROOT_DIR}/data/raw/${DATASET_ID}/test${TEST_ID}/"
declare -r READ_ID_PATH="${ROOT_DIR}data/raw/${DATASET_ID}/test${TEST_ID}/${DATASET_ID}_test${TEST_ID}_read_id.txt"
declare -r PRE_PROCESSED_READS_PATH="${HERRO_OUT_DIR}/duplex_tools_output_dir/porechopped_split.fastq.gz"
declare -r BATCHED_ALIGNMENT_PATH="${HERRO_OUT_DIR}/batched/"
declare -r NUM_THREADS="24"
declare -r NUM_JOBS=2



declare -r HERRO_REPO_DIR="${ROOT_DIR}/tools/herro/"
declare -r HERRO_PREPROCESS_SCRIPT="${HERRO_REPO_DIR}/scripts/preprocess.sh"
declare -r HERRO_BATCH_ALIGN_SCRIPT="${HERRO_REPO_DIR}/scripts/create_batched_alignments.sh"


## Ensure in directory
cd tools/herro/

conda run -n herro bash "${HERRO_BATCH_ALIGN_SCRIPT}" \
  "${PRE_PROCESSED_READS_PATH}" \
  "${READ_ID_PATH}" \
  "${NUM_THREADS}" \
  "${BATCHED_ALIGNMENT_PATH}"

EOF









#!/bin/bash
#SBATCH --partition=t1small        # Adjust as needed (e.g., highmem, if you have it)
#SBATCH --ntasks=1                 # Total number of tasks
#SBATCH --cpus-per-task=24         # Number of CPU cores for Herro (corresponds to -t in Herro)
#SBATCH --mem=64G                  # Total memory for the job (Herro can be memory intensive for large metagenomes)
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name="herro_single" # Default job name if not overridden by command line
#SBATCH --output=logs/slurm_herro_single_%j.log # Default stdout log if not overridden
#SBATCH --error=logs/slurm_herro_single_err_%j.log # Default stderr log if not overridden

declare -r DATASET_ID="lr-even"          # e.g., lr-even
declare -r RAW_READS_PATH="data/raw/lr-even/lr-even_raw.fastq"   # e.g., data/raw/lr-even/lr-even_raw.fastq
declare -r TEST_ID="1" # e.g., 1-5
# declare -r DRAFT_ASSEMBLY_FULLPATH="$4" # e.g., data/flye/lr-even/assembly.fasta

# --- Conda Initialization ---
CONDA_BASE=$(conda info --base)
if [ -f "${CONDA_BASE}/etc/profile.d/conda.sh" ]; then
    . "${CONDA_BASE}/etc/profile.d/conda.sh"
    echo "Conda initialized from ${CONDA_BASE}/etc/profile.d/conda.sh"
else
    echo "ERROR: conda.sh not found at ${CONDA_BASE}/etc/profile.d/conda.sh."
    echo "Please ensure Conda is installed and 'conda init bash' has been run."
    exit 1
fi

declare -r ROOT_DIR=$(pwd)
declare -r RAW_READS="${ROOT_DIR}/${RAW_READS_PATH}"
declare -r HERRO_OUT_DIR="${ROOT_DIR}/data/raw/${DATASET_ID}/test${TEST_ID}/"
declare -r READ_ID_PATH="${ROOT_DIR}data/raw/${DATASET_ID}/test${TEST_ID}/${DATASET_ID}_test${TEST_ID}_read_id.txt"
declare -r PRE_PROCESSED_READS_PATH="${HERRO_OUT_DIR}/duplex_tools_output_dir/porechopped_split.fastq.gz"
declare -r BATCHED_ALIGNMENT_PATH="${HERRO_OUT_DIR}/batched/"
declare -r NUM_THREADS="24"
declare -r NUM_JOBS=2

declare -r HERRO_MODEL="${HERRO_REPO_DIR}/model_R9_v0.1.pt"

declare -r HERRO_REPO_DIR="${ROOT_DIR}/tools/herro/"
declare -r HERRO_PREPROCESS_SCRIPT="${HERRO_REPO_DIR}/scripts/preprocess.sh"
declare -r HERRO_BATCH_ALIGN_SCRIPT="${HERRO_REPO_DIR}/scripts/create_batched_alignments.sh"


declare -r HERRO_SIG_BUILD="${HERRO_REPO_DIR}/herro.sif"


## Ensure in directory
cd tools/herro/

conda run -n herro bash "${HERRO_BATCH_ALIGN_SCRIPT}" \
  "${PRE_PROCESSED_READS_PATH}" \
  "${READ_ID_PATH}" \
  "${NUM_THREADS}" \
  "${BATCHED_ALIGNMENT_PATH}"




conda run herro "${HERRO_PREPROCESS_SCRIPT}" \
  "${RAW_READS}" \
  "${HERRO_OUT_DIR}" \
  "${NUM_THREADS}" \
  "${NUM_JOBS}"

gunzip -c "${PRE_PROCESSED_READS_PATH}" | grep "^@" | cut -d' ' -f1 > "${READ_ID_PATH}"


"singularity run --nv ${HERRO_SIG_BUILD} inference --help" \
-m "${HERRO_MODEL}" \
-b "${NUM_JOBS}" \
"${RAW_READS}" \
"${HERRO_OUT_DIR}"


HERRO_COMMAND="singularity run --nv ${HERRO_SIG_BUILD} inference \
-m ${HERRO_MODEL} \
-b ${NUM_JOBS} \
${RAW_READS} \
${HERRO_OUT_DIR}"

conda run -n herro bash "${HERRO_COMMAND}"






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
root_dir=$(pwd)
cd tools/herro/


scripts/preprocess.sh ${root_dir}/data/raw/lr-even/lr-even_raw.fastq ${root_dir}/temp_out/ 24 1
scripts/preprocess.sh ${root_dir}/data/raw/lr-ms/lr-ms_raw.fastq ${root_dir}/temp_out/ 24 1


sbatch your_herro_script.sh lr-even data/raw/lr-even/lr-even_raw.fastq /path/to/herro/herro.ckpt






declare -r DATASET_ID="$1"          # e.g., lr-even
declare -r RAW_READS_PATH="$2"   # e.g., data/raw/lr-even/lr-even_raw.fastq
declare -r TEST_ID="$3" # e.g., 1-5


##### lr-even
## Test 1
# 431628

## Test 2
sbatch code/polishing/run_herro.batch "lr-even" "data/raw/lr-even/lr-even_raw.fastq" "2"








######## FLYE
# 424887
sbatch code/polishing/polish.batch "lr-even" "flye" "data/raw/lr-even/lr-even_raw.fastq" "data/flye/lr-even/assembly.fasta"
# 424897
sbatch code/polishing/polish.batch "lr-log" "flye" "data/raw/lr-log/Zymo-GridION-LOG-BB-SN.fq" "data/flye/lr-log/assembly.fasta"
# 424891
sbatch code/polishing/polish.batch "lr-ms" "flye" "data/raw/lr-ms/lr-ms_raw.fastq" "data/flye/lr-ms/assembly.fasta"



######## CANU
#
sbatch code/polishing/polish.batch "lr-even" "canu" "data/raw/lr-even/lr-even_raw.fastq" "data/canu/lr-even/lr-even_task.contigs.fasta"
#
sbatch code/polishing/polish.batch "lr-log" "canu" "data/raw/lr-log/Zymo-GridION-LOG-BB-SN.fq" "data/canu/lr-log/lr-log_task.contigs.fasta"
#
sbatch code/polishing/polish.batch "lr-ms" "canu" "data/raw/lr-ms/lr-ms_raw.fastq" "data/canu/lr-ms/lr-ms_task.contigs.fasta"



######## RAVEN
#
sbatch code/polishing/polish.batch "lr-even" "raven" "data/raw/lr-even/lr-even_raw.fastq" "data/raven/lr-even/assembly_raven_lr-even.fasta"
#
sbatch code/polishing/polish.batch "lr-log" "raven" "data/raw/lr-log/Zymo-GridION-LOG-BB-SN.fq" "data/raven/lr-log/assembly_raven_lr-log.fasta"
#
sbatch code/polishing/polish.batch "lr-ms" "raven" "data/raw/lr-ms/lr-ms_raw.fastq" "data/raven/lr-ms/assembly_raven_lr-ms.fasta"





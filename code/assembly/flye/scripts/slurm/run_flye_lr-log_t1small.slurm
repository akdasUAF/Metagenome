#!/bin/bash
#SBATCH --partition=t1small
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
#If running on the bio or analysis queue add:
###SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_flye_lr-log_t1small"
#SBATCH --output=data/flye/logs/log_slurm_flye_lr-log_%j.log
#SBATCH --error=data/flye/logs/log_slurm_flye_lr-log_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

eval "$(conda shell.bash hook)"
bash code/assembly/flye/scripts/flye_lr-log.sh
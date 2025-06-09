#!/bin/bash
#SBATCH --partition=t1small
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
###If running on the bio or analysis queue add:
###SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_canu_lr-ms_t1small"
#SBATCH --output=data/canu/logs/log_slurm_canu_lr-ms_%j.log
#SBATCH --error=data/canu/logs/log_slurm_canu_lr-ms_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

eval "$(conda shell.bash hook)"
bash code/assembly/canu/scripts/canu_lr-ms.sh
#!/bin/bash
#SBATCH --partition=t1standard
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
#If running on the bio or analysis queue add:
###SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_raven_lr-bd_t1standard"
#SBATCH --output=data/analysis/lr-bd/raven/log_slurm_raven_lr-bd_%j.log
#SBATCH --error=data/analysis/lr-bd/raven/log_slurm_raven_lr-bd_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"
bash code/assembly/raven/run_scripts/run_raven_lr-bd.sh

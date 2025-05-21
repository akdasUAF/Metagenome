#!/bin/bash
#SBATCH --partition=t1small
#SBATCH --ntasks=4
#SBATCH --tasks-per-node=4
#If running on the bio or analysis queue add:
### SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_raven_lr-log_t1standard"
#SBATCH --output=data/lr-log/logs/log_slurm_raven_lr-log_t1standard_%j.log
#SBATCH --error=data/lr-log/logs/log_slurm_raven_lr-log_t1standard_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"
bash code/assembly/raven/scripts/run_raven_lr-log.sh
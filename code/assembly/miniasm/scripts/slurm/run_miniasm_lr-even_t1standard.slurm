#!/bin/bash
#SBATCH --partition=t1standard
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
#If running on the bio or analysis queue add:
##SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_miniasm_lr-even_t1standard"
#SBATCH --output=data/raven/logs/log_slurm_miniasm_lr-even_%j.log
#SBATCH --error=data/raven/logs/log_slurm_miniasm_lr-even_err_%j.log


## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"
bash code/assembly/miniasm/scripts/miniasm_lr-even.sh
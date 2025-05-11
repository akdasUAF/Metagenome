#!/bin/bash
#SBATCH --partition=t1standard
#SBATCH --ntasks=4
#SBATCH --tasks-per-node=24
####If running on the bio or analysis queue add:
##SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_canu_lr-even_t1standard"
#SBATCH --output=data/canu/logs/log_slurm_canu_lr-even_%j.log
#SBATCH --error=data/canu/logs/log_slurm_canu_lr-even_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

eval "$(conda shell.bash hook)"
bash code/assembly/canu/scripts/canu_lr-even.sh
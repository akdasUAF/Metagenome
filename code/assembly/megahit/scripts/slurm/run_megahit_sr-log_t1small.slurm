#!/bin/bash
#SBATCH --partition=t1small
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
#If running on the bio or analysis queue add:
####SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_megahit_sr-log_t1standard"
#SBATCH --output=data/megahit/logs/log_slurm_megahit_sr-log_%j.log
#SBATCH --error=data/megahit/logs/log_slurm_megahit_sr-log_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"
bash code/assembly/megahit/scripts/megahit_sr-log.sh
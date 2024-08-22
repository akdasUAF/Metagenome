#!/bin/bash
#SBATCH --partition=t1standard
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
#If running on the bio or analysis queue add:
#####SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_quast_sr-log_megahit"
#SBATCH --output=data/sr-log/log/log_slurm_quast_sr-log_megahit_%j.log
#SBATCH --error=data/sr-log/log/log_slurm_quast_sr-log_megahit_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"
bash code/analysis/metaquast/sr-log/quast_megahit_sr-log.sh

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
#SBATCH --job-name="panmeta_asm_metaspades_sr-ms_t1standard"
#SBATCH --output=data/sr-ms/logs/log_slurm_metaspades_sr-crust_t1standard.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm
module load Python/3.11.3

ulimit -l unlimited

eval "$(conda shell.bash hook)"
bash code/assembly/metaspades/scripts/metaspades_sr-ms.sh
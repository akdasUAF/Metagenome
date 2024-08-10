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
#SBATCH --job-name="panmeta_asm_metaspades_sr-bmock_t1standard"

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm
module load Python/3.11.3

ulimit -l unlimited

eval "$(conda shell.bash hook)"
bash code/assembly/metaspades/scripts/metaspades_sr-bmock.sh | tee -a data/analysis/sr-bmock/metaspades/log_assemble_metaspades_sr-bmock_slurm.log || echo 'Assembly failed : metaspades sr-bmock'

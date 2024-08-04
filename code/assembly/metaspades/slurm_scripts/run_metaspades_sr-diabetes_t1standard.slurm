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
#SBATCH --job-name="panmeta_asm_metaspades_sr-diabetes_t1standard"

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm
module load Python/3.11.3

ulimit -l unlimited

eval "$(conda shell.bash hook)"
/usr/bin/time -v bash -c "source code/assembly/metaspades/run_scripts/run_metaspades_sr-diabetes.sh" 2>&1 | tee -a data/analysis/metaspades/log_assemble_metaspades_sr-diabetes_slurm.log || echo 'Assembly failed : metaspades sr-diabetes'

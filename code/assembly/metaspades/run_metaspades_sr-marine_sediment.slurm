#!/bin/bash
#SBATCH --partition=bio
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
#If running on the bio or analysis queue add:
#SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_metaspades_sr-marine_sediment"

## Clean out any modules, then reload slurm
module purge
module load GCCcore/12.3.0
module load Python/3.11.3
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"
/usr/bin/time -v bash -c "source code/assembly/metaspades/run_metaspades_sr-marine_sediment.bash" 2>&1 | tee -a logs/assembly/log_assemble_metaspades_sr-marine_sediment.log



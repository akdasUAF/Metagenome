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
#SBATCH --job-name="panmeta_asm_unicycler_sr-bmock_t1standard"
#SBATCH --output=data/analysis/unicycler/sr-bmock/log_slurm_unicycler_sr-bmock_%j.log
#SBATCH --error=data/analysis/unicycler/sr-bmock/log_slurm_unicycler_sr-bmock_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"
conda activate asm_unicycler
command="code/assembly/unicycler/scripts/run_env.sh"
bash code/benchmarking/benchmark.bash "${command}" -d "sr-bmock" -t "unicycler"

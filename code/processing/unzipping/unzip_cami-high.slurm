#!/bin/bash
#SBATCH --partition=t1small
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
#If running on the bio or analysis queue add:
##SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="unzip"
#SBATCH --output=unzip_cami-high_%j.log
#SBATCH --error=unzip_cami-high_%j_err.log


## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"

cd data/raw/cami-high/
# tar -xvf cami-high_raw.tar

cd CAMI-HIGH/

conda activate pro_fastp

fastp \
  -i RH_S004__insert_270.fq.gz \
  -o RH_S004_insert_270_fastp.fq.gz \
  --failed_out RH_insert_270_failed.fq.gz \
  -j RH_insert_270.json \
  -h RH_insert_270.html \
  -z 4 \
  -w 8

mv *.fastp* ../
cd ..
mv RH_S004_insert_270_fastp.fq.gz cami-high_trimmed.fastq.gz
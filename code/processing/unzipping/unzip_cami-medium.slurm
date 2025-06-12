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
#SBATCH --output=unzip_cami-medium_%j.log
#SBATCH --error=unzip_cami-medium_%j_err.log


## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"

cd data/raw/cami-medium/
tar -xvf cami-medium_raw.tar

cd CAMI-MEDIUM/

conda activate pro_fastp

fastp \
  -i RM1_S001__insert_5000.fq.gz \
  -I RM1_S002__insert_5000.fq.gz \
  -o RM1_S001_insert_5000_fastp.fq.gz \
  -O RM1_S002_insert_5000_fastp.fq.gz \
  --unpaired1 RM1_S001_insert_5000_unpaired.fq.gz \
  --unpaired2 RM1_S002_insert_5000_unpaired.fq.gz \
  --failed_out RM1_insert_5000_failed.fq.gz \
  -j RM1_insert_5000.json \
  -h RM1_insert_5000.html \
  -z 4 \
  -w 8

mv *.fastp* ../
cd ..
mv RM1_S001_insert_5000_fastp.fq.gz cami-medium_trimmed_1.fastq.gz
mv RM1_S002_insert_5000_fastp.fq.gz cami-medium_trimmed_2.fastq.gz
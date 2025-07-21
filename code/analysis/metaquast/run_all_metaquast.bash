


rsync -avzP ./metagenome_reference wwinnett@chinook04.alaska.edu:/center1/PANMETA/wwinnett/metagenome_data/reference/


data/reference/sr-log/sr-log_references.txt

sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-even/test1/final.contigs.fa" \
    "results/megahit/sr-even/test1/" \
    "data/reference/sr-log/sr-log_references.txt"
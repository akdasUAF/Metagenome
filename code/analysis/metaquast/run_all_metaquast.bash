


rsync -avzP ./metagenome_reference wwinnett@chinook04.alaska.edu:/center1/PANMETA/wwinnett/metagenome_data/reference/


mkdir -p results/megahit/sr-even/test1/




######################## MEGAHIT
##### sr-even
## 431667
## Test 1
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-even/test1/final.contigs.fa" \
    "results/megahit/sr-even/test1/" \
    "data/reference/sr-even/sr-even_reference.txt"


## Test 2
## 431677
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-even/test2/final.contigs.fa" \
    "results/megahit/sr-even/test2/" \
    "data/reference/sr-even/sr-even_reference.txt"


## Test 3
## 431678
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-even/test3/final.contigs.fa" \
    "results/megahit/sr-even/test3/" \
    "data/reference/sr-even/sr-even_reference.txt"


## Test 4
## 431679
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-even/test4/final.contigs.fa" \
    "results/megahit/sr-even/test4/" \
    "data/reference/sr-even/sr-even_reference.txt"


## Test 5
## 431680
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-even/test5/final.contigs.fa" \
    "results/megahit/sr-even/test5/" \
    "data/reference/sr-even/sr-even_reference.txt"



##### Sr-log
## 431663
## Test 1
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test1/final.contigs.fa" \
    "results/megahit/sr-log/test1/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 2
## 431673
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test2/final.contigs.fa" \
    "results/megahit/sr-log/test2/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 3
## 431674
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test3/final.contigs.fa" \
    "results/megahit/sr-log/test3/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 4
## 431675
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test4/final.contigs.fa" \
    "results/megahit/sr-log/test4/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 5
## 431676
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test5/final.contigs.fa" \
    "results/megahit/sr-log/test5/" \
    "data/reference/sr-log/sr-log_references.txt"


##### sr-ms
## 
## Test 1
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test1/final.contigs.fa" \
    "results/megahit/sr-log/test1/" \
    ""


## Test 2
## 
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test2/final.contigs.fa" \
    "results/megahit/sr-log/test2/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 3
## 
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test3/final.contigs.fa" \
    "results/megahit/sr-log/test3/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 4
## 
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test4/final.contigs.fa" \
    "results/megahit/sr-log/test4/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 5
## s
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test5/final.contigs.fa" \
    "results/megahit/sr-log/test5/" \
    "data/reference/sr-log/sr-log_references.txt"

















######################## MetaSPADES
##### sr-even
## Test 1
## 431681
sbatch code/analysis/metaquast/metaquast.batch \
    "data/metaspades/sr-even/test1/contigs.fasta" \
    "results/metaspades/sr-even/test1/" \
    "data/reference/sr-even/sr-even_reference.txt"


## Test 2
## 431682
sbatch code/analysis/metaquast/metaquast.batch \
    "data/metaspades/sr-even/test2/contigs.fasta" \
    "results/metaspades/sr-even/test2/" \
    "data/reference/sr-even/sr-even_reference.txt"


## Test 3
## 431683
sbatch code/analysis/metaquast/metaquast.batch \
    "data/metaspades/sr-even/test3/contigs.fasta" \
    "results/metaspades/sr-even/test3/" \
    "data/reference/sr-even/sr-even_reference.txt"


## Test 4
## 431684
sbatch code/analysis/metaquast/metaquast.batch \
    "data/metaspades/sr-even/test4/contigs.fasta" \
    "results/metaspades/sr-even/test4/" \
    "data/reference/sr-even/sr-even_reference.txt"


## Test 5
## 431685
sbatch code/analysis/metaquast/metaquast.batch \
    "data/metaspades/sr-even/test5/contigs.fasta" \
    "results/metaspades/sr-even/test5/" \
    "data/reference/sr-even/sr-even_reference.txt"



##### Sr-log
## 431663
## Test 1
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test1/final.contigs.fa" \
    "results/megahit/sr-log/test1/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 2
## 431673
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test2/final.contigs.fa" \
    "results/megahit/sr-log/test2/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 3
## 431674
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test3/final.contigs.fa" \
    "results/megahit/sr-log/test3/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 4
## 431675
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test4/final.contigs.fa" \
    "results/megahit/sr-log/test4/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 5
## 431676
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test5/final.contigs.fa" \
    "results/megahit/sr-log/test5/" \
    "data/reference/sr-log/sr-log_references.txt"


##### sr-ms
## 
## Test 1
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test1/final.contigs.fa" \
    "results/megahit/sr-log/test1/" \
    ""


## Test 2
## 
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test2/final.contigs.fa" \
    "results/megahit/sr-log/test2/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 3
## 
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test3/final.contigs.fa" \
    "results/megahit/sr-log/test3/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 4
## 
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test4/final.contigs.fa" \
    "results/megahit/sr-log/test4/" \
    "data/reference/sr-log/sr-log_references.txt"


## Test 5
## s
sbatch code/analysis/metaquast/metaquast.batch \
    "data/megahit/sr-log/test5/final.contigs.fa" \
    "results/megahit/sr-log/test5/" \
    "data/reference/sr-log/sr-log_references.txt"
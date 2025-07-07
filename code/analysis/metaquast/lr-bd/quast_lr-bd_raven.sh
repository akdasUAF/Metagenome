#!/bin/env bash
## Script to analyze the quality of the metagenomes
## Assembler: Raven
## Dataset: lr-bd
## Analyzer: METAQUAST
script_to_execute="code/analysis/metaquast/run_metaquast.bash"
contig_path="data/MAG/lr-bd/assembly_raven_lr-bd.fasta"
analysis_output="data/analysis/raven/lr-even/"
log_dir="data/lr-bd/raven/"
dataset="lr-bd"
assembler="raven"


#### ~~~~~~~~~~ Metaquast only
reference_path="data/reference/lr-synth_reference/Genomes/Bacillus_subtilis_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Listeria_monocytogenes_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Salmonella_enterica_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Enterococcus_faecalis_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Pseudomonas_aeruginosa_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Staphylococcus_aureus_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Escherichia_coli_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Saccharomyces_cerevisiae_draft_genome.fasta,data/reference/lr-synth_reference/ssrRNAs/Bacillus_subtilis_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Enterococcus_faecalis_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Escherichia_coli_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Listeria_monocytogenes_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Pseudomonas_aeruginosa_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Saccharomyces_cerevisiae_18S_170924.fasta,data/reference/lr-synth_reference/ssrRNAs/Saccharomyces_cerevisiae_mitochondria_ssrRNA.fasta,data/reference/lr-synth_reference/ssrRNAs/Salmonella_enterica_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Staphylococcus_aureus_16S_170923.fasta"

mkdir -p $(dirname "$analysis_output")
mkdir -p ${log_dir}
log_file="${log_dir}/log_metaquast_${dataset}_${assembler}.log"

analysis_output="${analysis_output}/quast/"

# Execute the benchmark script with the constructed command
bash $script_to_execute $contig_path $analysis_output $log_file $reference_path




python3 tools/analysis/quast/metaquast.py -t 24 -o data/analysis/raven/lr-even/ data/raven/lr-even/assembly_raven_lr-even.fasta --glimmer \
-r data/reference/lr-synth_reference/Genomes/Bacillus_subtilis_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Listeria_monocytogenes_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Salmonella_enterica_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Enterococcus_faecalis_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Pseudomonas_aeruginosa_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Staphylococcus_aureus_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Escherichia_coli_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Saccharomyces_cerevisiae_draft_genome.fasta,data/reference/lr-synth_reference/ssrRNAs/Bacillus_subtilis_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Enterococcus_faecalis_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Escherichia_coli_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Listeria_monocytogenes_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Pseudomonas_aeruginosa_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Saccharomyces_cerevisiae_18S_170924.fasta,data/reference/lr-synth_reference/ssrRNAs/Saccharomyces_cerevisiae_mitochondria_ssrRNA.fasta,data/reference/lr-synth_reference/ssrRNAs/Salmonella_enterica_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Staphylococcus_aureus_16S_170923.fasta



python3 tools/analysis/quast/metaquast.py -t 24 -o data/analysis/canu/lr-even/ data/canu/lr-even/lr-even_task.contigs.fasta --glimmer \
-r data/reference/lr-synth_reference/Genomes/Bacillus_subtilis_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Listeria_monocytogenes_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Salmonella_enterica_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Enterococcus_faecalis_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Pseudomonas_aeruginosa_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Staphylococcus_aureus_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Escherichia_coli_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Saccharomyces_cerevisiae_draft_genome.fasta,data/reference/lr-synth_reference/ssrRNAs/Bacillus_subtilis_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Enterococcus_faecalis_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Escherichia_coli_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Listeria_monocytogenes_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Pseudomonas_aeruginosa_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Saccharomyces_cerevisiae_18S_170924.fasta,data/reference/lr-synth_reference/ssrRNAs/Saccharomyces_cerevisiae_mitochondria_ssrRNA.fasta,data/reference/lr-synth_reference/ssrRNAs/Salmonella_enterica_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Staphylococcus_aureus_16S_170923.fasta





### LOAD THIS FIRST
module load zlib

python3 tools/analysis/quast/metaquast.py \
-t 24 \
-o data/analysis/flye/lr-even/quast/ data/flye/lr-even/assembly.fasta \
--glimmer \
--fragmented \
-r data/reference/lr-synth_reference/Genomes/Bacillus_subtilis_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Listeria_monocytogenes_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Salmonella_enterica_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Enterococcus_faecalis_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Pseudomonas_aeruginosa_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Staphylococcus_aureus_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Escherichia_coli_complete_genome.fasta,data/reference/lr-synth_reference/Genomes/Saccharomyces_cerevisiae_draft_genome.fasta,data/reference/lr-synth_reference/ssrRNAs/Bacillus_subtilis_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Enterococcus_faecalis_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Escherichia_coli_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Listeria_monocytogenes_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Pseudomonas_aeruginosa_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Saccharomyces_cerevisiae_18S_170924.fasta,data/reference/lr-synth_reference/ssrRNAs/Saccharomyces_cerevisiae_mitochondria_ssrRNA.fasta,data/reference/lr-synth_reference/ssrRNAs/Salmonella_enterica_16S_170923.fasta,data/reference/lr-synth_reference/ssrRNAs/Staphylococcus_aureus_16S_170923.fasta \
--debug

ln -s ~/metagenome_replicates/full_dataset/Metagenome/data/analysis/raven/lr-even/* ~/metagenome_results/raven/lr-even/quast/

find ~/metagenome_replicates/full_dataset/Metagenome/data/analysis/raven/lr-even/ -maxdepth 6 -mindepth 1 -exec ln -s {} ~/metagenome_results/raven/lr-even/quast/ \;

find /home/wwinnett/metagenome_replicates/attempt2/Metagenome/data/analysis/raven/lr-even/ -maxdepth 1 -mindepth 1 -exec ln -s {} /home/wwinnett/metagenome_results/raven/lr-even/quast/ \;
find /home/wwinnett/metagenome_replicates/attempt2/Metagenome/data/analysis/canu/lr-even/ -maxdepth 1 -mindepth 1 -exec ln -s {} /home/wwinnett/metagenome_results/canu/lr-even/quast/ \;
find /home/wwinnett/metagenome_replicates/attempt2/Metagenome/data/analysis/flye/lr-even/ -maxdepth 1 -mindepth 1 -exec ln -s {} /home/wwinnett/metagenome_results/flye/lr-even/quast/ \;






#### MEGAHIT sr-log

metaquast \
-t 24 \
-o ~/Research/metagenome_results/megahit/sr-log/quast/ \
~/Research/metagenome_results/megahit/sr-log/final.contigs.fa \
--glimmer \
--fragmented \
-r ~/Research/metagenome_reference/sr-log/reference_sequences/GCF_000005845.2_Escherichia_coli.fasta,~/Research/metagenome_reference/sr-log/reference_sequences/GCF_000006765.1_Pseudomonas_aeruginosa.fasta,~/Research/metagenome_reference/sr-log/reference_sequences/GCF_000006945.2_Salmonella_enterica.fasta,~/Research/metagenome_reference/sr-log/reference_sequences/GCF_000009045.1_Bacillus_subtilis.fasta,~/Research/metagenome_reference/sr-log/reference_sequences/GCF_000013425.1_Staphylococcus_aureus.fasta,~/Research/metagenome_reference/sr-log/reference_sequences/GCF_000091045.1_Cryptococcus_neoformans.fasta,~/Research/metagenome_reference/sr-log/reference_sequences/GCF_000146045.2_Saccharomyces_cerevisiae.fasta,~/Research/metagenome_reference/sr-log/reference_sequences/GCF_000196035.1_Listeria_monocytogenes.fasta,~/Research/metagenome_reference/sr-log/reference_sequences/GCF_000393015.1_Enterococcus_faecalis.fasta,~/Research/metagenome_reference/sr-log/reference_sequences/GCF_029961225.1_Lactobacillus_fermentum.fasta \
--debug


metaquast \
-t 4 \
-o ~/Research/metagenome_results/megahit/sr-log/quast/ \
~/Research/metagenome_results/megahit/sr-log/final.contigs.fa \
--glimmer \
--fragmented \
-r /Users/b/Research/metagenome_reference/sr-log/reference_sequences/GCF_000005845.2_Escherichia_coli.fasta,\
/Users/b/Research/metagenome_reference/sr-log/reference_sequences/GCF_000006765.1_Pseudomonas_aeruginosa.fasta,\
/Users/b/Research/metagenome_reference/sr-log/reference_sequences/GCF_000006945.2_Salmonella_enterica.fasta,\
/Users/b/Research/metagenome_reference/sr-log/reference_sequences/GCF_000009045.1_Bacillus_subtilis.fasta,\
/Users/b/Research/metagenome_reference/sr-log/reference_sequences/GCF_000013425.1_Staphylococcus_aureus.fasta,\
/Users/b/Research/metagenome_reference/sr-log/reference_sequences/GCF_000091045.1_Cryptococcus_neoformans.fasta,\
/Users/b/Research/metagenome_reference/sr-log/reference_sequences/GCF_000146045.2_Saccharomyces_cerevisiae.fasta,\
/Users/b/Research/metagenome_reference/sr-log/reference_sequences/GCF_000196035.1_Listeria_monocytogenes.fasta,\
/Users/b/Research/metagenome_reference/sr-log/reference_sequences/GCF_000393015.1_Enterococcus_faecalis.fasta,\
/Users/b/Research/metagenome_reference/sr-log/reference_sequences/GCF_029961225.1_Lactobacillus_fermentum.fasta \
--debug




#### MEGAHIT sr-even
metaquast \
-t 4 \
-o ~/Research/metagenome_results/megahit/sr-even/quast/ \
~/Research/metagenome_results/megahit/sr-even/final.contigs.fa \
--glimmer \
--fragmented \
-r /Users/b/Research/metagenome_reference/sr-even/reference_sequences/Muricauda_ES.050_2615840527.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Thioclava_ES.032_2615840533.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Cohaesibacter_es.047_2615840601.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Halomonas_HL-4_2623620617.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Halomonas_HL-93_2623620618.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Marinobacter_LV10MA510-1_2616644829.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Marinobacter_LV10R510-8_2615840697.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Micromonospora_coxensis_2623620609.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Micromonospora_echinaurantiaca_2623620557.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Micromonospora_echinofusca_2623620567.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Propionibacteriaceae_bacterium_ES.041_2615840646.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Psychrobacter_LV10R520-6_2617270709.fasta \
--debug




#### Metaspades sr-even
metaquast \
-t 4 \
-o ~/Research/metagenome_results/metaspades/sr-even/quast/ \
~/Research/metagenome_results/metaspades/sr-even/sr-even_metaspades_contigs.fasta \
--glimmer \
--fragmented \
-r /Users/b/Research/metagenome_reference/sr-even/reference_sequences/Muricauda_ES.050_2615840527.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Thioclava_ES.032_2615840533.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Cohaesibacter_es.047_2615840601.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Halomonas_HL-4_2623620617.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Halomonas_HL-93_2623620618.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Marinobacter_LV10MA510-1_2616644829.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Marinobacter_LV10R510-8_2615840697.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Micromonospora_coxensis_2623620609.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Micromonospora_echinaurantiaca_2623620557.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Micromonospora_echinofusca_2623620567.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Propionibacteriaceae_bacterium_ES.041_2615840646.fasta,\
/Users/b/Research/metagenome_reference/sr-even/reference_sequences/Psychrobacter_LV10R520-6_2617270709.fasta \
--debug






### lr-even Raven
metaquast \
-t 4 \
-o ~/Research/metagenome_results/raven/lr-even/quast/ \
~/Research/metagenome_results/raven/lr-even/assembly_raven_lr-even.fasta \
--glimmer \
--fragmented \
-r /Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Bacillus_subtilis_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Listeria_monocytogenes_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Salmonella_enterica_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Enterococcus_faecalis_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Pseudomonas_aeruginosa_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Staphylococcus_aureus_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Escherichia_coli_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Saccharomyces_cerevisiae_draft_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Bacillus_subtilis_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Enterococcus_faecalis_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Escherichia_coli_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Listeria_monocytogenes_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Pseudomonas_aeruginosa_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Saccharomyces_cerevisiae_18S_170924.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Saccharomyces_cerevisiae_mitochondria_ssrRNA.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Salmonella_enterica_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Staphylococcus_aureus_16S_170923.fasta \
--debug





### lr-even Canu
metaquast \
-t 4 \
-o ~/Research/metagenome_results/canu/lr-even/quast/ \
~/Research/metagenome_results/canu/lr-even/lr-even_canu.contigs.fasta \
--glimmer \
--fragmented \
-r /Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Bacillus_subtilis_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Listeria_monocytogenes_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Salmonella_enterica_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Enterococcus_faecalis_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Pseudomonas_aeruginosa_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Staphylococcus_aureus_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Escherichia_coli_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Saccharomyces_cerevisiae_draft_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Bacillus_subtilis_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Enterococcus_faecalis_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Escherichia_coli_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Listeria_monocytogenes_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Pseudomonas_aeruginosa_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Saccharomyces_cerevisiae_18S_170924.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Saccharomyces_cerevisiae_mitochondria_ssrRNA.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Salmonella_enterica_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Staphylococcus_aureus_16S_170923.fasta \
--debug

### lr-flye
metaquast \
-t 4 \
-o ~/Research/metagenome_results/flye/lr-even/quast/ \
~/Research/metagenome_results/flye/lr-even/assembly.fasta \
--glimmer \
--fragmented \
-r /Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Bacillus_subtilis_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Listeria_monocytogenes_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Salmonella_enterica_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Enterococcus_faecalis_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Pseudomonas_aeruginosa_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Staphylococcus_aureus_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Escherichia_coli_complete_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/Genomes/Saccharomyces_cerevisiae_draft_genome.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Bacillus_subtilis_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Enterococcus_faecalis_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Escherichia_coli_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Listeria_monocytogenes_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Pseudomonas_aeruginosa_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Saccharomyces_cerevisiae_18S_170924.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Saccharomyces_cerevisiae_mitochondria_ssrRNA.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Salmonella_enterica_16S_170923.fasta,\
/Users/b/Research/metagenome_reference/lr-even/reference_sequences/ssrRNAs/Staphylococcus_aureus_16S_170923.fasta \
--debug



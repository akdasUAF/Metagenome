# Extract the quality scores and save them in a new file
samtools view -h calls_to_draft.bam | awk '{if($1 ~ /^@/) print; else print $0}' > extracted_quality_scores.sam







assess_assembly -r data/reference/lr-even/lr-even_reference_cat.fasta -i 
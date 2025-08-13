






mkdir -p data/raven/lr-even/test5/map/
minimap2 -ax map-ont data/raven/lr-even/test5/medaka_consensus_simple_run/consensus.fasta data/raw/lr-even/lr-even_raw.fastq > data/raven/lr-even/test5/map/raven_lr-even_test5_mapped.sam
samtools view -bS data/raven/lr-even/test5/map/raven_lr-even_test5_mapped.sam > data/raven/lr-even/test5/map/raven_lr-even_test5_mapped.bam
samtools sort data/raven/lr-even/test5/map/raven_lr-even_test5_mapped.bam -o data/raven/lr-even/test5/map/raven_lr-even_test5_mapped_sorted.bam
samtools index data/raven/lr-even/test5/map/raven_lr-even_test5_mapped_sorted.bam
samtools fastq data/raven/lr-even/test5/map/raven_lr-even_test5_mapped_sorted.bam > data/raven/lr-even/test5/map/raven_lr-even_test5_mapped_sorted.bam



sbatch code/analysis/map.batch \
	lr-even \
	canu \
	test2 \
	data/raw/lr-even/lr-even_raw.fastq \
	data/raven/lr-even/test2/medaka_consensus_simple_run/consensus.fasta

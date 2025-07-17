

### Raven
## lr-even
sbatch code/polishing/run_medaka.batch \
    "lr-even" \
    "raven" \
    "data/raven/lr-even/lr-even_raven_calls_to_draft.bam" \
    "data/raven/lr-even/assembly_raven_lr-even.fasta"


## lr-log



### ASssembly location
## Flye
# lr-even: data/flye/lr-even/assembly.fasta
# lr-log: data/flye/lr-log/assembly.fasta
# lr-ms: data/flye/lr-ms/assembly.fasta

## Canu
# lr-even: data/canu/lr-even/lr-even_task.contigs.fasta
# lr-log: data/canu/lr-log/lr-log_task.contigs.fasta
# lr-ms: data/canu/lr-ms/lr-ms_task.contigs.fasta

## Raven
# lr-even: data/raven/lr-even/assembly_raven_lr-even.fasta
# lr-log: data/raven/lr-log/assembly_raven_lr-log.fasta
# lr-ms: data/raven/lr-ms/assembly_raven_lr-ms.fasta
#root_dir=$(pwd)
#cd tools/polishing/herro/
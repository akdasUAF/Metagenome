

######## Flye
#### lr-even
### Test 2 - 431875
sbatch code/polishing/run_medaka.batch \
    lr-even \
    metaflye \
    test2 \
    data/raw/lr-even/test2/lr-even_raw.fastq \
    data/metaflye/lr-even/test2/assembly.fasta

### Test 5 - 431820
sbatch code/polishing/run_medaka.batch \
    lr-even \
    metaflye \
    test5 \
    data/raw/lr-even/test5/lr-even_raw.fastq \
    data/metaflye/lr-even/test5/assembly.fasta


#### lr-log
### Test 1 - 431847
sbatch code/polishing/run_medaka.batch \
    lr-log \
    metaflye \
    test1 \
    data/raw/lr-log/test1/lr-log_raw.fastq \
    data/metaflye/lr-log/test1/assembly.fasta

### Test 5 - 431846
sbatch code/polishing/run_medaka.batch \
    lr-log \
    metaflye \
    test5 \
    data/raw/lr-log/test5/lr-log_raw.fastq \
    data/metaflye/lr-log/test5/assembly.fasta


#### lr-ms
### Test 1 - 431848
sbatch code/polishing/run_medaka.batch \
    lr-ms \
    metaflye \
    test1 \
    data/raw/lr-ms/test1/lr-ms_raw.fastq \
    data/metaflye/lr-ms/test1/assembly.fasta

### Test 5 - 431849
sbatch code/polishing/run_medaka.batch \
    lr-ms \
    metaflye \
    test5 \
    data/raw/lr-ms/test5/lr-ms_raw.fastq \
    data/metaflye/lr-ms/test5/assembly.fasta


















######## RAVEN
#### lr-even
### Test 1
sbatch code/polishing/run_medaka.batch \
    lr-even \
    raven \
    test1 \
    data/raw/lr-even/test1/lr-even_raw.fastq \
    data/raven/lr-even/test1/final.contigs.fasta

### Test 2 - 431903
sbatch code/polishing/run_medaka.batch \
    lr-even \
    raven \
    test2 \
    data/raw/lr-even/test2/lr-even_raw.fastq \
    data/raven/lr-even/test2/final.contigs.fasta

### Test 3
sbatch code/polishing/run_medaka.batch \
    lr-even \
    raven \
    test3 \
    data/raw/lr-even/test3/lr-even_raw.fastq \
    data/raven/lr-even/test3/final.contigs.fasta

### Test 4 - 431904
sbatch code/polishing/run_medaka.batch \
    lr-even \
    raven \
    test4 \
    data/raw/lr-even/test4/lr-even_raw.fastq \
    data/raven/lr-even/test4/final.contigs.fasta




### Test 5 - 431876
sbatch code/polishing/run_medaka.batch \
    lr-even \
    raven \
    test5 \
    data/raw/lr-even/test5/lr-even_raw.fastq \
    data/raven/lr-even/test5/final.contigs.fasta





#### lr-log
### Test 1 - 431932
sbatch code/polishing/run_medaka.batch \
    lr-log \
    raven \
    test1 \
    data/raw/lr-log/test1/lr-log_raw.fastq \
    data/raven/lr-log/test1/final.contigs.fasta

### Test 5 - 431931
sbatch code/polishing/run_medaka.batch \
    lr-log \
    raven \
    test5 \
    data/raw/lr-log/test5/lr-log_raw.fastq \
    data/raven/lr-log/test5/final.contigs.fasta










#### lr-ms
### Test 5
sbatch code/polishing/run_medaka.batch \
    lr-ms \
    raven \
    test5 \
    data/raw/lr-ms/test5/lr-ms_raw.fastq \
    data/raven/lr-ms/test5/final.contigs.fasta




# Distributed Iterative Metagenome Assembly Pipeline

## Installation
Clone the repository and install dependencies:
```bash
pip install -r requirements.txt
cd assembly_pipeline
python setup.py build_ext --inplace
```

Dependencies include:
- Python 3.9+
- Modules from requirements.txt
- Cython (for optimized graph utilities)

---

## Running the Pipeline
Basic execution:
```bash
python main.py -r <input.fastq> -k 31 -t 12 --min-cov 2 --scaffold
```

### Arguments:
- `-r` : Input FASTQ file (required)  
- `-k` : k-mer size (default: 31)  
- `-t` : Number of threads (default: 8)  
- `--min-cov` : Minimum coverage threshold  
- `--scaffold` : Enable scaffolding mode  

---

## Output
- **Contigs**: Assembled sequences per cluster.  
- **assembly_stats.txt**: Contains:
  - N50, N90, L50, L90
  - Total, mean, min, max, median lengths
  - Per-cluster and overall statistics
- **Execution log**: Step-wise timings for profiling.  

---

## Workflow Stages
1. Parse FASTQ reads → generate k-mers.  
2. Build **de Bruijn graph**.  
3. Cluster k-mers by coverage & GC content.  
4. Merge clusters using paired-end data.  
5. Remove tips & bubbles in parallel.  
6. Generate contigs.  
7. Compute assembly statistics.  

---

## Example
```bash
python main.py -r test_data/SRR2628505.fastq -k 21 -t 12 --min-cov 2 --scaffold
```

Output:
```
Cluster 0 Statistics:
  N50: 651 bp
  Total Length: 651 bp
  Number of Contigs: 1
Overall Assembly Statistics:
  N50: 651 bp
  Total Length: 651 bp
```

#!/usr/bin/env python3

from Bio import SeqIO
import sys

fasta_file = sys.argv[1]
total_length = 0

for record in SeqIO.parse(fasta_file, "fasta"):
    total_length += len(record.seq)

print(total_length)


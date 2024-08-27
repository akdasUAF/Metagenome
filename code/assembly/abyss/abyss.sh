!/bin/bash
# Assembler: Abyss

if [ $# -ne 6 ]; then
  echo "Usage: $0 <forward_in> <reverse_in> <path_output> <name_assembly> <kmer_size> <bloom_filter_size>"
  echo $#
  exit 1
fi

forward_reads=$1
reverse_reads=$2
path_output=$3
name_assembly=$4
kmer=$5
bloom=$6

echo "    "
echo "forward_in: $forward_reads"
echo "reverse_in: $reverse_reads"
echo "path_output: $path_output"
echo "name_assembly: $name_assembly"
echo "kmer: $kmer"
echo "bloom: $bloom"
echo "    "

abyss_pe_in="${forward_reads} ${reverse_reads}"

abyss-pe k=$kmer name=$name_assembly B=$bloom j=24 \
	in=$abyss_pe_in \
	out=$path_output
	

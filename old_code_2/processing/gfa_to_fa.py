from Bio import SeqIO
import sys


def gfa_to_fa(gfa_file, fasta_file):

	# Counting number of sequences
	num_sequences = 0

	# Open files
	with open(gfa_file, "r") as gfa, open(fasta_file, "w") as fasta:
	# Iterate through sequences in GFA
		for record in SeqIO.parse(gfa, "gfa"):
			# Extract sequence and ID (assuming ID in second column)
			sequence = str(record.seq)
			fasta_id = record.id.split()[1]  # Assuming ID format

			# Write FASTA entry
			fasta.write(f">{fasta_id} \n")
			fasta.write(sequence + "\n")

	
	print("GFA converted to fasta")
	print(f"GFA found at: {gfa_file}")
	print(f"Fasta found at: {fasta_file}")
	print(f"{num_sequences} number of sequences")
	print(" ")



def main():

	# Check for required arguments (expecting 2 arguments)
	if len(sys.argv) != 3:
		print("Error: Please provide input GFA file and output FASTA file as arguments.")
		exit(1)
	
	# Assign arguments to variables
	input_gfa_file = sys.argv[1]
	output_fasta_file = sys.argv[2]
	gfa_to_fa(input_gfa_file, output_fasta_file)




if __name__=="__main__": 
    main() 
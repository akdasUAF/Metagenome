import sys

def extract_lines(filename):

	text = ""
	try:
		with open(filename, 'r') as f:
			text = f.read()
	except FileNotFoundError:
		print(f"Error: File {filename} not found.")
	return text



def find_L50(text):
	for line in text.splitlines():
		
		if "L50" in line:
			try:
				return(int(line.split()[1]))
			
			except ValueError:
				return None
	return None






# Get the filename from command line arguments
if len(sys.argv) > 1:
	filename = sys.argv[1]
else:
	print("Error: Please provide a filename as an argument.")
	sys.exit(1)

text = extract_lines(filename= filename)
l50_value = find_L50(text)

filename_short = filename.split("/")[-1].split(".")[0]
print(f"{filename_short}: {l50_value}")


def extract_lines(filename):

	text = ""
	try:
		with open(filename, 'r') as f:
			text = f.read()
	except FileNotFoundError:
		print(f"Error: File {filename} not found.")
	return text


def find_LD50(text):
  """
  This function takes in a text string and reports the value of X 
  when it hits the line under the schema "LD50  X".

  Args:
      text: The text string to search.

  Returns:
      The value of X as an integer, or None if not found.
  """
  for line in text.splitlines():
    if line.startswith("LD50"):
      try:
        return int(line.split()[1])
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
ld50_value = find_LD50(text)


print(f"LD50: {ld50_value}")

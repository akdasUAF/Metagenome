import glob
import subprocess
import os
import time
import argparse

path_assembler = "assembly/path_assembler/"
path_args_assembler = "assembly/args_assembler/"
path_analyzer = "analysis/path_analyzer/"
path_args_analyzer = "analysis/args_analyzer/"
path_retriever = "retrieval/path_retriever/"
path_args_retriever = "retrieval/args_retriever/"


### Should be finished
def execute_command(command, arguments, output):
    stdout = f"{output}_stdout.log"
    stderr = f"{output}_stderr.log"

    result = subprocess.run(command + arguments, capture_output=True, text=True)

    with open(stderr, "w") as f:
        f.write(result.stderr)

    with open(stdout, "w") as f:
        f.write(result.stdout)

    if result.returncode == 0:
        return result
    else:
        print(f"Error running command: {result.stderr}")
        print(f"Error code: {result.returncode}")
        return None


## Theoretically working
def start_dool(out):
    subprocess.Popen(["bash", "code/analysis/dool/start_dool.bash", out])
    # Baking in 10 seconds to monitor the system without the process
    time.sleep(10)


## Theoretically working
def stop_dool():
    # Baking in 10 seconds to monitor the system without the process
    time.sleep(10)
    subprocess.run(["bash", "code/analysis/dool/kill_dool.bash"])


### Should be finished
def set_working_directory_to_repo_root():
    """
  Sets the working directory to the repository root.
  """
    script_dir = os.path.dirname(os.path.abspath(__file__))
    repo_root = os.path.abspath(os.path.join(script_dir, '..'))  # Navigate to the parent directory
    os.chdir(repo_root)


### Should be finished
def find_file_in_specific_directory(base_dir, target_dir, filename):
    """Finds a file within a specific directory and its subdirectories.

  Args:
    base_dir: The base directory to search in.
    target_dir: The desired parent directory.
    filename: The name of the file to find.

  Returns:
    The full path to the file if found, otherwise None.
  """

    pattern = os.path.join(base_dir, target_dir, "**", f"{filename}.txt")
    matches = glob.glob(pattern, recursive=True)
    return matches[0] if matches else None


### Should be finished
def read_content_from_file(path):
    with open(path, 'r') as f:
        return f.readlines()


### Should be finished
def get_subdirectories(path_to_extend):
    try:
        subdirectories = [d for d in os.listdir(path_to_extend) if os.path.isdir(os.path.join(path_to_extend, d))]
        return subdirectories
    except FileNotFoundError:
        print(f"Directory not found: {path_to_extend}")
        return []


### Should be finished
def get_args(tool, assembler, dataset):
    base_path = "code/"
    file_dict = {}
    args_path = ""
    for root, _, files in os.walk(base_path):
        if 'args' in root:
            for file in files:
                if file.endswith('.txt'):
                    base_name, _ = os.path.splitext(file)
                    file_path = os.path.join(root, file)
                    file_dict[base_name] = file_path

    if tool == "assembly" or \
            tool in [os.path.splitext(f)[0] for f in os.listdir(f"code/{path_assembler}") if
                     os.path.isfile(os.path.join(f"code/{path_assembler}", f))]:

        args_path = file_dict.get(f"asm-args_{assembler}_{dataset}", "")

    elif tool == "retrieval" or \
            tool in [os.path.splitext(f)[0] for f in os.listdir(f"code/{path_retriever}") if
                     os.path.isfile(os.path.join(f"code/{path_retriever}", f))]:
        # return file_dict.get(f"{tool}_{dataset}", "")
        for key, value in file_dict.items():
            if key.endswith(f"{tool}_{dataset}"):
                args_path = value

    else:
        for key, value in file_dict.items():
            if key.endswith(f"{tool}_{assembler}_{dataset}"):
                args_path = value

    return " ".join([element.strip() for element in read_content_from_file(args_path)])


### Should Be finished
def get_tool(tool):
    base_path = "code/"
    file_dict = {}

    for root, _, files in os.walk(base_path):
        if 'path' in root:
            for file in files:
                if file.endswith('.txt'):
                    base_name, _ = os.path.splitext(file)
                    file_path = os.path.join(root, file)
                    file_dict[base_name] = file_path

    return read_content_from_file(file_dict.get(tool, ""))[0]


### Should Be finished
def generate_folder(path):
    try:
        os.makedirs(path, exist_ok=True)
    except OSError as e:
        print(f"Error creating directory: {e}")


def assemble(assembler, dataset):
    ## Setup folders
    path_to_analysis = f"data/analysis/{assembler}/{dataset}/"
    path_to_MAG = f"data/MAG/{assembler}/{dataset}/"

    ## Start Dool
    generate_folder(f"{path_to_analysis}dool/")
    start_dool(f"{path_to_analysis}dool_asm_{assembler}_{dataset}.csv")

    # Get Tools
    tool_assembler = get_tool(assembler)
    args_assembler = get_args(assembler, assembler, dataset)

    ## Checks if the tool and args are found. If not, then it exits
    if not tool_assembler:
        print("Assemble: Tool not found")
        return

    if not args_assembler:
        print("Assemble: Assemble args not found")
        return

    # Create folder for output
    generate_folder(path_to_MAG)

    # Run exec command
    result = execute_command(tool_assembler, args_assembler, path_to_analysis)

    # Stop dool
    stop_dool()

    # Return result
    return result


def run_tool(tool, assembler, dataset):
    path_to_analysis = f"data/analysis/{assembler}/{dataset}/"
    path_to_tool_analysis= f"{path_to_analysis}/{tool}/"

    ## Start Dool
    generate_folder(f"{path_to_analysis}/dool/")
    start_dool(f"{path_to_analysis}dool_ana_{tool}_{assembler}_{dataset}.csv")

    # Get args and tool
    tool_path = get_tool(tool)
    tool_args = get_args(tool, assembler, dataset)

    # Setup folder to output to
    generate_folder(path_to_tool_analysis)

    result = execute_command(tool_path, tool_args, path_to_tool_analysis)

    # Stop dool
    stop_dool()

    return result


def main():
    test_path_exec = "./code/assembly/path_assembler/echo.txt"

    ## Set Repo root to the Metagenome repo root
    set_working_directory_to_repo_root()

    if os.getcwd().split("/")[-1] != "Metagenome":
        print("Warning: Current wd is not Repository root. \n Exiting...")
        return

    # Part where argparser figures out your command
    parser = argparse.ArgumentParser(description='Assemble metagenomes and analyze their quality')

    # Argument for assembling database
    parser.add_argument('-a', '--assemble',
                        dest='assemble',
                        default=False,
                        action='store_true',
                        help="Usage [a]: assembler_dataset \n Example: -a canu_lr-ecoli")

    # Argument for using a tool
    parser.add_argument('-t', '--tool',
                        dest='tool',
                        default="",
                        help='Uses a tool to analyze MAG quality \n '
                             'Usage: -t [tool_assembler_dataset] or [quast_canu_lr-ecoli]')

    # This stores all the values from the parser
    args = parser.parse_args()
    arg_assemble = args.assemble
    arg_tool = args.tool

    if arg_assemble:
        broken_assemble = arg_assemble.split("_")
        dataset = broken_assemble[-1]
        assembler = broken_assemble[0]
        print(f"Assembling {dataset} using {assembler}")

        assemble(assembler, dataset)

    if arg_tool:
        broken_tool = arg_tool.split("_")
        tool = broken_tool[0]
        assembler = broken_tool[1]
        dataset = broken_tool[-1]
        print(f"Using {tool} to analyze {assembler} assembled {dataset}")

        run_tool(tool, assembler, dataset)


if __name__ == '__main__':
    main()

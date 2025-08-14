library(tidyverse)
library(tools)

results_dir_base <- "../metagenome_results/version3/"

assemblers_list_lr <- c("raven", "metaflye", "canu")
datasets_list_lr <- c("lr-even", "lr-log", "lr-ms")

# Initialize an empty DataFrame to store results
results_full_lr <- data.frame(assembler = character(),
                              dataset = character(),
                              test = integer(),
                              reference = character(),
                              metric_name = character(),
                              metric_value = numeric(),
                              stringsAsFactors = FALSE)

for (assembler in assemblers_list_lr) {
  for (dataset in datasets_list_lr) {
    for (test in 1:5) { 
      
      # Construct the path to the test results
      test_results_path <- paste(results_dir_base, 
                                 assembler, 
                                 dataset,
                                 paste("test", test, sep = ""),
                                 "metaquast",
                                 "summary",
                                 "TXT",
                                 sep = "/")
      
      # List all files in the test results directory
      test_results_files <- list.files(path = test_results_path, full.names = TRUE)
      
      # Print the current combination
      print(paste("Assembler: ",
                  assembler, 
                  "; Dataset: ",
                  dataset,
                  "; Test: ",
                  test,
                  "; Num files: ",
                  length(test_results_files),
                  sep = " "))
      
      
      for (file in test_results_files) {
        
        # Read the contents of the file
        file_contents <- read.table(file, header = TRUE, stringsAsFactors = FALSE)
        
        # Get the metric name from the file name without the extension
        metric_name <- file_path_sans_ext(basename(file))
        
        # Assuming the first column contains reference organisms and the rest are metrics
        for (i in 1:nrow(file_contents)) {
          reference <- file_contents[i, 1]  # First column for reference organism
          
          # Loop through each metric column
          for (j in 2:ncol(file_contents)) {
            metric_value <- file_contents[i, j]  # Get the metric value
            
            # Create a new row with the current values
            new_row <- data.frame(assembler = assembler,
                                  dataset = dataset,
                                  test = test,
                                  reference = reference,
                                  metric_name = metric_name,  # Add the metric name
                                  metric_value = metric_value,  # Add the metric value
                                  stringsAsFactors = FALSE)
            
            # Append the new row to the results DataFrame
            results_full_lr <- rbind(results_full_lr, new_row)
          }
        }
      }
    }
  }
}




assemblers_list_sr <- c("megahit", "metaspades", "unicycler")
datasets_list_sr <- c("sr-even", "sr-log", "sr-ms")

# Initialize an empty DataFrame to store results
results_full_sr <- data.frame(assembler = character(),
                              dataset = character(),
                              test = integer(),
                              reference = character(),
                              metric_name = character(),
                              metric_value = numeric(),
                              stringsAsFactors = FALSE)

for (assembler in assemblers_list_sr) {
  for (dataset in datasets_list_sr) {
    for (test in 1:5) { 
      # Construct the path to the test results
      test_results_path <- paste(results_dir_base, 
                                 assembler, 
                                 dataset,
                                 paste("test", test, sep = ""),
                                 "metaquast",
                                 "summary",
                                 "TXT",
                                 sep = "/")
      
      # List all files in the test results directory
      test_results_files <- list.files(path = test_results_path, full.names = TRUE)
      
      # Print the current combination
      print(paste("Assembler: ",
                  assembler, 
                  "; Dataset: ",
                  dataset,
                  "; Test: ",
                  test,
                  "; Num files: ",
                  length(test_results_files),
                  sep = " "))
      
      
      
      for (file in test_results_files) {
  
        # Read the contents of the file
        file_contents <- read.table(file, header = TRUE, stringsAsFactors = FALSE)
        
        # Get the metric name from the file name without the extension
        metric_name <- file_path_sans_ext(basename(file))
        
        # Assuming the first column contains reference organisms and the rest are metrics
        for (i in 1:nrow(file_contents)) {
          reference <- file_contents[i, 1]  # First column for reference organism
          
          # Loop through each metric column
          for (j in 2:ncol(file_contents)) {
            metric_value <- file_contents[i, j]  # Get the metric value
            
            # Create a new row with the current values
            new_row <- data.frame(assembler = assembler,
                                  dataset = dataset,
                                  test = test,
                                  reference = reference,
                                  metric_name = metric_name,  # Add the metric name
                                  metric_value = metric_value,  # Add the metric value
                                  stringsAsFactors = FALSE)
            
            # Append the new row to the results DataFrame
            results_full_sr <- rbind(results_full_sr, new_row)
          }
        }
      }
    }
  }
}

results_full <- rbind(results_full_sr, results_full_lr)

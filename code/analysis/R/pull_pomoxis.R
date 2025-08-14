library(dplyr)
library(tidyr)
library(readr)
library(stringr)
library(purrr)

results_dir_base <- "../metagenome_results/results/"

assemblers_list_lr <- c("raven", "metaflye", "canu")
datasets_list_lr <- c("lr-even", "lr-log")


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
      
      test_str <- paste("test", 
                        test,
                        sep = "")
      
      raw_pomoxis <- paste(results_dir_base, 
                           assembler,
                           dataset,
                           test_str,
                           "pomoxis",
                           paste(assembler,
                                 dataset,
                                 test_str,
                                 "summ.txt",
                                 sep = "_"),
                           sep = "/")
      
      print(paste("Raw pomoxis at: ",
                  raw_pomoxis))
      
      # 1. Read all lines
      lines <- readLines(raw_pomoxis)
      
      # 2. Identify lines starting new blocks
      starts <- grep("^# ", lines)
      ends   <- c(starts[-1] - 1, length(lines))
      
      # 3. Extract named blocks
      blocks <- map2(starts, ends, ~{
        header <- str_remove(lines[.x], "^#\\s*")
        body   <- lines[(.x+1):.y] %>% str_trim() %>% keep(~ .x != "")
        list(name = header, lines = body)
      })
      
      # Helper to parse a 5-column table (name + 4 stats)
      parse_table5 <- function(txt) {
        txt <- str_replace_all(txt, "%", "")
        read_table(paste(txt, collapse = "\n"),
                    col_names = c("metric","mean","q10","q50","q90"))
      }
      
      # Extract the first two blocks
      blk1 <- blocks[[1]]$lines   # Percentage Errors
      blk2 <- blocks[[2]]$lines   # Q Scores
      
      # Parse them
      df_err <- parse_table5(blk1) %>% rename_with(~ paste0(.,"_err"), -metric)
      df_q   <- parse_table5(blk2) %>% rename_with(~ paste0(.,"_q"),   -metric)
      
      # Join side-by-side
      df_global <- df_err %>%
        inner_join(df_q, by = "metric")
      
      # View
      print(df_global)
      
      # 1. Identify the “Ref Coverage” block
      ref_block <- keep(blocks, ~ .x$name == "Ref Coverage")[[1]]$lines
      df_ref <- read_table2(paste(ref_block, collapse="\n"),
                            col_names = c("species","coverage"))
      
      # 2. Remaining blocks after “Ref Coverage”
      # Find the index of "Ref Coverage"
      i_ref <- which(map_chr(blocks, "name") == "Ref Coverage")
      
      # Take all blocks after that index
      rem <- blocks[(i_ref + 1):length(blocks)]
      
      # 3. Group into pairs: Percentage Errors, Q Scores
      #    Each pair has a header like “bsubtilis1 Percentage Errors”, then “bsubtilis1 Q Scores”
      pairs <- split(rem, rep(1:(length(rem)/2), each = 2))
      
      # 4. For each species, parse both tables and widen
      list_species <- imap(pairs, ~{
        lines_err <- .x[[1]]$lines
        lines_q   <- .x[[2]]$lines
        sp        <- word(.x[[1]]$name, 1)
        
        df_e <- parse_table5(lines_err) %>%
          pivot_longer(-metric, names_to="stat", values_to="value_err")
        df_q <- parse_table5(lines_q) %>%
          pivot_longer(-metric, names_to="stat", values_to="value_q")
        
        df_sp <- df_e %>%
          inner_join(df_q, by = c("metric","stat")) %>%
          unite("col", metric, stat, sep = "_") %>%
          pivot_wider(names_from = col,
                      values_from = c(value_err, value_q),
                      names_glue = "{col}_{.value}") %>%
          mutate(species = sp)
        
        df_sp
      })
      
      # 5. Combine all species with coverage
      df_species <- reduce(list_species, bind_rows) %>%
        left_join(df_ref, by = "species")
      
      # View
      print(df_species)
      
      
    }
  }
}


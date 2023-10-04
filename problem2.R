# Problem 2 - Git and Github Assignment

# Load required packages ---
library(tidyverse)
# ---

# Load raw data ---
raw_file <- readLines("suites_dw_Table1.txt")
# ---

# Saving the variable descriptions ---

# Identify the header line
header_start <- which(grepl("^\\s*name\\s*", raw_file))[2]

# Save variable descriptions
cat(raw_file[1:(header_start-2)], 
    sep = "\n", 
    file = "variable_descriptions.txt")
# ---

# Read data to a tidy data frame ---

# Read the data into a tibble, skipping the lines stored in 'var_descr'
data <- 
  read_delim(
    "suites_dw_Table1.txt", 
    delim = "|",           
    skip = header_start-2, 
    trim_ws = TRUE          
  ) %>% 
  # Clean names and trim white spaces
  janitor::clean_names() %>% 
  mutate(across(everything(), str_trim)) %>% 
  # Convert empty strings to NA
  mutate(across(where(is.character), na_if,"")) %>% 
  mutate(across(where(is.numeric), na_if, NA))

# Remove annoying separator line from the data frame
data <- 
  data %>% 
  slice(-1)
# ---

df_test <- read_csv(
  "suites_dw_Table1.txt",
  skip = header_start - 2,
)

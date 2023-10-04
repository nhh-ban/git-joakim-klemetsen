# Problem 2 - Git and Github Assignment

# Loading required packages ---
library(tidyverse)
# ---

# Loading in the raw data ---
raw_data <- readLines("suites_dw_Table1.txt")
# ---

# Storing the variable descriptions ---

# Find the line where data headers start
# 'name' appears two times, we are interested in the second
header_start <- which(grepl("^\\s*name\\s*", raw_data))[2] # <- 2.

# Directly extract all lines before the header
var_descr <- raw_data[1:(header_start-2)]
# ---

# Formatting the data frame ---

# Initial formatting
data <- 
  read_delim(
    "suites_dw_Table1.txt", # using the table data
    delim = "|",            # character used to separate fields
    skip = header_start-2,  # skip importing of variable descriptions
    trim_ws = TRUE          # trimming white spaces   
  ) %>% 
  janitor::clean_names() %>% 
  mutate(across(everything(), str_trim)) %>% 
  mutate(across(where(is.character), na_if,"")) %>% 
  mutate(across(where(is.numeric), na_if, NA))

# Removing the annoying variable separator from the table
data <- 
  data %>% 
  slice(-1)
# ---
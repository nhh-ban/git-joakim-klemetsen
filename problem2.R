# Problem 2 - Git and Github Assignment

# Load required packages ---
library(tidyverse)
# ---

# Load raw data ---
raw_file <- readLines("suites_dw_Table1.txt")
# ---

# Saving the variable descriptions ---

# Locate the separation row between variable descriptions and the values
L <- which(raw_data == " ")

# Save variable descriptions
var_descr <- raw_data[1:(L-1)]
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

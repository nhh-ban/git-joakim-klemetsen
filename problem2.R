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

# Save the part of raw data containing values of interest
data <- raw_data[(L+1):length(raw_data)]

# Convert the data to a data frame
df <- 
  data %>% 
  read.delim(
    text = .,
    header = TRUE,
    sep = "|",
    strip.white = TRUE
  )

# Remove annoying separator line from the data frame
df <- 
  df %>% 
  slice(-1)

# Investigate data frame
df

# Transform variable 'log_m26' and 'log_mhi' from character to numeric, 
# and remove unexpected symbols in 'log_mhi' 
df_clean <- 
  df %>% 
  mutate(
    log_m26 = as.numeric(log_m26),
    log_mhi = as.numeric(str_replace_all(log_mhi, "<", "")))
# ---


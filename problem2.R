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

# Remove annoying separator line from the data frame
data <- 
  data %>% 
  slice(-1)
# ---

df_test <- read_csv(
  "suites_dw_Table1.txt",
  skip = header_start - 2,
)

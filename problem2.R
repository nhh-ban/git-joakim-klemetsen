# Problem 2 - Git and Github Assignment

# Loading required packages ---
library(tidyverse)
# ---

# Loading in the raw data ---
raw_data <- readLines("suites_dw_Table1.txt")
# ---

# Storing the variable descriptions ---

# Find the line where data headers start
# 'name' appears twise, but in this case we are only interested in the second
header_start <- which(grepl("^\\s*name\\s*", raw_data))[2] # <- 2.

# Combine all lines before the headers into a single string
var_descr <- paste(raw_data[1:(header_start-1)], collapse = "\n")

# ---
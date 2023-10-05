# Problem 3 - Git and Github Assignment

# Load required packages ---

# ---

# Create a function that plots histograms ---
plotVariable <- function(data, variable) {
  
  # Check if variable is in data and is numeric
  if(variable %in% names(data) && is.numeric(data[[variable]])) {
    
    # Plot
    p <- ggplot(data, aes(x = .data[[variable]])) +
      geom_histogram(
        fill = "skyblue", 
        color = "black", 
        alpha = 0.7
      ) +
      labs(
        title = paste("Histogram of ", variable),
        x = variable,
        y = "Frequency"
      ) +
      theme_minimal()
    return(p)
    
    # If the specified variable is invalid or not numeric   
  } else {
    print(paste("Invalid input or non-numeric variable: ", variable))
    return(NULL)
  }
}
# ---

# Loop over variables in the data frame and create list of plots ---

# Initialize empty list to store plots
plot_list <- list()

# Loop over all variables
for (variable in names(df_clean)) {
  
  # Create plot
  p <- plotVariable(data = df_clean, variable = variable)
  
  # Store plot in list if p is not NULL (not numeric or integer)
  if (!is.null(p)) {
    plot_list[[variable]] <- p
  }
}
# ---

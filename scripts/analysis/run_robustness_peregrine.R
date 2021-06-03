args <- commandArgs(TRUE)

param_space_name <- args[1]
param_set <- as.numeric(args[2])
replicates <- as.numeric(args[3])
distance_method <- args[4]
save_output <- TRUE
m <- 1000
metadata <- paste0("This is parameter set ", param_set)

library(DAISIErobustness)

run_robustness(
  param_space_name = args[1],
  param_set = as.numeric(args[2]),
  replicates = as.numeric(args[3]),
  distance_method = args[4],
  save_output = save_output
)

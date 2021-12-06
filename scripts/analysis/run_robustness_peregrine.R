args <- commandArgs(TRUE)

param_space_name <- args[1]
param_set <- as.numeric(args[2])
replicates <- as.numeric(args[3])
distance_method <- args[4]
save_output <- TRUE

library(DAISIErobustness)

run_robustness(
  param_space_name = param_space_name,
  param_set = param_set,
  replicates = replicates,
  distance_method = distance_method,
  save_output = save_output
)

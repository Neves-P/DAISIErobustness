args <- commandArgs(TRUE)

param_space_name <- args[1]
param_set <- as.numeric(args[2])
replicates <- as.numeric(args[3])
save_output <- TRUE

library(DAISIErobustness)

run_robustness(
  param_space_name = param_space_name,
  param_set = param_set,
  replicates = replicates,
  save_output = save_output
)

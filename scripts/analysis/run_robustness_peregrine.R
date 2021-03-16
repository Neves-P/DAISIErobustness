args <- commandArgs(TRUE)

param_space_name <- args[1]
param_set <- as.numeric(args[2])
replicates <- as.numeric(args[3])
distance_method <- args[4]
save_output <- TRUE
M <- 1000

DAISIEutils::print_main_header(
  run_name = param_space_name,
  M = M,
  metadata = param_set
)

DAISIErobustness::run_robustness(
  param_space_name = args[1],
  param_set = as.numeric(args[2]),
  replicates = as.numeric(args[3]),
  distance_method = args[4],
  save_output = save_output
)


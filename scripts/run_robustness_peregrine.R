args <- commandArgs(TRUE)


DAISIErobustness::run_robustness(
  param_space_name = args[1],
  param_set = as.numeric(args[2]),
  replicates = as.numeric(args[3]),
  distance_method = args[4],
  save_output = TRUE
)


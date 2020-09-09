args <- commandArgs(TRUE)
print(args)

DAISIErobustness::run_robustness(
  param_space_name = args[1],
  param_set = args[2],
  replicates = args[3],
  pipeline = args[4],
  distance_method = args[5],
  save_output = TRUE,
  replicate_range = c(args[6], args[7]),
  load_from_file = args[8]
)


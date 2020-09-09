args <- commandArgs()


param_space_name <- args[1]
param_set <- args[2]
replicates <- args[3]
pipeline <- args[4]
distance_method <- args[5]
replicate_range_start <- args[6]
replicate_range_end <- args[7]
load_from_file <- args[8]

replicate_range <- c(replicate_range_start, replicate_range_end)
DAISIErobustness::run_robustness(
  param_space_name = param_space_name,
  param_set = param_set,
  replicates = replicates,
  pipeline = pipeline,
  distance_method = distance_method,
  save_output = TRUE,
  replicate_range = replicate_range,
  load_from_file = load_from_file
)


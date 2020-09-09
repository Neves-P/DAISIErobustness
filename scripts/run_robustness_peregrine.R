args <- commandArgs(TRUE)
print(args)

param_space_name <- args[1]
# param_set <- args[2]
# replicates <- args[3]
# pipeline <- args[4]
# distance_method <- args[5]
# replicate_range_start <- args[6]
# replicate_range_end <- args[7]
# load_from_file <- args[8]

# replicate_range <- c(replicate_range_start, replicate_range_end)
DAISIErobustness::run_robustness(
  param_space_name = param_space_name,
  param_set = 1,
  replicates = 10,
  pipeline = "full",
  distance_method = "abs",
  save_output = TRUE,
  replicate_range = NULL,
  load_from_file = FALSE
)


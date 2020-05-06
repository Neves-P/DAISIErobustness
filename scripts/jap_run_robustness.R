param_space_name <- "nonoceanic"
# Create params for the experiment
param_space <- DAISIErobustness::load_param_space(
  param_space_name = param_space_name
)
params <- vector("list", nrow(param_space))

for (i in seq_len(nrow(param_space))) {
  params[[i]] <- list(
    param_space_name = param_space_name,
    param_set = i,
    replicates = 100,
    save_output = TRUE
  )
}

jap::pocket_experiment(
  github_name = "Neves-P",
  project_name = "DAISIErobustness",
  function_name = "run_robustness",
  params = params,
  cluster_folder = "data",
  cluster_partition = "regular"
)

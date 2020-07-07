run_simulations_peregrine <- function(param_space_name,
                                      cluster_partition = "gelifes") {


  # Create params for the experiment
  param_space <- DAISIErobustness::load_param_space(
    param_space_name = param_space_name
  )


  ## Calculate number of jobs to run
  total_runs <- nrow(param_space)

  # Make params list
  params <- vector("list", total_runs)

  # Populate params list with necessary arguments
  for (i in seq_len(total_runs)) {
    params[[i]] <- list(
      param_space_name = param_space_name,
      param_set = i,
      replicates = 1000,
      pipeline = "novel_sim",
      save_output = TRUE
    )
  }

  # Start RStudio job that submits cluster jobs
  jap::pocket_experiment(
    github_name = "Neves-P",
    project_name = "DAISIErobustness",
    function_name = "run_robustness",
    params = params,
    cluster_folder = "data",
    cluster_partition = cluster_partition,
    delete_on_cluster = FALSE
  )
}

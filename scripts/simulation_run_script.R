run_simulations_peregrine <- function(param_space_name,
                                      cluster_partition = "gelifes",
                                      param_set_range = NULL,
                                      max_n_jobs = 100
) {


  # Create params for the experiment
  param_space <- DAISIErobustness::load_param_space(
    param_space_name = param_space_name
  )

  if (is.null(param_set_range)) {
    total_runs <- nrow(param_space)
    midway_index <- 1
  } else {
    testit::assert(is.numeric(param_set_range))
    midway_index <- param_set_range[1]
    if (param_set_range[1] == 1) {
      total_runs <- param_set_range[2]
    } else {
      total_runs <- param_set_range[2] - param_set_range[1]
    }
  }

  ## Calculate number of jobs to run

  # Make params list
  params <- vector("list", total_runs)

  # Populate params list with necessary arguments
  for (i in midway_index:total_runs) {
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
    delete_on_cluster = FALSE,
    max_n_jobs = max_n_jobs
  )
}

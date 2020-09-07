run_analysis_peregrine <- function(param_space_name,
                                   cluster_partition = "gelifes",
                                   param_set_range = NULL,
                                   max_n_jobs = 100,
                                   replicate_range = NULL) {


  # Create params for the experiment
  param_space <- DAISIErobustness::load_param_space(
    param_space_name = param_space_name
  )

  # Calculate number of jobs to run
  if (!is.null(param_set_range)) {
    param_set_vector <- param_set_range[1]:param_set_range[2]
    total_runs <- length(param_set_vector)
  } else {
    total_runs <- nrow(param_space)
    param_set_vector <- 1:total_runs
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
      pipeline = "analysis",
      save_output = TRUE,
      load_from_file = TRUE,
      replicate_range = replicate_range
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

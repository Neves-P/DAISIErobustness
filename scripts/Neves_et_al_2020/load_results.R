
load_results <- function(param_space_name) {
  path <- file.path("results", param_space_name)
  results_file_names <- list.files(path = path)
  str_output_file <- list()
  num_spec <- list()
  num_col <- list()
  num_spec_file <- c()
  num_col_file <- c()
  for (i in seq_along(results_file_names)) {
    load(file.path(path, results_file_names)[i])
    length_output_file <- length(output_file)
    if (length_output_file == 1) { # failed sim_constraints
      str_output_file[[i]] <- "failed_sim_constraints"
      for (j in seq_along(output_file$geodynamic_sim)) {
        num_spec_file[j] <- unname(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all[nrow(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all), 2] +
          output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all[nrow(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all), 3] +
          output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all[nrow(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all), 4])
        num_col_file[j] <- unname(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all[nrow(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all), 5])
      }
      num_spec[[i]] <- num_spec_file
      num_col[[i]] <- num_col_file
    }
      if (length_output_file == 4) { #failed ml_constraints
        str_output_file[[i]] <- "failed_ml_constraints"
      }
  }

  failed_sim_replicates <- length(which(str_output_file == "failed_sim_constraints"))
  failed_ml_replicates <- length(which(str_output_file == "failed_ml_constraints"))
  return(list(
      failed_sim_replicates = failed_sim_replicates,
      failed_ml_replicates = failed_ml_replicates,
      num_spec = num_spec,
      num_col = num_col
    ))
}

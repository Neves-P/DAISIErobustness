#' Simple statistics of pipeline runs
#'
#' @inheritParams default_params_doc
#'
#' @return A list with a vector per parameter set with each replicate's number
#'   of species at the present, number of colonizing lineages at the present,
#'   number of failed MLs and number of failed sim constraints
#' @author Joshua Lambert, Pedro Neves
get_run_stats <- function(param_space_name) {
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
    }
    for (j in seq_along(output_file$geodynamic_sim)) {
      num_spec_file[j] <- unname(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all[nrow(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all), 2] +
                                   output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all[nrow(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all), 3] +
                                   output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all[nrow(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all), 4])
      num_col_file[j] <- unname(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all[nrow(output_file$geodynamic_sim[[j]][[1]][[1]]$stt_all), 5])
    }
    num_spec[[i]] <- num_spec_file
    num_col[[i]] <- num_col_file
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


#' Ratio of many entries have less than 15 species
#'
#' @param metadata num_spec or num_col as returned by get_run_stats
#'
#' @return A numeric with the ratio
#'
#' @examples
# ratios_less_15 <- lapply(out$num_spec, count_less_15) # Ratio
count_less_15 <- function(metadata) {
  sum(as.numeric(metadata < 15)) / length(metadata)
}

#' Ratio of many entries have more than 15 species
#'
#' @param metadata num_spec or num_col as returned by get_run_stats
#'
#' @return A numeric with the ratio
#'
#' @examples
# ratios_over_100 <- lapply(out$num_spec, count_over_100) # Ratio
count_over_100 <- function(metadata) {
  sum(as.numeric(metadata > 100)) / length(metadata)
}



#' Load all results of a param_space
#'
#' @param param_space_name
#'
#' @return A list with the loaded results
load_results <- function(param_space_name) {
  results_list <- list()
  path <- file.path("results", param_space_name)
  results_file_names <- list.files(path = path)
  for (i in seq_along(results_file_names)) {
    param_set_name <- tools::file_path_sans_ext(results_file_names[i])
    load(file.path(path, results_file_names)[i])
    results_list[[param_set_name]] <- assign(
      param_set_name,
      value = output_file
    )
  }
  results_list
}

# mean_num_spec <- lapply(out$num_spec, mean) # Ratio
# sd_num_spec <- lapply(out$num_spec, sd) # Ratio
# hist(unlist(ratios_less_15))
# hist(unlist(out$num_spec))
# hist(unlist(mean_num_spec), xlim = c(0, 100), breaks = 300)
# hist(unlist(sd_num_spec))


#' Calculate ED95 statistic for all parameter sets of a parameter space.
#'
#' This function will load the results of each parameter set from a given
#' parameter space and compute all associated ED95 statistics. All parameter
#' sets of the parameter space must be in the same folder, located in
#' \code{folder_path}.
#'
#' @inheritParams default_params_doc
#'
#' @return A data frame with E95 statistics containing 7 columns:
#' \itemize{
#'   \item{\code{$param_space_name}}
#'   \item{\code{$param_set}}
#'   \item{\code{$stat_diff_spec_nltt}}
#'   \item{\code{$stat_diff_endemic_nltt}}
#'   \item{\code{$stat_diff_nonendemic_nltt}}
#'   \item{\code{$stat_diff_num_spec}}
#'   \item{\code{$stat_diff_num_col}}
#' }
#' @author Pedro Neves, Joshua W. Lambert
#' @export
calc_ed95_param_set <- function(folder_path) {

  testit::assert("Chosen directory exists", dir.exists(folder_path))

  start_time <- Sys.time()
  message("Start time: ", start_time)
  files <- list.files(folder_path)


  param_sets <- as.numeric(gsub(".*_param_set_\\s*|.RData.*", "\\1", files))
  n_files <- length(param_sets)
  testit::assert(
    ".RData files exist",
    n_files > 0
  )

  message(n_files, " data files found.")
  pb <- utils::txtProgressBar(
    min = 1,
    max = n_files,
    style = 3
  )

  out <- data.frame(
    "param_space_name" = character(),
    "param_set" = numeric(),
    "stat_diff_spec_nltt" = numeric(),
    "stat_diff_endemic_nltt" = numeric(),
    "stat_diff_nonendemic_nltt" = numeric(),
    "stat_diff_num_spec" = numeric(),
    "stat_diff_num_col" = numeric()
  )
row_number <- 1
  for (i in param_sets) {
    file_to_load <- grep(paste0("_", i, ".RData"),
                         files,
                         value = TRUE,
                         fixed = TRUE)

    output <- NULL; rm(output) # nolint ; hack around global var
      load(file.path(folder_path, file_to_load))

      param_space_name <- sub(
        "\\_param_set_.*",
        replacement = "",
        x = file_to_load
      )
      param_set <- i


      geodynamic_error_spec_nltt <- output$spec_nltt_error
      oceanic_error_spec_nltt <- output$spec_baseline_nltt_error

      geodynamic_error_endemic_nltt <- output$endemic_nltt_error
      oceanic_error_endemic_nltt <- output$endemic_baseline_nltt_error

      geodynamic_error_nonendemic_nltt <- output$nonendemic_nltt_error # nolint
      oceanic_error_nonendemic_nltt <- output$nonendemic_baseline_nltt_error

      geodynamic_error_num_spec <- output$num_spec_error
      oceanic_error_num_spec <- output$num_spec_baseline_error

      geodynamic_error_num_col <- output$num_col_error
      oceanic_error_num_col <- output$num_col_baseline_error

      sorted_oceanic_error_spec_nltt <- sort(
        oceanic_error_spec_nltt,
        decreasing = FALSE
      )
      sorted_oceanic_error_endemic_nltt <- sort( # nolint
        oceanic_error_endemic_nltt,
        decreasing = FALSE
      )
      sorted_oceanic_error_nonendemic_nltt <- sort( # nolint
        oceanic_error_nonendemic_nltt,
        decreasing = FALSE
      )
      sorted_oceanic_error_num_spec <- sort(
        oceanic_error_num_spec,
        decreasing = FALSE
      )
      sorted_oceanic_error_num_col <- sort(
        oceanic_error_num_col,
        decreasing = FALSE
      )

      boundary_spec_nltt <- sorted_oceanic_error_spec_nltt[950]
      boundary_endemic_nltt <- sorted_oceanic_error_endemic_nltt[950]
      boundary_nonendemic_nltt <- sorted_oceanic_error_nonendemic_nltt[950]
      boundary_num_spec <- sorted_oceanic_error_num_spec[950]
      boundary_num_col <- sorted_oceanic_error_num_col[950]

      stat_diff_spec_nltt <-
        (sum(geodynamic_error_spec_nltt > boundary_spec_nltt) + 1) /
        (length(sorted_oceanic_error_spec_nltt) + 1)
      stat_diff_endemic_nltt <-
        (sum(geodynamic_error_endemic_nltt > boundary_endemic_nltt) + 1) /
        (length(sorted_oceanic_error_endemic_nltt) + 1)
      stat_diff_nonendemic_nltt <-
        (sum(geodynamic_error_nonendemic_nltt > boundary_nonendemic_nltt) + 1) /
        (length(sorted_oceanic_error_nonendemic_nltt) + 1)
      stat_diff_num_spec <-
        (sum(geodynamic_error_num_spec > boundary_num_spec) + 1) /
        (length(sorted_oceanic_error_num_spec) + 1)
      stat_diff_num_col <-
        (sum(geodynamic_error_num_col > boundary_num_col) + 1) /
        (length(sorted_oceanic_error_num_col) + 1)

      out[row_number, "param_space_name"] <- param_space_name
      out[row_number, "param_set"] <- param_set
      out[row_number, "stat_diff_spec_nltt"] <- stat_diff_spec_nltt
      out[row_number, "stat_diff_endemic_nltt"] <- stat_diff_endemic_nltt
      out[row_number, "stat_diff_nonendemic_nltt"] <- stat_diff_nonendemic_nltt
      out[row_number, "stat_diff_num_spec"] <- stat_diff_num_spec
      out[row_number, "stat_diff_num_col"] <- stat_diff_num_col
      row_number <- row_number + 1
    utils::setTxtProgressBar(pb, row_number)
  }

  message("\nTime elapsed: ", Sys.time() - start_time)
  return(out)
}

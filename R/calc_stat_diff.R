#' Calculate P95 statistic for all parameter sets of a parameter space.
#'
#' This function will load the results of each parameter set from a given
#' parameter space and compute all associated P95 statistics. All parameter sets
#' of the parameter space must be in the same folder, located in
#' \code{folder_path}.
#'
#' @inheritParams default_params_doc
#'
#' @return A list with numeric vectors of P95 statistic for:
#' \itemize{
#'   \item{\code{$stat_diff_spec_nltt}}
#'   \item{\code{$stat_diff_endemic_nltt}}
#'   \item{\code{$stat_diff_nonendemic_nltt}}
#'   \item{\code{$stat_diff_num_spec}}
#'   \item{\code{$stat_diff_num_col}}
#' }
#' @author Pedro Neves, Joshua W. Lambert
#' @export
calc_stat_diff <- function(folder_path, param_set_range = NULL) {

  testit::assert("Chosen directory exists", dir.exists(folder_path))

  start_time <- Sys.time()
  message("Start time: ", start_time)
  files <- list.files(folder_path)
  data_file_indices <- grep(x = files, pattern = ".RData")
  n_files <- length(data_file_indices)
  testit::assert(
    ".RData files exist",
    n_files > 0
  )
  if (is.null(param_set_range)) {
    max_param_range <- max(as.numeric(gsub('^.*_\\s*|\\s*.RData*$', '', files))) # nolint
    param_set_range <- 1:max_param_range
  }
  message(n_files, " data files found.")
  message("Looking for parameter set ",
          min(param_set_range),
          " to ",
          max(param_set_range),
          ".")

  pb <- utils::txtProgressBar(
    min = min(param_set_range),
    max = max(param_set_range),
    style = 3
  )

  stat_diff_spec_nltt <- c()
  stat_diff_endemic_nltt <- c()
  stat_diff_nonendemic_nltt <- c()
  stat_diff_num_spec <- c()
  stat_diff_num_col <- c()

  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".RData"),
                         files,
                         value = TRUE,
                         fixed = TRUE)

    output <- NULL; rm(output) # nolint ; hack around global var
    if (!identical(file_to_load, character())) {
      load(file.path(folder_path, file_to_load))

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

      stat_diff_spec_nltt[i] <-
        (sum(geodynamic_error_spec_nltt > boundary_spec_nltt) + 1) /
        (length(sorted_oceanic_error_spec_nltt) + 1)
      stat_diff_endemic_nltt[i] <-
        (sum(geodynamic_error_endemic_nltt > boundary_endemic_nltt) + 1) /
        (length(sorted_oceanic_error_endemic_nltt) + 1)
      stat_diff_nonendemic_nltt[i] <-
        (sum(geodynamic_error_nonendemic_nltt > boundary_nonendemic_nltt) + 1) /
        (length(sorted_oceanic_error_nonendemic_nltt) + 1)
      stat_diff_num_spec[i] <-
        (sum(geodynamic_error_num_spec > boundary_num_spec) + 1) /
        (length(sorted_oceanic_error_num_spec) + 1)
      stat_diff_num_col[i] <-
        (sum(geodynamic_error_num_col > boundary_num_col) + 1) /
        (length(sorted_oceanic_error_num_col) + 1)
    }
    utils::setTxtProgressBar(pb, i)
  }
  stat_diff_spec_nltt <- stat_diff_spec_nltt[!is.na(stat_diff_spec_nltt)]
  stat_diff_endemic_nltt <-
    stat_diff_endemic_nltt[!is.na(stat_diff_endemic_nltt)]
  stat_diff_nonendemic_nltt <-
    stat_diff_nonendemic_nltt[!is.na(stat_diff_nonendemic_nltt)]
  stat_diff_num_spec <- stat_diff_num_spec[!is.na(stat_diff_num_spec)]
  stat_diff_num_col <- stat_diff_num_col[!is.na(stat_diff_num_col)]

  message("\nTime elapsed: ", Sys.time() - start_time)
  return(list(
    stat_diff_spec_nltt = stat_diff_spec_nltt,
    stat_diff_endemic_nltt = stat_diff_endemic_nltt,
    stat_diff_nonendemic_nltt = stat_diff_nonendemic_nltt,
    stat_diff_num_spec = stat_diff_num_spec,
    stat_diff_num_col = stat_diff_num_col
  ))
}

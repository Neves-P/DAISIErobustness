#' Calculate ED95 statistic for all parameter sets of a parameter space
#'
#' This function will load the results of each parameter set from a given
#' parameter space and compute all associated ED95 statistics. All parameter
#' sets of the parameter space must be in the same folder, located in
#' \code{folder_path}. The return type is appropriate for the main plot
#' functions.
#'
#' @inheritParams default_params_doc
#'
#' @return A list with numeric vectors of ED95 statistic for:
#' \itemize{
#'   \item{\code{$ed95_spec_nltt}}
#'   \item{\code{$ed95_endemic_nltt}}
#'   \item{\code{$ed95_nonendemic_nltt}}
#'   \item{\code{$ed95_num_spec}}
#'   \item{\code{$ed95_num_col}}
#' }
#' @author Pedro Neves, Joshua W. Lambert
#' @export
calc_ed95_for_plots <- function(folder_path, param_set_range = NULL) {

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

  ed95_spec_nltt <- c()
  ed95_endemic_nltt <- c()
  ed95_nonendemic_nltt <- c()
  ed95_num_spec <- c()
  ed95_num_col <- c()

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


      boundary_spec_nltt <- quantile(oceanic_error_spec_nltt, 0.95)
      boundary_endemic_nltt <- quantile(oceanic_error_endemic_nltt, 0.95)
      boundary_nonendemic_nltt <- quantile(oceanic_error_nonendemic_nltt, 0.95)
      boundary_num_spec <- quantile(oceanic_error_num_spec, 0.95)
      boundary_num_col <- quantile(oceanic_error_num_col, 0.95)

      ed95_spec_nltt[i] <-
        (sum(geodynamic_error_spec_nltt > boundary_spec_nltt) + 1) /
        (length(oceanic_error_spec_nltt) + 1)
      ed95_endemic_nltt[i] <-
        (sum(geodynamic_error_endemic_nltt > boundary_endemic_nltt) + 1) /
        (length(oceanic_error_endemic_nltt) + 1)
      ed95_nonendemic_nltt[i] <-
        (sum(geodynamic_error_nonendemic_nltt > boundary_nonendemic_nltt) + 1) /
        (length(oceanic_error_nonendemic_nltt) + 1)
      ed95_num_spec[i] <-
        (sum(geodynamic_error_num_spec > boundary_num_spec) + 1) /
        (length(oceanic_error_num_spec) + 1)
      ed95_num_col[i] <-
        (sum(geodynamic_error_num_col > boundary_num_col) + 1) /
        (length(oceanic_error_num_col) + 1)
    }
    utils::setTxtProgressBar(pb, i)
  }
  ed95_spec_nltt <- ed95_spec_nltt[!is.na(ed95_spec_nltt)]
  ed95_endemic_nltt <-
    ed95_endemic_nltt[!is.na(ed95_endemic_nltt)]
  ed95_nonendemic_nltt <-
    ed95_nonendemic_nltt[!is.na(ed95_nonendemic_nltt)]
  ed95_num_spec <- ed95_num_spec[!is.na(ed95_num_spec)]
  ed95_num_col <- ed95_num_col[!is.na(ed95_num_col)]

  message("\nTime elapsed: ", Sys.time() - start_time)
  return(list(
    ed95_spec_nltt = ed95_spec_nltt,
    ed95_endemic_nltt = ed95_endemic_nltt,
    ed95_nonendemic_nltt = ed95_nonendemic_nltt,
    ed95_num_spec = ed95_num_spec,
    ed95_num_col = ed95_num_col
  ))
}

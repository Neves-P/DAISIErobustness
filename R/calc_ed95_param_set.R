#' Calculate ED95 statistic for all results in folder
#'
#' This function will load the results of each parameter set from all
#' parameter spaces and compute all associated ED95 statistics. All parameter
#' sets must be inside named sub folders inside \code{folder_path}. Return type
#' is appropriate for functions dealing with run time vs ED95 correlations.
#'
#' @inheritParams default_params_doc
#'
#' @return A data frame with ED95 statistics containing 7 columns:
#' \itemize{
#'   \item{\code{$param_space_name}}
#'   \item{\code{$param_set}}
#'   \item{\code{$ed95_spec_nltt}}
#'   \item{\code{$ed95_endemic_nltt}}
#'   \item{\code{$ed95_nonendemic_nltt}}
#'   \item{\code{$ed95_num_spec}}
#'   \item{\code{$ed95_num_col}}
#' }
#' @author Pedro Neves, Joshua W. Lambert
#' @keywords internal
#' @export
calc_ed95_param_set <- function(folder_path) {

  testit::assert("Chosen directory exists", dir.exists(folder_path))

  start_time <- Sys.time()
  message("Start time: ", start_time)
  files <- list.files(folder_path, recursive = TRUE)


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
    "ed95_spec_nltt" = numeric(),
    "ed95_endemic_nltt" = numeric(),
    "ed95_nonendemic_nltt" = numeric(),
    "ed95_num_spec" = numeric(),
    "ed95_num_col" = numeric()
  )
  row_number <- 1
  for (file_to_load in files) {

    output <- NULL; rm(output) # nolint ; hack around global var
    load(file.path(folder_path, file_to_load))

    param_space_name <- sub(
      "/.*\\_param_set_.*",
      replacement = "",
      x = file_to_load
    )

    param_set <- as.numeric(gsub(
      ".*[_]([^.]+)[.].*",
      replacement = "\\1",
      x = file_to_load
    ))

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

    ed95_spec_nltt <-
      (sum(geodynamic_error_spec_nltt > boundary_spec_nltt) + 1) /
      (length(oceanic_error_spec_nltt) + 1)
    ed95_endemic_nltt <-
      (sum(geodynamic_error_endemic_nltt > boundary_endemic_nltt) + 1) /
      (length(oceanic_error_endemic_nltt) + 1)
    ed95_nonendemic_nltt <-
      (sum(geodynamic_error_nonendemic_nltt > boundary_nonendemic_nltt) + 1) /
      (length(oceanic_error_nonendemic_nltt) + 1)
    ed95_num_spec <-
      (sum(geodynamic_error_num_spec > boundary_num_spec) + 1) /
      (length(oceanic_error_num_spec) + 1)
    ed95_num_col <-
      (sum(geodynamic_error_num_col > boundary_num_col) + 1) /
      (length(oceanic_error_num_col) + 1)


    out[row_number, "param_space_name"] <- param_space_name
    out[row_number, "param_set"] <- param_set
    out[row_number, "ed95_spec_nltt"] <- ed95_spec_nltt
    out[row_number, "ed95_endemic_nltt"] <- ed95_endemic_nltt
    out[row_number, "ed95_nonendemic_nltt"] <- ed95_nonendemic_nltt
    out[row_number, "ed95_num_spec"] <- ed95_num_spec
    out[row_number, "ed95_num_col"] <- ed95_num_col
    row_number <- row_number + 1
    utils::setTxtProgressBar(pb, row_number)
  }

  message("\nTime elapsed: ", Sys.time() - start_time)
  return(out)
}

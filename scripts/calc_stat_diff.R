#' Calculate stat diff
#'
#' @inheritParams default_params_doc
#'
#' @return Numeric vector with computed statistic.
calc_stat_diff <- function(folder_path, error, param_set_range = NULL) {

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

  stat_diff <- c()

  for (i in param_set_range) {
    file_to_load <- grep(paste0("_", i, ".RData"),
                         files,
                         value = TRUE,
                         fixed = TRUE)

    if (!identical(file_to_load, character())) {
      load(file.path(folder_path, file_to_load))

      if (error == "spec_nltt") {
        geodynamic_error <- output$spec_nltt_error
        oceanic_error <- output$spec_baseline_nltt_error
      } else if (error == "endemic_nltt") {
        geodynamic_error <- output$endemic_nltt_error
        oceanic_error <- output$endemic_baseline_nltt_error

      } else if (error == "nonendemic_nltt") {
        geodynamic_error <- output$nonendemic_nltt_error
        oceanic_error <- output$nonendemic_baseline_nltt_error

      } else if (error == "num_spec") {
        geodynamic_error <- output$num_spec_error
        oceanic_error <- output$num_spec_baseline_error

      } else if (error == "num_col") {
        geodynamic_error <- output$num_col_error
        oceanic_error <- output$num_col_baseline_error
      }

      sorted_oceanic_error <- sort(oceanic_error, decreasing = FALSE)
      boundary <- sorted_oceanic_error[950]

      stat_diff[i] <- (sum(geodynamic_error > boundary) + 1) /
        (length(sorted_oceanic_error) + 1)
    }
    utils::setTxtProgressBar(pb, i)
  }
  stat_diff <- stat_diff[!is.na(stat_diff)]

  message("\nTime elapsed: ", Sys.time() - start_time)
  return(stat_diff)
}

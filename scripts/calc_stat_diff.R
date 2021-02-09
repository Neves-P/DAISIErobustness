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

  pb <- utils::txtProgressBar(min = 0, max = n_files, style = 3)

  stat_diff <- c()

  for (i in data_file_indices) {
    load(file.path(folder_path, files[i]))

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
    utils::setTxtProgressBar(pb, i)
  }

  message("\nTime elapsed: ", Sys.time() - start_time)
  return(stat_diff)
}

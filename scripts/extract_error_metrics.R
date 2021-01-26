#' Extract DAISIErobustness error metrics from HPCC runs
#'
#' @param folder_path Character with path to data folder containing .RData
#'   files, one per successful parameter set.
#'
#' @return A list with 10 vectors. Each vector corresponds to one error metric.
#'   Each vector has as many elements as there are parameter sets
#' @author Pedro Neves
#'
#' @examples
#' \dontrun{
#' out <- extract_error_metrics(folder_path = "/nonoceanic")
#' }
extract_error_metrics <- function(folder_path) {
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


  num_spec_mean_diff <- c()
  num_spec_sd_diff <- c()
  num_col_mean_diff <- c()
  num_col_sd_diff <- c()
  spec_nltt_mean_diff <- c()
  endemic_nltt_mean_diff <- c()
  nonendemic_nltt_mean_diff <- c()
  spec_nltt_sd_diff <- c()
  endemic_nltt_sd_diff <- c()
  nonendemic_nltt_sd_diff <- c()


  pb <- utils::txtProgressBar(min = 0, max = n_files, style = 3)

  for (i in data_file_indices) {
    load(file.path(folder_path, files[i]))

    num_spec_mean_diff[i] <- output$error_metrics$num_spec_mean_diff
    num_spec_sd_diff[i] <- output$error_metrics$num_spec_sd_diff
    num_col_mean_diff[i] <- output$error_metrics$num_col_mean_diff
    num_col_sd_diff[i] <- output$error_metrics$num_col_sd_diff
    spec_nltt_mean_diff[i] <- output$error_metrics$spec_nltt_mean_diff
    endemic_nltt_mean_diff[i] <- output$error_metrics$endemic_nltt_mean_diff
    nonendemic_nltt_mean_diff[i] <-
      output$error_metrics$nonendemic_nltt_mean_diff
    spec_nltt_sd_diff[i] <- output$error_metrics$spec_nltt_sd_diff
    endemic_nltt_sd_diff[i] <- output$error_metrics$endemic_nltt_sd_diff
    nonendemic_nltt_sd_diff[i] <- output$error_metrics$nonendemic_nltt_sd_diff

    utils::setTxtProgressBar(pb, i)
  }

  error_metrics_list <- list(
    num_spec_mean_diff = num_spec_mean_diff,
    num_spec_sd_diff = num_spec_sd_diff,
    num_col_mean_diff = num_col_mean_diff,
    num_col_sd_diff = num_col_sd_diff,
    spec_nltt_mean_diff = spec_nltt_mean_diff,
    endemic_nltt_mean_diff = endemic_nltt_mean_diff,
    nonendemic_nltt_mean_diff = nonendemic_nltt_mean_diff,
    spec_nltt_sd_diff = spec_nltt_sd_diff,
    endemic_nltt_sd_diff = endemic_nltt_sd_diff,
    nonendemic_nltt_sd_diff = nonendemic_nltt_sd_diff
  )

  testit::assert(
    "All error metrics have same size",
    vapply(X = error_metrics_list, FUN = length, FUN.VALUE = rep(x = 10)) ==
      n_files
  )
  testit::assert(
    "All error metrics extracted",
    length(error_metrics_list$num_spec_mean_diff) == n_files &&
      length(error_metrics_list$num_spec_mean_diff) > 0
  )
  message("\nTime elapsed: ", Sys.time() - start_time)
  return(error_metrics_list)
}

#' Merge results from two replicate ranges
#'
#' @param param_space string of parameter space
#'
#' @return list of error metrics
#' @export
merge_analysis_replicates <- function(param_space = "oceanic_ontogeny") {
  if (param_space == "oceanic_ontogeny") {
    wd_1 <- "C:/Users/user/Desktop/DAISIE_analysis/oceanic_ontogeny_1_500"
    wd_2 <- "C:/Users/user/Desktop/DAISIE_analysis/oceanic_ontogeny_501_1000"
  }

  setwd(wd_1)
  files_1_500 <- list.files()
  which_passed_files_1_500 <- grep(pattern = "passed", x = files_1_500)
  passed_files_1_500 <- files_1_500[which_passed_files_1_500]

  setwd(wd_2)
  files_501_1000 <- list.files()
  which_passed_files_501_1000 <- grep(pattern = "passed", x = files_501_1000)
  passed_files_501_1000 <- files_501_1000[which_passed_files_501_1000]

  matched_passed_files <- passed_files_1_500 %in% passed_files_501_1000
  passed_files <- passed_files_1_500[matched_passed_files == TRUE]

  setwd(wd_1)
  for (i in seq_along(passed_files)) {
    load(passed_files[i])
    names <- paste("result_1_500", i, sep = "_")
    assign(names, output[1:6])
  }

  result_1_1000 <- list()
  setwd(wd_2)
  for (i in seq_along(passed_files)) {
    load(passed_files[i])
    names <- paste("result_501_1000", i, sep = "_")
    assign(names, output[1:6])
    result_1_500 <- get(paste("result_1_500", i, sep = "_"))
    result_501_1000 <- get(paste("result_501_1000", i, sep = "_"))
    spec_error_nltt <- c(
      result_1_500$spec_error$nltt,
      result_501_1000$spec_error$nltt)
    spec_error_num_spec_error <- c(
      result_1_500$spec_error$num_spec_error,
      result_501_1000$spec_error$num_spec_error)
    spec_error_num_col_error <- c(
      result_1_500$spec_error$num_col_error,
      result_501_1000$spec_error$num_col_error)
    endemic_error <- c(
      result_1_500$endemic_error$nltt,
      result_501_1000$endemic_error$nltt)
    nonendemic_error <- c(
      result_1_500$nonendemic_error$nltt,
      result_501_1000$nonendemic_error$nltt)
    spec_baseline_error_nltt <- c(
      result_1_500$spec_baseline_error$nltt,
      result_501_1000$spec_baseline_error$nltt)
    spec_baseline_error_num_spec_error <- c(
      result_1_500$spec_baseline_error$num_spec_error,
      result_501_1000$spec_baseline_error$num_spec_error)
    spec_baseline_error_num_col_error <- c(
      result_1_500$spec_baseline_error$num_col_error,
      result_501_1000$spec_baseline_error$num_col_error)
    endemic_baseline_error <- c(
      result_1_500$endemic_baseline_error$nltt,
      result_501_1000$endemic_baseline_error$nltt)
    nonendemic_baseline_error <- c(
      result_1_500$nonendemic_baseline_error$nltt,
      result_501_1000$nonendemic_baseline_error$nltt)
    result_1_1000[[i]] <- list(
      spec_error_nltt = spec_error_nltt,
      spec_error_num_spec_error = spec_error_num_spec_error,
      spec_error_num_col_error = spec_error_num_col_error,
      endemic_error = endemic_error,
      nonendemic_error = nonendemic_error,
      spec_baseline_error_nltt = spec_baseline_error_nltt,
      spec_baseline_error_num_spec_error = spec_baseline_error_num_spec_error,
      spec_baseline_error_num_col_error = spec_baseline_error_num_col_error,
      endemic_baseline_error = endemic_baseline_error,
      nonendemic_baseline_error = nonendemic_baseline_error)
  }
  return(result_1_1000)
}

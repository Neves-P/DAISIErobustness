#' Get param_space number from log file
#'
#' @param path String with path where log files are located.
#'
#' @return Numeric vector with param_space of jobs in the log files
#' @export
get_submitted_param_sets <- function(path) {

  all_files <- list.files(path)

  submitted_param_sets <- c()
  for (file in seq_along(all_files)) {

    function_call_line <- readLines(file.path(path, all_files[file]), n = 5)[5]
    pattern <- "param_set=(.*?),"
    param_set <-
      as.numeric(regmatches(
        function_call_line,
        regexec(pattern, function_call_line))[[1]][2]
      )
    submitted_param_sets <- c(submitted_param_sets, param_set)
  }
  return(submitted_param_sets)
}

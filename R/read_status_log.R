#' Calculate job elapsed time from log file
#'
#' Obtains the elapsed job time in seconds from a standard Peregrine HPCC log
#' file
#'
#' @inheritParams default_params_doc
#'
#' @return A character vector with the status of the job noted in a given log
#'   file
#' @author Pedro Santos Neves
#' @export
read_status_log <- function(log_lines) {
  state_line_bools <- grepl("State               : ", log_lines)
  state_line <- log_lines[state_line_bools]
  state_line <- sub(".*: ", replacement = "", x = state_line)
  if (!length(state_line) == 1 || !is.character(state_line)) {
    state_line_bools <- grepl("DUE TO TIME LIMIT", log_lines)
    if (any(state_line_bools)) {
      state_line <- "TIMEOUT"
    }
  }
  return(state_line)
}

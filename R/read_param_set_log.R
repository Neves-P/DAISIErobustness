#' Reads parameter set number written in log file
#'
#' Obtains the parameter set number from a standard Peregrine HPCC log file.
#'
#' @inheritParams default_params_doc
#'
#' @return An numeric atomic vector with the parameter set number
#' @author Pedro Neves
#' @export
#'
#' @examples
#' \dontrun{
#' log_lines <- read_log_file("logs/robustness-20596511.log")
#' param_set <- read_param_set_log(
#'   log_lines = log_lines,
#'   log_file_path = "logs/robustness-20596511.log"
#' )
#' }
read_param_set_log <- function(log_lines, log_file_path) {

  param_set_line_bools <- grepl("Running param set: ", log_lines)
  param_set_line <- log_lines[param_set_line_bools]
  if (!(length(param_set_line) == 1 && is.character(param_set_line))) {
    warning("Corrupted log file: ", basename(log_file_path))
    return(NA)
  }
  param_set <- as.numeric(
    sub(".*: ", replacement = "", x = param_set_line)
  )

  testit::assert(is.numeric(param_set) && length(param_set) == 1)
  param_set
}

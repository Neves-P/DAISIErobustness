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
#' param_set <- read_param_set_log(
#'   log_file_path = "logs/robustness-20596511.log"
#' )
#' }
read_param_set_log <- function(log_file_path) {
  log_lines <- readLines(con = log_file_path, n = 300)

  param_set_line_bools <- grepl("Running param set: ", log_lines)
  param_set_line <- log_lines[param_set_line_bools]
  testit::assert(length(param_set_line) == 1 && is.character(param_set_line))
  param_set <- as.numeric(
    sub(".*: ", replacement = "", x = param_set_line)
  )

  testit::assert(is.numeric(param_set) && length(param_set) == 1)
  param_set
}

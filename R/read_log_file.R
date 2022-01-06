#' Read log file lines
#'
#' Simply sanitizes the input path and reads log files into a character vector.
#'
#' @param default_params_docs
#'
#' @return Character vector with the contents of the log file as returned by
#'   \code{\link{readLines}()}.
#' @export
#'
#' @author Pedro Neves
read_log_file <- function(log_file_path) {
  testit::assert(is.character(log_file_path) && length(log_file_path) > 0)
  log_lines <- readLines(con = log_file_path, n = 2000)
  return(log_lines)
}

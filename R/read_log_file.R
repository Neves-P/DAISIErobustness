#' Read log file lines
#'
#' Simply sanitizes the input path and reads log files into a character vector.
#'
#' @inheritParams default_params_doc
#'
#' @return Character vector with the contents of the log file as returned by
#'   \code{\link{readLines}()}.
#' @export
#'
#' @author Pedro Santos Neves
read_log_file <- function(log_file_path) {
  testit::assert(is.character(log_file_path) && length(log_file_path) > 0)
  log_lines <- readLines(con = log_file_path, n = 3500)
  return(log_lines)
}

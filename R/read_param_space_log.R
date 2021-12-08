#' Reads parameter space name written in log file
#'
#' Obtains the parameter space name from a standard Peregrine HPCC log file.
#'
#' @inheritParams default_params_doc
#'
#' @return A character atomic vector with the parameter space name
#' @author Pedro Neves
#' @export
#'
#' @examples
#' \dontrun{
#' param_space_name <- read_param_space_name_log(
#'   log_file_path = "logs/robustness-20596511.log"
#' )
#' }
read_param_space_name_log <- function(log_file_path) {
  log_lines <- readLines(con = log_file_path, n = 300)

  param_space_line_bools <- grepl("Param space name: ", log_lines)
  param_space_line <- log_lines[param_space_line_bools]

  if (!(length(param_space_line) == 1 && is.character(param_space_line))) {
    warning("Corrupted log file: ", basename(log_file_path))
    return(paste0("corrupted_", basename(log_file_path)))
  }

  param_space_name <- sub(".*: ", replacement = "", x = param_space_line)


  testit::assert(length(param_space_name) == 1)
  testit::assert(is_param_space_name(param_space_name) ||
                   grepl("corrupted_", param_space_name))
  param_space_name
}

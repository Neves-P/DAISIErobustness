#' Make runtime data frame
#'
#' @inheritParams default_params_doc
#'
#' @return
#' A data frame with three columns:
#' \describe{
#'   \item{\code{param_space_name}}{Atomic character vector with parameter space
#'     name.}
#'   \item{\code{param_set}}{Atomic numeric vector with parameter space number.}
#'   \item{\code{runtime}}{Atomic numeric vector with Peregrine job run time in
#'   seconds.}
#'   \item{\code{log_name}}{Character vector with name of corresponding log file
#'   to facilitate debugging.}
#' }
#' @author Pedro Neves
#' @export
#' @keywords internal
#'
#' @examples
#' \dontrun{
#' runtimes_data_frame <- get_runtime_params("logs/")
#' }
get_runtime_params <- function(logs_folder_path) {
  log_files <- list.files(logs_folder_path, full.names = TRUE, pattern = ".log")

  out <- data.frame(
    "param_space_name" = character(),
    "param_set" = numeric(),
    "runtime" = numeric(),
    "log_name" = character()
  )

  for (i in seq_along(log_files)) {
    param_space_name <- read_param_space_name_log(log_file_path = log_files[i])
    param_set <- read_param_set_log(log_file_path = log_files[i])
    runtime <- read_runtime_log(log_file_path = log_files[i])

    out[i, "param_space_name"] <- param_space_name
    out[i, "param_set"] <- param_set
    out[i, "runtime"] <- runtime
    out[i, "log_name"] <- basename(log_files[i])
  }

  out <- out[order(out$param_space_name, out$param_set), ]
  testit::assert(nrow(out) == length(log_files))
  testit::assert(is.data.frame(out))
  out
}

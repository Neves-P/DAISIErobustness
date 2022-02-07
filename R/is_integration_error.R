#' Checks if log file shows integration error
#'
#'
#' @inheritParams default_params_doc
#'
#' @return A boolean, \code{TRUE} if integration error occured, \code{FALSE} if
#' not.
#' @keywords internal
#' @author Pedro Santos Neves
is_integration_error_log <- function(log_lines) {
  any(grepl("cpp_daisie_cs_runmod", log_lines))
}

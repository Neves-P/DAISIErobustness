#' Checks if number of valid errors meet the criteria for data sample size
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Logical \code{TRUE} if criteria are met, \code{FALSE} if not.
#' @family sample size constraints
ml_constraints <- function(spec_baseline_error) {
  testit::assert(is.list(spec_baseline_error))
  count_string <- length(which(is.character(spec_baseline_error)))
  prop_strings <- count_strings / length(spec_baseline_error)
  testit::assert(is.numeric(prop_strings))
  testit::assert(prop_strings <= 1 && prop_strings >= 0)
  if (prop_strings > 0.01) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

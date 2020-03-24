#' Checks if number of valid errors meet the criteria for data sample size
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Logical \code{TRUE} if criteria are met, \code{FALSE} if not.
#' @family sample size constraints
ml_constraints <- function(spec_baseline_error) {
  count_strings <- 0
  for (n_reps in seq_along(spec_baseline_error)) {
    if (is.character(spec_baseline_error[[n_reps]])) {
      count_strings <- count_strings + 1
    }
  }
  prop_strings <- count_strings / length(spec_baseline_error)
  if (prop_strings > 0.01) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

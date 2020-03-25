#' Checks if number of valid errors meet the criteria for data sample size
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Logical \code{TRUE} if criteria are met, \code{FALSE} if not.
#' @family sample size constraints
ml_constraints <- function(oceanic_ml) {
  testit::assert(is.list(oceanic_ml))
  failed_mls <- sapply(oceanic_ml, FUN = is.character)
  count_fails <- sum(as.numeric(failed_mls))
  prop_fails <- count_fails / length(oceanic_ml)
  testit::assert(is.numeric(prop_fails))
  testit::assert(prop_fails <= 1 && prop_fails >= 0)
  if (prop_fails > 0.01) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

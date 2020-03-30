#' Checks if number of valid errors meet the criteria for data sample size
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Logical \code{TRUE} if criteria are met, \code{FALSE} if not.
ml_constraints <- function(ml) {
  testit::assert(is.list(ml))
  failed_mls <- sapply(ml, FUN = is.character)
  if (any(failed_mls) == TRUE) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

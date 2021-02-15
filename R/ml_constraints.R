#' Checks if MLE passed or errored
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @keywords internal
#' @return Logical \code{TRUE} if criteria are met, \code{FALSE} if not.
ml_constraints <- function(ml) {
  testit::assert(is.data.frame(ml))
  failed_ml <- any(sapply(ml, is.na)) || (ml$loglik == Inf)
  if (failed_ml == TRUE) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

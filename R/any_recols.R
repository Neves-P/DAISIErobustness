#' Determines if the island contains any recolonisations that survived to the
#' present
#'
#' @inheritParams default_params_doc
#' @return Boolean
#' @export
any_recols <- function(sim) {
  testit::assert(is.list(sim))
  sim <- sim[-1]
  stacs <- unlist(lapply(sim, "[[", "stac"))
  any_recols <- any(stacs == 3)
  return(any_recols)
}

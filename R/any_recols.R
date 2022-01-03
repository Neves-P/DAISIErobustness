#' Determines if the island contains any recolonisations that survived to the
#' present
#'
#' @inheritParams default_params_doc
#' @return Boolean
#' @export
any_recols <- function(island) {
  browser()
  testit::assert(is.list(island))
  island <- island[-1]
  stacs <- unlist(lapply(island, "[[", "stac"))
  any_recols <- any(stacs == 3)
  return(any_recols)
}

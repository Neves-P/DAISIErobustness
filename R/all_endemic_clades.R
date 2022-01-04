#' Checks if all island species are endemic clades. Clade are colonisations that
#' have formed an island clade of two or more species surviving to the present.
#'
#' @inheritParams default_params_doc
#'
#' @return Boolean
#' @author Joshua W. Lambert
#' @export
all_endemic_clades <- function(sim) {
  testit::assert(is.list(sim))
  all_endemic <- all_endemic(sim)
  if (isFALSE(all_endemic)) {
    return(FALSE)
  }
  sim <- sim[-1]
  branching_times <- lapply(sim, "[[", "branching_times")
  num_spec <- unlist(lapply(branching_times, function(x) {
    length(x) - 1
  }))
  stacs <- unlist(lapply(sim, "[[", "stac"))
  clades <- all(num_spec[which(stacs != 3)] > 1)
  if (any(stacs == 3)) {
    recol <- sim[which(stacs == 3)]
    all_cols <- lapply(recol, "[[", "all_colonisations")
    event_times <- lapply(all_cols,
                          function(x) {
                            lapply(x, "[[", "event_times")
                          })
    num_recol_spec <- unlist(
      lapply(event_times, function(x) {
        lapply(x, function(y) length(y) - 1)
      })
    )
    recol_clades <- all(num_recol_spec > 1)
    clades <- clades && recol_clades
  }
  if (clades) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

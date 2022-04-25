#' Measures if the input is a valid collection of simulation
#' outputs.
#'
#' @details Adapted from \code{\link[DAISIE]{is_simulation_outputs}()}
#' @inheritParams default_params_doc
#'
#' @return TRUE if the input is a valid collection of simulation
#' outputs.
#' @author Richèl J.C Bilderbeek, Pedro Santos Neves
is_novel_sim_outputs <- function(novel_sim) {
    if (!"island_age" %in% names(novel_sim[[1]][[1]]))
      return(FALSE)
    if (!("not_present" %in% names(novel_sim[[1]][[1]]) ||
          "not_present_type1" %in%
          names(novel_sim[[1]][[1]]))) {
      return(FALSE)
    }
    if (!"stt_all" %in% names(novel_sim[[1]][[1]])) {
      return(FALSE)
    # TODO: Figure out how to test this?
    # if (!"branching_times" %in% names(simulation_outputs)) return(FALSE) # nolint
    # if (!"stac" %in% names(simulation_outputs)) return(FALSE) # nolint
    # if (!"missing_species" %in% names(simulation_outputs)) return(FALSE) # nolint
  }
  if (is.list(novel_sim) && length(novel_sim) >= 1) {
    return(TRUE)
  }
}

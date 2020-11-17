#' Get param set IDs stored in results folder
#'
#' @inheritParams default_params_doc
#'
#' @return A vector with param_set IDs
#' @author Joshua Lambert, Pedro Neves
get_available_results <- function(param_space_name) {
  testit::assert(is.character(param_space_name))
  if (interactive() && .Platform$OS.type == "windows") {
    path <- utils::choose.dir(getwd(), "Choose a suitable folder")
  }
  all_file_names <- list.files(path = path)
  param_sets <- sub(".*_ *(.*?) *.RData.*", "\\1", all_file_names)
  out <- sort(as.numeric(param_sets))
  return(out)
}

#' Measures if the input is a valid collection of simulation
#' outputs.
#'
#' @details Adapted from \code{\link[DAISIE]{is_simulation_outputs}()}
#' @inheritParams default_params_doc
#'
#' @return TRUE if the input is a valid collection of simulation
#' outputs.
#' @author Richèl J.C Bilderbeek, Pedro Neves
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

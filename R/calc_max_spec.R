#' Obtain the number of species in the largest clade of each island
#'
#' @inheritParams default_params_doc
#'
#' @return A numeric vector with the number of species in the largest clade
#'  in a given island, per replicate.
#' @author Joshua Lambert, Pedro Neves, Shu Xie
calc_max_spec <- function(novel_sim) {
  sim_replicates <- lapply(novel_sim, `[[`, 1)
  n_spec_clade <- c()
  max_spec_clade <- c()
  for (n_replicate in seq_along(sim_replicates)) {
    for (n_clade in 2:length(sim_replicates[[n_replicate]])) {
      branching_times_length <- length(
        sim_replicates[[n_replicate]][[n_clade]]$branching_times
      )
      n_spec_clade[n_clade - 1] <- branching_times_length - 1
    }
    max_spec_clade[n_replicate] <- max(n_spec_clade)
  }
  testit::assert(
    is.numeric(max_spec_clade) && is.finite(max_spec_clade)
  )
  testit::assert(
    length(max_spec_clade) == length(novel_sim)
  )
  return(max_spec_clade)
}
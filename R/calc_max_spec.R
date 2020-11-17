#' Obtain the number of species in the largest clade
#'
#' @inheritParams default_params_doc
#'
#' @return A numeric with the number of species in the largest clade
#'  in a given island.
#' @author Joshua Lambert, Pedro Neves, Shu Xie
calc_max_spec <- function(novel_sim) {
  novel_sim_clades <- novel_sim
  novel_sim_clades[[1]][[1]] <- NULL
  num_spec <- c()
  for (i in seq_along(novel_sim_clades[[1]])) {
    num_spec[i] <- length(novel_sim_clades[[1]][[i]]$branching_times) - 1
  }
  max_spec_clade <- max(num_spec)

  testit::assert(
    is.numeric(max_spec_clade) && all(is.finite(max_spec_clade))
  )
  return(max_spec_clade)
}

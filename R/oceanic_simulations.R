#' Runs original oceanic DAISIE simulation
#'
#' @inheritParams default_params_doc
#'
#' @return Output from \code{\link{DAISIE_sim_constant_rate}}
#' @export
#'
#' @examples oceanic_simulations <- oceanic_simulations(
#'               ml = ml,
#'               simulation_pars = simulation_pars)
oceanic_simulations <- function(ml,
                                simulation_pars) {
  oceanic_simulations <- list()
  for (i in seq_along(ml)) {
    oceanic_simulations[[i]] <- DAISIE::DAISIE_sim_constant_rate(
      time = simulation_pars$time,
      M = simulation_pars$M,
      pars = as.numeric(ml[[i]][1:5]),
      replicates = 1,
      plot_sims = FALSE,
      verbose = TRUE,
      sample_freq = Inf
    )
  }
  return(oceanic_simulations)
}

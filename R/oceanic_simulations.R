#' Runs original oceanic DAISIE simulation
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Output from \code{\link[DAISIE]{DAISIE_sim_constant_rate}}
#' @family simulation functions
#' @export
oceanic_simulations <- function(ml,
                                simulation_pars) {
  oceanic_simulations <- list()
  for (i in seq_along(ml)) {
    if (is.character(ml[[i]])) {
      oceanic_simulations[[i]] <- skip_failed_convergence()
    } else {
      oceanic_simulations[[i]] <- DAISIE::DAISIE_sim_constant_rate(
        time = simulation_pars$time,
        M = simulation_pars$M,
        pars = as.numeric(ml[[i]][1:5]),
        replicates = 1,
        plot_sims = FALSE,
        verbose = FALSE,
        sample_freq = Inf
      )
    }
  }
  return(oceanic_simulations)
}

#' Runs original oceanic DAISIE simulation
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return Output from \code{\link[DAISIE]{DAISIE_sim_constant_rate}}
#' @family simulation functions
#' @export
oceanic_sim <- function(ml,
                                sim_pars) {
  oceanic_sim <- list()
  for (i in seq_along(ml)) {
    if (is.character(ml[[i]])) {
      oceanic_sim[[i]] <- skip_failed_convergence()
    } else {
      oceanic_sim[[i]] <- DAISIE::DAISIE_sim_constant_rate(
        time = sim_pars$time,
        M = sim_pars$M,
        pars = as.numeric(ml[[i]][1:5]),
        replicates = 1,
        plot_sims = FALSE,
        verbose = FALSE,
        sample_freq = Inf
      )
    }
  }
  return(oceanic_sim)
}

#' Runs original oceanic DAISIE simulation
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @return Output from \code{\link[DAISIE]{DAISIE_sim_constant_rate}()}
#' @export
oceanic_sim <- function(ml,
                        sim_pars) {
  oceanic_sim <- list()
  for (i in seq_along(ml)) {
    if (is.character(ml[[i]])) {
      oceanic_sim[[i]] <- "ML didn't converge"
    } else {
      oceanic_sim[[i]] <- DAISIE::DAISIE_sim_constant_rate(
        time = sim_pars$time,
        M = sim_pars$M,
        pars = as.numeric(ml[[i]][1:5]),
        hyper_pars = DAISIE::create_hyper_pars(d = 0, x = 0),
        replicates = 1,
        plot_sims = FALSE,
        verbose = FALSE,
        sample_freq = Inf
      )
    }
  }
  return(oceanic_sim)
}

#' Runs original oceanic DAISIE simulation
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @return Output from \code{\link[DAISIE]{DAISIE_sim_constant_rate}()}
run_oceanic_sim <- function(ml,
                            sim_pars) {
  if ("trait_pars" %in% names(sim_pars)) {
    oceanic_sim <- DAISIE::DAISIE_sim_constant_rate(
      time = sim_pars$time,
      M = sim_pars$M + sim_pars$trait_pars$M2, # nolint
      pars = as.numeric(ml[1:5]),
      hyper_pars = DAISIE::create_hyper_pars(d = 0, x = 0),
      replicates = 1,
      plot_sims = FALSE,
      cond = 5,
      verbose = FALSE,
      sample_freq = Inf
    )
  } else {
    oceanic_sim <- DAISIE::DAISIE_sim_constant_rate(
      time = sim_pars$time,
      M = sim_pars$M,
      pars = as.numeric(ml[1:5]),
      hyper_pars = DAISIE::create_hyper_pars(d = 0, x = 0),
      replicates = 1,
      plot_sims = FALSE,
      cond = 5,
      verbose = FALSE,
      sample_freq = Inf
    )
  }
  return(oceanic_sim)
}

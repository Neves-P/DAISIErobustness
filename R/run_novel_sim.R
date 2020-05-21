#' Runs DAISIE simulation with a novel model
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @return A list output from \code{\link[DAISIE]{DAISIE_sim_constant_rate}()},
#' \code{\link[DAISIE]{DAISIE_sim_time_dependent}()},
#' \code{\link[DAISIE]{DAISIE_sim_constant_rate_shift}()}, or
#' \code{DAISIE_sim_trait_dependent()}.
#' @seealso \code{\link{run_analysis}()}.
run_novel_sim <- function(param_space_name,
                                sim_pars,
                                replicates) {
  novel_sim <- list()
  if (param_space_name == "nonoceanic") {
    for (i in seq_len(replicates)) {
      novel_sim[[i]] <- DAISIE::DAISIE_sim_constant_rate(
        time = sim_pars$time,
        M = sim_pars$M,
        pars = sim_pars$pars,
        replicates = 1,
        nonoceanic_pars = sim_pars$nonoceanic_pars,
        sample_freq  = Inf,
        plot_sims = FALSE,
        verbose = FALSE
      )
    }
  }
  if (param_space_name == "nonoceanic_land_bridge") {
    for (i in seq_len(replicates)) {
      novel_sim[[i]] <- DAISIE::DAISIE_sim_constant_rate_shift(
        time = sim_pars$time,
        M = sim_pars$M,
        pars = sim_pars$pars,
        replicates = 1,
        nonoceanic_pars = sim_pars$nonoceanic_pars,
        shift_times = sim_pars$shift_times,
        sample_freq  = Inf,
        plot_sims = FALSE,
        verbose = FALSE
      )
    }
  }
  if (param_space_name == "oceanic_ontogeny" ||
      param_space_name == "oceanic_sea_level" ||
      param_space_name == "oceanic_ontogeny_sea_level" ||
      param_space_name == "nonoceanic_sea_level") {
    for (i in seq_len(replicates)) {
      novel_sim[[i]] <- DAISIE::DAISIE_sim_time_dependent(
        time = sim_pars$time,
        M = sim_pars$M,
        pars = sim_pars$pars,
        replicates = 1,
        nonoceanic_pars = sim_pars$nonoceanic_pars,
        island_ontogeny = sim_pars$island_ontogeny,
        sea_level = sim_pars$sea_level,
        area_pars = sim_pars$area_pars,
        hyper_pars = sim_pars$hyper_pars,
        extcutoff = sim_pars$extcutoff,
        sample_freq = Inf,
        plot_sims = FALSE,
        verbose = FALSE
      )
    }
  }
  if (param_space_name == "trait") {
    for (i in seq_len(replicates)) {
      novel_sim[[i]] <- DAISIE::DAISIE_sim_trait_dependent(
        time = sim_pars$time,
        M = sim_pars$M,
        pars = sim_pars$pars,
        replicates = 1,
        sample_freq  = Inf,
        plot_sims = FALSE,
        verbose = FALSE,
        trait_pars = sim_pars$trait_pars
      )
    }
  }
  return(novel_sim)
}
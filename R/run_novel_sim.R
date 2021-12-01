#' Runs DAISIE simulation with a novel model
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @keywords internal
#' @return A list output from \code{\link[DAISIE]{DAISIE_sim_constant_rate}()},
#' \code{\link[DAISIE]{DAISIE_sim_time_dependent}()},
#' \code{\link[DAISIE]{DAISIE_sim_constant_rate_shift}()}, or
#' \code{\link[DAISIE]{DAISIE_sim_trait_dependent}()}.
run_novel_sim <- function(param_space_name,
                          sim_pars) {
  if (param_space_name %in% c("nonoceanic", "oceanic")) {
    novel_sim <- DAISIE::DAISIE_sim_cr(
      time = sim_pars$time,
      M = sim_pars$M,
      pars = sim_pars$pars,
      replicates = 1,
      divdepmodel = sim_pars$divdepmodel,
      nonoceanic_pars = sim_pars$nonoceanic_pars,
      sample_freq  = Inf,
      plot_sims = FALSE,
      cond = 5,
      verbose = FALSE
    )
  }
  if (param_space_name == "nonoceanic_land_bridge") {
    novel_sim <- DAISIE::DAISIE_sim_cr_shift(
      time = sim_pars$time,
      M = sim_pars$M,
      pars = sim_pars$pars,
      replicates = 1,
      divdepmodel = sim_pars$divdepmodel,
      nonoceanic_pars = sim_pars$nonoceanic_pars,
      shift_times = sim_pars$shift_times,
      sample_freq  = Inf,
      plot_sims = FALSE,
      cond = 5,
      verbose = FALSE
    )
  }
  if (param_space_name %in% c("oceanic_ontogeny",
                              "oceanic_sea_level",
                              "oceanic_ontogeny_sea_level")) {
    novel_sim <- DAISIE::DAISIE_sim_time_dependent(
      time = sim_pars$time,
      M = sim_pars$M,
      pars = sim_pars$pars,
      replicates = 1,
      divdepmodel = sim_pars$divdepmodel,
      nonoceanic_pars = sim_pars$nonoceanic_pars,
      island_ontogeny = sim_pars$island_ontogeny,
      sea_level = sim_pars$sea_level,
      area_pars = sim_pars$area_pars,
      hyper_pars = sim_pars$hyper_pars,
      extcutoff = sim_pars$extcutoff,
      sample_freq = Inf,
      plot_sims = FALSE,
      cond = 5,
      verbose = FALSE
    )

  }
  if (param_space_name %in% c("trait_CES", "trait_trans")) {
    novel_sim <- DAISIE::DAISIE_sim_trait_dependent(
      time = sim_pars$time,
      M = sim_pars$M,
      pars = sim_pars$pars,
      replicates = 1,
      sample_freq  = Inf,
      plot_sims = FALSE,
      cond = 5,
      verbose = FALSE,
      trait_pars = sim_pars$trait_pars
    )
  }
  return(novel_sim)
}

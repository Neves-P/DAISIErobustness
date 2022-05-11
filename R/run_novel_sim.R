#' Runs DAISIE simulation with a novel model
#'
#' @inheritParams default_params_doc
#' @author Joshua W. Lambert, Pedro Santos Neves, Shu Xie
#' @keywords internal
#' @return A list output from \code{\link[DAISIE]{DAISIE_sim_cr}()},
#' \code{\link[DAISIE]{DAISIE_sim_time_dep}()},
#' \code{\link[DAISIE]{DAISIE_sim_cr_shift}()}, or
#' \code{\link[DAISIE]{DAISIE_sim_trait_dep}()}.
run_novel_sim <- function(param_space_name,
                          sim_pars) {
  testit::assert(is_param_space_name(param_space_name))
  if (param_space_name %in% c("continental_cs",
                              "continental_di",
                              "continental_iw",
                              "oceanic")) {
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
  if (param_space_name %in% c("continental_land_bridge_cs",
                              "continental_land_bridge_di",
                              "continental_land_bridge_iw")) {
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
  if (param_space_name %in% c("oceanic_ontogeny_cs",
                              "oceanic_ontogeny_di",
                              "oceanic_ontogeny_iw",
                              "oceanic_sea_level_cs",
                              "oceanic_sea_level_di",
                              "oceanic_sea_level_iw",
                              "oceanic_ontogeny_sea_level_cs",
                              "oceanic_ontogeny_sea_level_di",
                              "oceanic_ontogeny_sea_level_iw")) {
    novel_sim <- DAISIE::DAISIE_sim_time_dep(
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
  if (param_space_name %in% c("trait_CES")) {
    novel_sim <- DAISIE::DAISIE_sim_trait_dep(
      time = sim_pars$time,
      M = sim_pars$M,
      divdepmodel = "CS",
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

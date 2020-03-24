#' Runs DAISIE simulation with geodynamics
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return A list output from \code{\link[DAISIE]{DAISIE_sim_constant_rate}},
#' \code{\link[DAISIE]{DAISIE_sim_time_dependent}}, or
#' \code{\link[DAISIE]{DAISIE_sim_constant_rate_shift}}
#' @family simulation functions
#' @export
geodynamic_simulations <- function(param_space_name,
                                   simulation_pars,
                                   replicates) {
  geodynamic_simulations <- list()
  if (param_space_name == "nonoceanic") {
    for (i in seq_len(replicates)) {
      geodynamic_simulations[[i]] <- DAISIE::DAISIE_sim_constant_rate(
        time = simulation_pars$time,
        M = simulation_pars$M,
        pars = simulation_pars$pars,
        replicates = 1,
        nonoceanic_pars = simulation_pars$nonoceanic_pars,
        sample_freq  = Inf,
        plot_sims = FALSE,
        verbose = FALSE
      )
    }
  }
  if (param_space_name == "nonoceanic_land_bridge") {
    for (i in seq_len(replicates)) {
      geodynamic_simulations[[i]] <- DAISIE::DAISIE_sim_constant_rate_shift(
        time = simulation_pars$time,
        M = simulation_pars$M,
        pars = simulation_pars$pars,
        replicates = 1,
        nonoceanic_pars = simulation_pars$nonoceanic_pars,
        shift_times = simulation_pars$shift_times,
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
      geodynamic_simulations[[i]] <- DAISIE::DAISIE_sim_time_dependent(
        time = simulation_pars$time,
        M = simulation_pars$M,
        pars = simulation_pars$pars,
        replicates = 1,
        nonoceanic_pars = simulation_pars$nonoceanic_pars,
        island_ontogeny = simulation_pars$island_ontogeny,
        sea_level = simulation_pars$sea_level,
        area_pars = simulation_pars$area_pars,
        ext_pars = simulation_pars$ext_pars,
        extcutoff = simulation_pars$extcutoff,
        sample_freq = Inf,
        plot_sims = FALSE,
        verbose = FALSE
      )
      }
    }
  return(geodynamic_simulations)
}

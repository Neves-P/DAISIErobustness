#' Extracts a set of parameters from the parameter space for the
#' simulation
#'
#' @inheritParams default_params_doc
#'
#' @return a list of simulation parameters
#' @export
extract_param_set <- function(param_space_name,
                              param_space,
                              param_set) {
  simulation_pars <- list()
  if (param_space_name == "nonoceanic") {
    simulation_pars$time <- param_space$time[param_set]
    simulation_pars$M <- param_space$M[param_set]
    simulation_pars$pars <- c(param_space$lac[param_set],
                              param_space$mu[param_set],
                              param_space$K[param_set],
                              param_space$gam[param_set],
                              param_space$laa[param_set])
    simulation_pars$nonoceanic_pars <- c(param_space$x_s[param_set],
                                         param_space$x_nonend[param_set])
  }
  if (param_space_name == "nonoceanic_land_bridge") {
    simulation_pars$time <- param_space$time[param_set]
    simulation_pars$M <- param_space$M[param_set]
    simulation_pars$pars <- c(param_space$lac_1[param_set],
                              param_space$mu_1[param_set],
                              param_space$K_1[param_set],
                              param_space$gam_1[param_set],
                              param_space$laa_1[param_set],
                              param_space$lac_2[param_set],
                              param_space$mu_2[param_set],
                              param_space$K_2[param_set],
                              param_space$gam_2[param_set],
                              param_space$laa_2[param_set]
    )
    simulation_pars$nonoceanic_pars <- c(param_space$x_s[param_set],
                                         param_space$x_nonend[param_set])

    simulation_pars$shift_times <-
      eval(str2expression(param_space$shift_times[param_set]))
  }
  if (param_space_name == "oceanic_ontogeny" ||
      param_space_name == "oceanic_sea_level" ||
      param_space_name == "oceanic_ontogeny_sea_level" ||
      param_space_name == "nonoceanic_sea_level") {

    simulation_pars$time <- param_space$time[param_set]
    simulation_pars$M <- param_space$M[param_set]
    simulation_pars$pars <- c(param_space$lac[param_set],
                              1,
                              param_space$K[param_set],
                              param_space$gam[param_set],
                              param_space$laa[param_set])
    simulation_pars$nonoceanic_pars <- c(param_space$x_s[param_set],
                                         param_space$x_nonend[param_set])
    simulation_pars$island_ontogeny <- param_space$island_ontogeny[param_set]
    simulation_pars$sea_level <- param_space$sea_level[param_set]
    simulation_pars$area_pars <- DAISIE::create_area_pars(
        max_area = param_space$max_area[param_set],
        proportional_peak_t = param_space$peak_time[param_set],
        peak_sharpness = param_space$sharpness[param_set],
        total_island_age = param_space$total_island_age[param_set],
        sea_level_amplitude = param_space$sea_level_amplitude[param_set],
        sea_level_frequency = param_space$sea_level_frequency[param_set],
        island_gradient_angle = param_space$island_gradient_angle[param_set]
      )
    simulation_pars$ext_pars <- c(param_space$mu_min[param_set],
                                  param_space$mu_p[param_set])
    simulation_pars$extcutoff <- param_space$extcutoff[param_set]
  }
  return(simulation_pars)
}

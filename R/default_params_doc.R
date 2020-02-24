#' Default parameter documentation
#'
#' @param param_space_name A string with the parameter space to run. Can
#' be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#' \code{"oceanic_ontogeny_sea_level"},
#' \code{"nonoceanic"}, \code{"nonoceanic_sea_level"}, or
#' \code{"nonoceanic_land_bridge"}.
#' @param param_set A numeric with the line corresponding to parameter set to
#' run, as found in the file named in \code{param_space}.
#' @param replicates A numeric for the number of replicates for the
#' simulations.
#' @param param_space tibble of the parameter space.
#' @param simulation_pars A list of simulation parameters.
#' @param simulations A list of simulation output from
#' \code{\link{DAISIE_sim_constant_rate}},
#' \code{\link{DAISIE_sim_time_dependent}} or
#' \code{\link{DAISIE_sim_constant_rate_shift}}
#' @param ml Output from \code{\link{DAISIE_ML_CS}}
#' @param simulations_1 A list of simulation output from
#' \code{\link{DAISIE_sim_constant_rate}},
#' \code{\link{DAISIE_sim_time_dependent}} or
#' \code{\link{DAISIE_sim_constant_rate_shift}}
#' @param simulations_2 A list of simulation output from
#' \code{\link{DAISIE_sim_constant_rate}},
#' \code{\link{DAISIE_sim_time_dependent}} or
#' \code{\link{DAISIE_sim_constant_rate_shift}}
#'
#' @return Nothing
#'
default_params_doc <- function(
  param_space_name,
  param_set,
  replicates,
  param_space,
  simulation_pars,
  simulations,
  ml,
  simulations_1,
  simulations_2
) {
  # Nothing
}


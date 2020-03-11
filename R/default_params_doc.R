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
#' @param totaltime_1 Numeric with time for which island 1 would be simulated.
#'   Usually this will correspond to a time that's smaller than the total
#'   island age.
#' @param totaltime_2 Time for which island 2 would be simulated. Usually this
#'   will correspond to a time that's smaller than the total island age.
#'   Defaults to \code{NULL}, in which case this island is not plotted.
#' @param area_pars_1 List of area and sea-level parameters for island 1 as
#'   created by \code{\link[DAISIE]{create_area_pars}}.
#' @param area_pars_2 List of area and sea-level parameters for island 1 as
#'   created by \code{\link[DAISIE]{create_area_pars}}. Defaults to \code{NULL},
#'   in which case the second area is not plotted.
#' @param island_ontogeny_1 A string describing the type of
#'   island ontogeny of island 1.
#'   Can be \code{"const"}, \code{"beta"} for a beta function describing area
#'   through time.
#' @param island_ontogeny_2 A string describing the type of
#'   island ontogeny of island 2.
#'   Can be \code{"const"}, \code{"beta"} for a beta function describing area
#'   through time. Defaults to \code{NULL}, in which case the second island is
#'   not plotted.
#' @param sea_level_1 A string describing the type of sea level for island 1.
#' Can be \code{"const"} or \code{"sine"} for a sine function describing area
#' through time.
#' @param sea_level_2 A string describing the type of sea level for island 2.
#'   Can be \code{"const"} or \code{"sine"} for a sine function describing area
#'   through time. Defaults to \code{NULL}, in which case the second island is
#'   not plotted.
#' @param resolution A float between 0 and 1 which controls the resolution of
#'   the island area calculated for plotting. Defaults to \code{0.001} and is
#'   bound at \code{0.00001} to prevent unwieldy slowdowns.
#' @param overlay_sea_level Logical, controling if sea level curves
#'   should be overlaid on top of corresponding ontogeny curves.
#' @param verbose logical determining whether to print
#'   simulation statements to the console.
#' @param path String with path where log files are located.
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
  simulations_2,
  totaltime_1,
  totaltime_2,
  area_pars_1,
  area_pars_2,
  island_ontogeny_1,
  island_ontogeny_2,
  sea_level_1,
  sea_level_2,
  resolution,
  overlay_sea_level,
  path
) {
  # Nothing
}

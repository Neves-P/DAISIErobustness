#' Default parameter documentation
#'
#' @param param_space_name A string with the parameter space to run. Can
#'  be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#'  \code{"oceanic_ontogeny_sea_level"},
#'  \code{"nonoceanic"}, \code{"nonoceanic_sea_level"}, or
#'  \code{"nonoceanic_land_bridge"}.
#' @param param_set A numeric with the line corresponding to parameter set to
#'  run, as found in the file named in \code{param_space}.
#' @param replicates A numeric for the number of replicates for the
#'  simulations
#' @param save_output A boolean to determine whether to save or return output.
#' @param output_file List. Contains all the pipeline output that was able to
#'  run up to a given point. Will be saved into .RData file by
#'  \code{\link{save_output}()} if the \code{\link{run_robustness}()} argument
#'  \code{save_output} is \code{TRUE}.
#' @param param_space tibble of the parameter space.
#' @param sim_pars A list of simulation parameters.
#' @param sim A list of simulation output from
#'  \code{\link{DAISIE_sim_constant_rate}()},
#'  \code{\link{DAISIE_sim_time_dependent}()} or
#'  \code{\link{DAISIE_sim_constant_rate_shift}()}
#' @param ml Output from \code{\link[DAISIE]{DAISIE_ML}()}
#' @param ml_res_initpars_1 Numeric data frame.
#'  Results from MLE run of geodynamics with the first set of initial
#'  parameters.
#' @param ml_res_initpars_2 Numeric data frame.
#'  Results from MLE run of geodynamics with the second set of initial
#'  parameters.
#' @param sim_constraints Boolean. \code{TRUE} if simulation constraints pass,
#'  \code{FALSE} otherwise.
#' @param ml_constraints Boolean. \code{TRUE} if MLE constraints pass,
#'  \code{FALSE} otherwise.
#' @param sim_1 A list of simulation output from
#'  \code{\link[DAISIE]{DAISIE_sim_constant_rate}()},
#'  \code{\link[DAISIE]{DAISIE_sim_time_dependent}()} or
#'  \code{\link[DAISIE]{DAISIE_sim_constant_rate_shift}()}
#' @param sim_2 A list of simulation output from
#'  \code{\link[DAISIE]{DAISIE_sim_constant_rate}},
#'  \code{\link[DAISIE]{DAISIE_sim_time_dependent}()} or
#'  \code{\link[DAISIE]{DAISIE_sim_constant_rate_shift}()}
#' @param spec_error A list with three elements each with a numeric
#'  vector.
#' @param endemic_error A list with one element with a numeric vector.
#' @param nonendemic_error A list with one element with a numeric vector.
#' @param spec_baseline_error A list with three elements each with
#'  a numeric vector.
#' @param endemic_baseline_error A list with one element with a numeric
#'  vector.
#' @param nonendemic_baseline_error A list with one element with a numeric
#'  vector.
#' @param initial_parameters A numeric vector of length 5 with the initial
#'  parameters for the MLE routine. The same as \code{initparsopt}
#'  from \code{\link[DAISIE]{DAISIE_ML}()}.
#'
#' @return Nothing
#'
default_params_doc <- function(
  param_space_name,
  param_set,
  replicates,
  save_output,
  output_file,
  param_space,
  sim_pars,
  sim,
  ml,
  ml_res_initpars_1,
  ml_res_initpars_2,
  sim_constraints,
  ml_constraints,
  initial_parameters,
  sim_1,
  sim_2,
  spec_error,
  endemic_error,
  nonendemic_error,
  spec_baseline_error,
  endemic_baseline_error,
  nonendemic_baseline_error
) {
  # Nothing
}

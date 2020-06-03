#' Default parameter documentation
#'
#' @param param_space_name A string with the parameter space to run. Can
#'  be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#'  \code{"oceanic_ontogeny_sea_level"},
#'  \code{"nonoceanic"}, \code{"nonoceanic_sea_level"}, or
#'  \code{"nonoceanic_land_bridge"}, \code{"trait"}.
#' @param param_set A numeric with the line corresponding to parameter set to
#'  run, as found in the file named in \code{param_space}.
#' @param replicates A numeric for the number of replicates for the
#'  simulations
#' @param replicate_range A numeric vector of length 2 or, by default,
#'  \code{NULL} if the entire range should be used. Specificies the range of
#'  previously saved replicates from \code{\link{run_novel_sim}()} that should
#'  be analysed by \code{\link{run_analysis}()}.
#' @param save_output A boolean to determine whether to save or return output.
#' @param output List. Contains all the pipeline output that was able to
#'  run up to a given point. Will be saved into .RData file by
#'  \code{\link{save_output}()} if the \code{\link{run_robustness}()} argument
#'  \code{save_output} is \code{TRUE}.
#' @param param_space tibble of the parameter space.
#' @param sim_pars A list of simulation parameters.
#' @param sim A list of simulation output from
#'  \code{\link[DAISIE]{DAISIE_sim_constant_rate}()},
#'  \code{\link[DAISIE]{DAISIE_sim_time_dependent}()},
#'  \code{\link[DAISIE]{DAISIE_sim_constant_rate_shift}()},
#'  \code{DAISIE_sim_trait_dependent()} or other input simulation
#'  in the DAISIE sim format.
#' @param novel_sim A list of simulation output in the DAISIE simulation format
#'  for which the robustness against standard oceanic DAISIE is to be
#'  determined.
#'  Can be generated from a preset of models available in
#'  \code{\link{run_novel_sim}()}, or loaded from a file, if in the correct
#'  format.
#' @param ml Output from \code{\link[DAISIE]{DAISIE_ML}()}.
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
#'  \code{\link[DAISIE]{DAISIE_sim_time_dependent}()},
#'  \code{\link[DAISIE]{DAISIE_sim_constant_rate_shift}()}, or
#'  \code{DAISIE_sim_trait_dependent()}.
#' @param sim_2 A list of simulation output from
#'  \code{\link[DAISIE]{DAISIE_sim_constant_rate}()},
#'  \code{\link[DAISIE]{DAISIE_sim_time_dependent}()} or
#'  \code{\link[DAISIE]{DAISIE_sim_constant_rate_shift}()}, or
#'  \code{DAISIE_sim_trait_dependent()}.
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
#' @param pipeline A string stating what sections of the pipeline should
#'  run. Default is \code{"full"}, meaning the entire pipeline, including the
#'  novel model and analysis will run. \code{"novel_sim"} Indicates only the
#'  novel simulation section should run, calling \code{\link{run_novel_sim}()}.
#'  \code{"analysis"} runs just the estimation, oceanic simulations and error
#'  calculation sections of the pipeline calling \code{\link{run_analysis}()}.
#' @param load_from_file A boolean for the \code{\link{run_analysis}()} part of
#'  the pipeline. If \code{TRUE}, \code{\link{run_novel_sim}()} output is
#'  loaded from a file, otherwise, the object is retrieved from scope.
#' @param distance_method From the nLTT package.
#'  How the difference between the two nLTTs is summed:
#'  \itemize{
#'   \item{"abs: "}{the absolute distance between the two nLTTs is summed}
#'   \item{"squ: "}{the squared distance between the two nLTTs is summed}
#'  }
#' @param vec_1 A numeric vector. Usually a distribution of nLTT statistics
#'  or similar vectors as obtained within
#'  \code{\link{calc_error_metrics}()}. Distance is calculated with
#'  \code{vec_2}.
#' @param vec_2 A numeric vector. Usually a distribution of nLTT statistics
#'  or similar vectors as obtained within
#'  \code{\link{calc_error_metrics}()}. Distance is calculated with
#'  \code{vec_1}.
#'
#' @return Nothing
#' @author Joshua Lambert, Pedro Neves, Shu Xie
default_params_doc <- function(
  param_space_name,
  param_set,
  replicates,
  replicate_range,
  save_output,
  output,
  param_space,
  sim_pars,
  sim,
  novel_sim,
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
  nonendemic_baseline_error,
  pipeline,
  load_from_file,
  distance_method,
  vec_1,
  vec_2
) {
  # Nothing
}

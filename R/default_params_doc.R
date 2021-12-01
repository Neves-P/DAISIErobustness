#' Default parameter documentation
#'
#' @param param_space_name A string with the parameter space to run. Can
#'  be \code{"oceanic_ontogeny"}, \code{"oceanic_sea_level"},
#'  \code{"oceanic_ontogeny_sea_level"},
#'  \code{"nonoceanic"}, \code{"nonoceanic_land_bridge"},
#'  \code{"trait_CES"}, \code{"trait_trans"}, or \code{"oceanic"}.
#'  \code{"oceanic"} is used as a null simulation to test for bias in the
#'  pipeline.
#' @param param_set A numeric with the line corresponding to parameter set to
#'  run, as found in the file named in \code{param_space}.
#' @param replicates A numeric for the number of replicates for the
#'  simulations
#' @param save_output A boolean to determine whether to save or return output.
#' @param output List. Contains all the pipeline output that was able to
#'  run up to a given point. Will be saved into .RData file by
#'  \code{\link{save_output}()} if the \code{\link{run_robustness}()} argument
#'  \code{save_output} is \code{TRUE}.
#' @param param_space A data frame of the parameter space.
#' @param sim_pars A list of simulation parameters.
#' @param sim A list of simulation output from
#'  \code{\link[DAISIE]{DAISIE_sim_cr}()},
#'  \code{\link[DAISIE]{DAISIE_sim_time_dep}()},
#'  \code{\link[DAISIE]{DAISIE_sim_cr_shift}()},
#'  \code{\link[DAISIE]{DAISIE_sim_trait_dep}()} or other input simulation
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
#' @param ml_constraints Boolean. \code{TRUE} if MLE constraints pass,
#'  \code{FALSE} otherwise.
#' @param sim_1 A list of simulation output from
#'  \code{\link[DAISIE]{DAISIE_sim_cr}()},
#'  \code{\link[DAISIE]{DAISIE_sim_time_dep}()},
#'  \code{\link[DAISIE]{DAISIE_sim_cr_shift}()}, or
#'  \code{\link[DAISIE]{DAISIE_sim_trait_dep}()}.
#' @param sim_2 A list of simulation output from
#'  \code{\link[DAISIE]{DAISIE_sim_cr}()},
#'  \code{\link[DAISIE]{DAISIE_sim_time_dep}()} or
#'  \code{\link[DAISIE]{DAISIE_sim_cr_shift}()}, or
#'  \code{\link[DAISIE]{DAISIE_sim_trait_dep}()}.
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
#' @param distance_method From the nLTT package.
#'  How the difference between the two nLTTs is summed:
#'  \itemize{
#'   \item{\code{"abs"}: }{the absolute distance between the two nLTTs is
#'     summed}
#'   \item{\code{"squ"}: }{the squared distance between the two nLTTs is summed}
#'  }
#' @param spec_nltt_error Numeric vector with the nltt error from the novel
#'   simulation and the oceanic DAISIE simulation.
#' @param num_spec_error Numeric vector with the difference in the number
#'   of species at the end of the simulation between the novel simulation and
#'   the oceanic DAISIE simulation.
#' @param num_col_error Numeric vector with the difference in the number of
#'  colonists at the end of the simulation between the novel simulation and the
#'   oceanic DAISIE simulation.
#' @param endemic_nltt_error Numeric vector with the nltt error of the
#'   endemic species from the novel simulation and the oceanic DAISIE
#'   simulation.
#' @param nonendemic_nltt_error Numeric vector with the nltt error of the
#'   non-endemic species from the novel simulation and the oceanic DAISIE
#'   simulation.
#' @param spec_baseline_nltt_error Numeric vector with the baseline nltt error
#'   between oceanic DAISIE simulations.
#' @param num_spec_baseline_error Numeric vector with the difference in the
#'   number of species at the end of the simulation between the oceanic DAISIE
#'   simulations.
#' @param num_col_baseline_error Numeric vector with the difference in the
#'   number of colonists at the end of the simulation between the oceanic DAISIE
#'   simulations.
#' @param endemic_baseline_nltt_error Numeric vector with the nltt error of the
#'   endemic species from the oceanic DAISIE simulations.
#' @param nonendemic_baseline_nltt_error Numeric vector with the nltt error of
#'   the non-endemic species from the oceanic DAISIE simulations.
#' @param folder_path A file path (use \code{file.path()} for formatting
#'   convenience) where all the parameter sets results of a given parameter
#'   space are stored in .RData format.
#' @param param_set_range Defaults to \code{NULL}, which computes the ED95
#'   statistic for all parameter sets in the file of the parameter space located
#'   in \code{folder_path}. Otherwise, a numeric vector of length 2, where the
#'   first element must be lower than the second. This specifies the range of
#'   parameter sets to load compute ED95 for, i.e \code{c(1, 20)} will attempt
#'   to compute and load parameter sets 1 to 20. If there are gaps in this
#'   range, the function works regardless, and will return ED95 for the
#'   parameter set results within the 1 to 20 range.
#' @param test A boolean, defaults to `FALSE`. Set to `TRUE` for testing
#'   purposes, to fix the seed.
#' @param log_file_path A string with the path for a standard Peregrine HPCC log
#'   file.
#' @param logs_folder_path A string with the path for a directory containing the
#'   Peregrine HPCC log files.
#' @param runtime_params A data frame with runtime of each parameter set in each
#'   parameter space as returned by \code{\link{get_runtime_params}()}.
#' @param ed95_param_sets A data frame with all ED95 statistics of each
#'   parameter set in each parameter space as returned by
#'   \code{\link{calc_ed95_param_set}()}.
#' @param param_space_data_frame A data frame with ED95 statistics all
#'   parameter spaces, together with associated runtime. Used for plotting
#'   correlation between runtime and ED95. Obtained by running
#'   \code{\link{calc_ed95_param_set}()}.
#'
#' @keywords internal
#' @return Nothing
#' @author Joshua Lambert, Pedro Neves, Shu Xie
default_params_doc <- function(
  param_space_name,
  param_set,
  replicates,
  save_output,
  output,
  param_space,
  sim_pars,
  sim,
  novel_sim,
  ml,
  ml_res_initpars_1,
  ml_res_initpars_2,
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
  distance_method,
  spec_nltt_error,
  num_spec_error,
  num_col_error,
  endemic_nltt_error,
  nonendemic_nltt_error,
  spec_baseline_nltt_error,
  num_spec_baseline_error,
  num_col_baseline_error,
  endemic_baseline_nltt_error,
  nonendemic_baseline_nltt_error,
  folder_path,
  param_set_range,
  test,
  log_file_path,
  logs_folder_path,
  runtime_params,
  ed95_param_sets,
  param_space_data_frame
) {
  # Nothing
}

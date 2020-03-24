#' Run robustness analysis pipeline
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return A list of errors and simulation and MLE output if
#' \code{\link{simulation_constraints}} returned TRUE or simulation
#' output if \code{\link{simulation_constraints}} returned FALSE.
#' @export
run_robustness <- function(param_space_name,
                           param_set,
                           replicates = 1000) {

  param_space <- load_param_space(
    param_space_name = param_space_name)

  testit::assert(
    param_space_name == "oceanic_ontogeny" ||
      param_space_name == "oceanic_sea_level" ||
      param_space_name == "oceanic_ontogeny_sea_level" ||
      param_space_name == "nonoceanic" ||
      param_space_name == "nonoceanic_sea_level" ||
      param_space_name == "nonoceanic_land_bridge")
  testit::assert(param_set >= 1)
  testit::assert(param_set <= nrow(param_space))
  testit::assert(replicates > 1)

  set.seed(1)

  simulation_pars <- extract_param_set(
    param_space_name = param_space_name,
    param_space = param_space,
    param_set = param_set)

  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = param_space_name,
    simulation_pars = simulation_pars,
    replicates = replicates)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = replicates)

  if (simulation_constraints == TRUE) {
    geodynamic_ml <- calc_ml(
      simulations = geodynamic_simulations)

    oceanic_simulations_1 <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars)

    error <- calc_error(
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations_1,
      replicates = replicates)

    spec_error <- error$spec_error
    endemic_error <- error$endemic_error
    nonendemic_error <- error$nonendemic_error

    oceanic_ml <- calc_ml(
      simulations = oceanic_simulations_1)
    oceanic_simulations_2 <- oceanic_simulations(
      ml = oceanic_ml,
      simulation_pars = simulation_pars)

    baseline_error <- calc_error(
      simulations_1 = oceanic_simulations_1,
      simulations_2 = oceanic_simulations_2,
      replicates = replicates)

    spec_baseline_error <- baseline_error$spec_error
    endemic_baseline_error <- baseline_error$endemic_error
    nonendemic_baseline_error <- baseline_error$nonendemic_error

    error_metrics <- calc_error_metrics(
      spec_error = spec_error,
      endemic_error = endemic_error,
      nonendemic_error = nonendemic_error,
      spec_baseline_error = spec_baseline_error,
      endemic_baseline_error = endemic_baseline_error,
      nonendemic_baseline_error = nonendemic_baseline_error)

    output_file <- list(
      spec_error = spec_error,
      endemic_error = endemic_error,
      nonendemic_error = nonendemic_error,
      spec_baseline_error = spec_baseline_error,
      endemic_baseline_error = endemic_baseline_error,
      nonendemic_baseline_error = nonendemic_baseline_error,
      error_metrics = error_metrics,
      geodynamic_simulations = geodynamic_simulations,
      geodynamic_ml = geodynamic_ml,
      oceanic_simulations_1 = oceanic_simulations_1,
      oceanic_ml = oceanic_ml,
      oceanic_simulations_2 = oceanic_simulations_2)

    output_file_name <- paste0(
      "passed_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata")

  } else {

    output_file <- list(
      geodynamic_simulations = geodynamic_simulations)

    output_file_name <- paste0(
      "failed_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata")
  }
  output_path <- file.path("results", param_space_name, output_file_name)
  cat(
    "\n Trying to save",
    output_file_name,
    "to",
    output_path,
    "... \n"
  )
  save(
    output_file,
    file = output_path
  )
  cat(
    "\n Saved",
    output_file_name,
    "to",
    file.path(param_space_name, output_file_name),
    "... \n"
  )
}

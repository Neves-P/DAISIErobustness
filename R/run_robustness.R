#' Run robustness analysis pipeline
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @export
run_robustness <- function(param_space_name,
                           param_set,
                           replicates = 1000,
                           verbose = TRUE) {

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
    replicates = replicates,
    verbose = verbose)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = replicates)

  if (simulation_constraints == TRUE) {
    geodynamic_ml <- calc_ml(
      param_space_name = param_space_name,
      simulation_pars = simulation_pars,
      simulations = geodynamic_simulations)

    oceanic_simulations_1 <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = verbose)

    error <- calc_error(
      simulation_pars = simulation_pars,
      ml = geodynamic_ml,
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations_1,
      replicates = replicates)

    species_error <- error$species_error
    endemic_error <- error$endemic_error
    nonendemic_error <- error$nonendemic_error

    oceanic_ml <- calc_ml(
      param_space_name = "oceanic",
      simulation_pars = simulation_pars,
      simulations = oceanic_simulations_1)

    oceanic_simulations_2 <- oceanic_simulations(
      ml = oceanic_ml,
      simulation_pars = simulation_pars,
      verbose = verbose)

    baseline_error <- calc_error(
      simulation_pars = simulation_pars,
      ml = oceanic_ml,
      simulations_1 = oceanic_simulations_1,
      simulations_2 = oceanic_simulations_2,
      replicates = replicates)

    species_baseline_error <- baseline_error$species_error
    endemic_baseline_error <- baseline_error$endemic_error
    nonendemic_baseline_error <- baseline_error$nonendemic_error

    output_file <- list(
      species_error = species_error,
      endemic_error = endemic_error,
      nonendemic_error = nonendemic_error,
      species_baseline_error = species_baseline_error,
      endemic_baseline_error = endemic_baseline_error,
      nonendemic_baseline_error = nonendemic_baseline_error,
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

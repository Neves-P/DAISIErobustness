#' Run robustness analysis pipeline
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return A list of errors and simulation and MLE output if
#' \code{\link{sim_constraints}} returned TRUE or simulation
#' output if \code{\link{sim_constraints}()} returned FALSE.
#' @export
run_robustness <- function(param_space_name,
                           param_set,
                           replicates,
                           save_output = TRUE) {

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

  sim_pars <- extract_param_set(
    param_space_name = param_space_name,
    param_space = param_space,
    param_set = param_set)

  geodynamic_sim <- geodynamic_sim(
    param_space_name = param_space_name,
    sim_pars = sim_pars,
    replicates = replicates)

  sim_constraints <- sim_constraints(
    sim = geodynamic_sim,
    replicates = replicates)

  if (sim_constraints == TRUE) {
    geodynamic_ml <- calc_ml(
      sim = geodynamic_sim)

    oceanic_sim_1 <- oceanic_sim(
      ml = geodynamic_ml,
      sim_pars = sim_pars)

    error <- calc_error(
      sim_1 = geodynamic_sim,
      sim_2 = oceanic_sim_1,
      replicates = replicates)

    spec_error <- error$spec_error
    endemic_error <- error$endemic_error
    nonendemic_error <- error$nonendemic_error

    oceanic_ml <- calc_ml(
      sim = oceanic_sim_1)

    ml_constraints <- ml_constraints(
      ml = oceanic_ml)

    if (ml_constraints == TRUE) {
      oceanic_sim_2 <- oceanic_sim(
        ml = oceanic_ml,
        sim_pars = sim_pars)

      baseline_error <- calc_error(
        sim_1 = oceanic_sim_1,
        sim_2 = oceanic_sim_2,
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
        geodynamic_sim = geodynamic_sim,
        geodynamic_ml = geodynamic_ml,
        oceanic_sim_1 = oceanic_sim_1,
        oceanic_ml = oceanic_ml,
        oceanic_sim_2 = oceanic_sim_2)

      output_file_name <- paste0(
        "passed_cond_",
        param_space_name,
        "_param_set_",
        param_set,
        ".Rdata")
    }
  }

  if (sim_constraints == FALSE) {
    output_file <- list(
      geodynamic_sim = geodynamic_sim)

    output_file_name <- paste0(
      "failed_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata")

  } else if (ml_constraints == FALSE) {
    output_file <- list(
      geodynamic_sim = geodynamic_sim,
      geodynamic_ml = geodynamic_ml,
      oceanic_sim_1 = oceanic_sim_1,
      oceanic_ml = oceanic_ml)

    output_file_name <- paste0(
      "failed_cond_",
      param_space_name,
      "_param_set_",
      param_set,
      ".Rdata")

  }

  if (save_output == TRUE) {
    output_path <- file.path("results", param_space_name, output_file_name)

    message(paste0("Trying to save ", output_file_name, " to ", output_path))

    save(output_file, file = output_path)

    message(
      paste0(
        "Saved ",
        output_file_name,
        " to ",
        file.path(param_space_name, output_file_name)
      )
    )
  } else {
    return(output_file)
  }
}

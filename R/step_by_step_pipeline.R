#' Run geodynamics portion of the analysis pipeline
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return A list with \code{\link{geodynamic_sim}()} and
#'  \code{\link{sim_constraints}()} output.
#' @seealso \code{\link{run_robustness}()}
#' @author Joshua Lambert, Pedro Neves
#' @export
run_geodynamic_section <- function(param_space_name,
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
      param_space_name == "nonoceanic_land_bridge"
  )
  testit::assert(param_set >= 1)
  testit::assert(param_set <= nrow(param_space))
  testit::assert(replicates > 1)

  check_create_results_folder(
    param_space_name = param_space_name,
    save_output = save_output
  )

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
  output_file <- list(
    geodynamic_sim = geodynamic_sim,
    sim_constraints = sim_constraints
  )

  if (save_output) {
    save_output(output_file = output_file,
                param_space_name = param_space_name,
                param_set = param_set,
                sim_constraints = sim_constraints,
                ml_constraints = NA,
                full_pipeline = FALSE)
  } else {
    return(output_file)
  }
}

#' Run oceanic portion of the analysis pipeline
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves
#' @return A list with \code{\link{geodynamic_sim}()} and
#'  \code{\link{sim_constraints}()} output.
#' @seealso \code{\link{run_robustness}()}
#' @author Joshua Lambert, Pedro Neves
#' @export
run_oceanic_section <- function(param_space_name,
                                param_set,
                                replicates,
                                replicate_range,
                                save_output = TRUE) {
  n_replicates_to_run <- replicate_range[2] - replicate_range[1]
  param_space <- load_param_space(
    param_space_name = param_space_name)

  sim_pars <- extract_param_set(
    param_space_name = param_space_name,
    param_space = param_space,
    param_set = param_set)

  check_create_results_folder(
    param_space_name = param_space_name,
    save_output = save_output
  )

  geodynamic_section_output <- load_geodynamic_section(
    param_space_name = param_space_name,
    param_set = param_set
  )

  sim_constraints <- geodynamic_section_output$sim_constraints
  geodynamic_sim <- geodynamic_section_output$geodynamic_sim
  # Subset replicates
  geodynamic_sim <- geodynamic_sim[replicate_range[1]:replicate_range[2]]


  if (sim_constraints == TRUE) {
    initial_parameters_1 <- c(0.05, 0.05, 20, 0.0001, 0.05)
    initial_parameters_2 <- c(0.9, 1.5, 40, 0.01, 2)

    initial_parameters_1_list <- vector("list", length = n_replicates_to_run)
    initial_parameters_2_list <- vector("list", length = n_replicates_to_run)

    for (i in replicate_range[1]:replicate_range[2]) {
      initial_parameters_1_list[[i]] <- initial_parameters_1
      initial_parameters_2_list[[i]] <- initial_parameters_2
    }

    geodynamic_ml_1 <- calc_ml(
      sim = geodynamic_sim,
      initial_parameters = initial_parameters_1_list
    )

    geodynamic_ml_2 <- calc_ml(
      sim = geodynamic_sim,
      initial_parameters = initial_parameters_2_list
    )

    geodynamic_ml_constraints_1 <- ml_constraints(
      ml = geodynamic_ml_1)

    geodynamic_ml_constraints_2 <- ml_constraints(
      ml = geodynamic_ml_2)

    if (geodynamic_ml_constraints_1 == TRUE &&
        geodynamic_ml_constraints_2 == TRUE) {
      best_pars_tolerance <- decide_best_pars(
        ml_res_initpars_1 = geodynamic_ml_1,
        ml_res_initpars_2 = geodynamic_ml_2
      )

      geodynamic_ml <- lapply(best_pars_tolerance, `[[`, 1) # rearrange
      geodynamic_ml_qc <- list(
        loglik_tolerance_check = best_pars_tolerance$loglik_tolerance_check,
        absolute_loglik_difference =
          best_pars_tolerance$absolute_loglik_difference,
        pars_tolerance_check = best_pars_tolerance$pars_tolerance_check,
        absolute_pars_difference = best_pars_tolerance$absolute_pars_difference
      )


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
        sim = oceanic_sim_1,
        initial_parameters = geodynamic_ml)

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
          oceanic_sim_2 = oceanic_sim_2,
          geodynamic_ml_qc = geodynamic_ml_qc,
          replicate_range = replicate_range
        )

      }

    }
  }
  if (sim_constraints == FALSE) {
    output_file <- list(
      geodynamic_sim = geodynamic_sim
    )
    ml_constraints <- FALSE
  } else if (geodynamic_ml_constraints_1 == FALSE ||
             geodynamic_ml_constraints_2 == FALSE) {
    output_file <- list(
      geodynamic_sim = geodynamic_sim,
      geodynamic_ml_1 = geodynamic_ml_1,
      geodynamic_ml_2 = geodynamic_ml_2,
      replicate_range = replicate_range
    )

  } else if (ml_constraints == FALSE) {
    output_file <- list(
      geodynamic_sim = geodynamic_sim,
      geodynamic_ml = geodynamic_ml,
      oceanic_sim_1 = oceanic_sim_1,
      oceanic_ml = oceanic_ml,
      replicate_range = replicate_range)
  }

  if (save_output == TRUE) {
    save_output(
      output_file = output_file,
      param_space_name = param_space_name,
      param_set = param_set,
      sim_constraints = sim_constraints,
      ml_constraints = ml_constraints,
      replicate_range = replicate_range
    )

  } else {
    return(output_file)
  }
}

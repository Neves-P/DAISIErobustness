#' Run the analysis with ocenanic sims and MLs
#'
#' @inheritParams default_params_doc
#'
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @seealso \code{\link{run_novel_sim}()}, \code{\link{run_robustness}()}.
run_analysis <- function(novel_sim,
                         param_space_name,
                         replicates,
                         replicate_range = NULL,
                         sim_pars,
                         distance_method) {
  testit::assert(is.character(param_space_name))
  testit::assert(
    "novel_sim must be in the DAISIE simulation output format",
    is_novel_sim_outputs(novel_sim)
  )
  testit::assert(
    "replicate_range must be a numeric with 2 sorted elements or NULL",
    is.null(replicate_range) ||
      is.numeric(replicate_range) && (replicate_range[1] < replicate_range[2])
  )

  sim_constraints <- sim_constraints(
    sim = novel_sim,
    replicates = replicates
  )
  output <- list(sim_constraints = sim_constraints)

  if (sim_constraints == TRUE) {

    if (!is.null(replicate_range)) {
      novel_sim <- novel_sim[replicate_range[1]:replicate_range[2]]
    }
    # TODO K -> max(data + 1, 20)
    initial_parameters_1 <- c(0.05, 0.05, 20, 0.0001, 0.05)
    initial_parameters_2 <- c(0.9, 1.5, 40, 0.01, 2)

    initial_parameters_1_list <- vector("list", length = length(novel_sim))
    initial_parameters_2_list <- vector("list", length = length(novel_sim))

    for (i in seq_along(novel_sim)) {
      initial_parameters_1_list[[i]] <- initial_parameters_1
      initial_parameters_2_list[[i]] <- initial_parameters_2
    }

    novel_ml_1 <- calc_ml(
      sim = novel_sim,
      initial_parameters = initial_parameters_1_list
    )

    novel_ml_2 <- calc_ml(
      sim = novel_sim,
      initial_parameters = initial_parameters_2_list
    )

    novel_ml_constraints_1 <- ml_constraints(
      ml = novel_ml_1)

    novel_ml_constraints_2 <- ml_constraints(
      ml = novel_ml_2)

    output <- list(
      novel_ml_1 = novel_ml_1,
      novel_ml_2 = novel_ml_2,
      sim_constraints = sim_constraints
    )
    if (novel_ml_constraints_1 == TRUE &&
        novel_ml_constraints_2 == TRUE) {
      # TODO: save also ml_pars onto output
      best_pars <- decide_best_pars(
        ml_res_initpars_1 = novel_ml_1,
        ml_res_initpars_2 = novel_ml_2
      )

      novel_ml <- lapply(best_pars, `[[`, 1) # rearrange
      absolute_loglik_difference <- lapply(best_pars, `[[`, 2) # rearrange
      absolute_pars_difference <- lapply(best_pars, `[[`, 3) # rearrange
      novel_ml_qc <- list(
        absolute_loglik_difference = absolute_loglik_difference,
        absolute_pars_difference = absolute_pars_difference
      )

      if (param_space_name == "trait") {
        sim_pars$M <- sim_pars$M + sim_pars$trait_pars$M2 # nolint
      }

      oceanic_sim_1 <- oceanic_sim(
        ml = novel_ml,
        sim_pars = sim_pars)

      error <- calc_error(
        sim_1 = novel_sim,
        sim_2 = oceanic_sim_1,
        replicates = replicates,
        distance_method = distance_method)

      spec_error <- error$spec_error
      endemic_error <- error$endemic_error
      nonendemic_error <- error$nonendemic_error

      oceanic_ml <- calc_ml(
        sim = oceanic_sim_1,
        initial_parameters = novel_ml)

      ml_constraints <- ml_constraints(
        ml = oceanic_ml)

      output <- list(
        spec_error = spec_error,
        endemic_error = endemic_error,
        nonendemic_error = nonendemic_error,
        novel_ml = novel_ml,
        oceanic_sim_1 = oceanic_sim_1,
        oceanic_ml = oceanic_ml,
        novel_ml_qc = novel_ml_qc,
        ml_constraints = ml_constraints,
        sim_constraints = sim_constraints
      )
      if (ml_constraints == TRUE) {
        oceanic_sim_2 <- oceanic_sim(
          ml = oceanic_ml,
          sim_pars = sim_pars)

        baseline_error <- calc_error(
          sim_1 = oceanic_sim_1,
          sim_2 = oceanic_sim_2,
          replicates = replicates,
          distance_method = distance_method)

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

        output <- list(
          spec_error = spec_error,
          endemic_error = endemic_error,
          nonendemic_error = nonendemic_error,
          spec_baseline_error = spec_baseline_error,
          endemic_baseline_error = endemic_baseline_error,
          nonendemic_baseline_error = nonendemic_baseline_error,
          error_metrics = error_metrics,
          novel_ml = novel_ml,
          oceanic_sim_1 = oceanic_sim_1,
          oceanic_ml = oceanic_ml,
          oceanic_sim_2 = oceanic_sim_2,
          novel_ml_qc = novel_ml_qc,
          ml_constraints = ml_constraints,
          sim_constraints = sim_constraints
        )
      }
    }
  }
  return(output)
}


#' Measures if the input is a valid collection of simulation
#' outputs.
#'
#' @details Adapted from \code{\link[DAISIE]{is_simulation_outputs}()}
#' @inheritParams default_params_doc
#'
#' @return TRUE if the input is a valid collection of simulation
#' outputs.
#' @author Richel J.C Bilderbeek, Pedro Neves
is_novel_sim_outputs <- function(novel_sim) {
  for (n_replicate in seq_along(novel_sim)) {
    if (!"island_age" %in% names(novel_sim[[n_replicate]][[1]][[1]]))
      return(FALSE)
    if (!("not_present" %in% names(novel_sim[[n_replicate]][[1]][[1]]) ||
          "not_present_type1" %in%
          names(novel_sim[[n_replicate]][[1]][[1]]))) {
      return(FALSE)
    }
    if (!"stt_all" %in% names(novel_sim[[n_replicate]][[1]][[1]]))
      return(FALSE)
    # TODO: Figure out how to test this?
    # if (!"branching_times" %in% names(simulation_outputs)) return(FALSE) # nolint
    # if (!"stac" %in% names(simulation_outputs)) return(FALSE) # nolint
    # if (!"missing_species" %in% names(simulation_outputs)) return(FALSE) # nolint
  }
  if (is.list(novel_sim) && length(novel_sim) >= 1) {
    return(TRUE)
  }
}

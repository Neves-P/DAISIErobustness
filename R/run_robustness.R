#' Run robustness analysis pipeline
#'
#' @inheritParams default_params_doc
#' @author Joshua Lambert, Pedro Neves, Shu Xie
#' @return A list of errors and simulation and MLE output.
#' @export
run_robustness <- function(param_space_name,
                           param_set,
                           replicates,
                           distance_method = "abs",
                           save_output = TRUE,
                           test = FALSE) {

  testit::assert(is.character(param_space_name))
  testit::assert(param_space_name %in% c("oceanic_ontogeny",
                                         "oceanic_sea_level",
                                         "oceanic_ontogeny_sea_level",
                                         "nonoceanic",
                                         "nonoceanic_land_bridge",
                                         "trait_CES",
                                         "trait_trans"))
  param_space <- load_param_space(
    param_space_name = param_space_name)
  testit::assert(param_set >= 1)
  testit::assert(param_set <= nrow(param_space))
  testit::assert(replicates > 1)
  testit::assert(
    "replicates must be a positive integer greater or equal to 2",
    is.finite(replicates) && replicates >= 2
  )
  testit::assert("distance_method must be either 'abs' or 'squ'",
                 distance_method == "abs" || distance_method == "squ")

  check_create_folders(
    param_space_name = param_space_name,
    save_output = save_output
  )

  if (test) {
    seed <- 1
  } else {
    seed <- as.integer(Sys.time()) %% 1000000L * param_set
  }

  print(sessioninfo::session_info(pkgs = "DAISIErobustness"))
  message(Sys.time())
  message("Param space name: ", param_space_name)
  message("Running param set: ", param_set)
  message("Running analysis with seed: ", seed)
  message("CAUTION: Do not submit jobs simultaneously in order for jobs to have
          different seeds.")

  set.seed(
    seed,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )

  sim_pars <- extract_param_set(
    param_space_name = param_space_name,
    param_space = param_space,
    param_set = param_set)

  passed_novel_mls <- list()
  failed_novel_mls <- list()
  passed_novel_sims <- list()
  failed_novel_sims <- list()
  passed_oceanic_mls <- list()
  failed_oceanic_mls <- list()
  passed_oceanic_sims_1 <- list()
  passed_oceanic_sims_2 <- list()
  failed_oceanic_sims <- list()
  spec_nltt_error <- c()
  num_spec_error <- c()
  num_col_error <- c()
  endemic_nltt_error <- c()
  nonendemic_nltt_error <- c()
  spec_baseline_nltt_error <- c()
  num_spec_baseline_error <- c()
  num_col_baseline_error <- c()
  endemic_baseline_nltt_error <- c()
  nonendemic_baseline_nltt_error <- c()

  while (length(passed_novel_mls) < replicates) {
    novel_sim <- run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars
    )
    testit::assert(
      "novel_sim must be in the DAISIE simulation output format",
      is_novel_sim_outputs(novel_sim)
    )
    k_approx <- calc_max_spec(novel_sim) + 1

    novel_ml <- calc_ml(
      sim = novel_sim,
      initial_parameters = c(0.05, 0.05, k_approx, 0.0001, 0.05)
    )

    novel_ml_constraints <- ml_constraints(ml = novel_ml)

    if (novel_ml_constraints == TRUE) {

      oceanic_sim_1 <- run_oceanic_sim(
        ml = novel_ml,
        sim_pars = sim_pars)

      error <- calc_error(
        sim_1 = novel_sim,
        sim_2 = oceanic_sim_1,
        replicates = replicates,
        distance_method = distance_method)

      oceanic_ml <- calc_ml(
        sim = oceanic_sim_1,
        initial_parameters = novel_ml
      )

      oceanic_ml_constraints <- ml_constraints(
        ml = oceanic_ml
      )

      if (oceanic_ml_constraints == TRUE) {
        passed_novel_mls[[length(passed_novel_mls) + 1]] <- novel_ml
        passed_novel_sims[[length(passed_novel_sims) + 1]] <- novel_sim

        passed_oceanic_mls[[length(passed_oceanic_mls) + 1]] <- oceanic_ml
        l_passed_oceanic_sims_1 <- length(passed_oceanic_sims_1)
        passed_oceanic_sims_1[[l_passed_oceanic_sims_1 + 1]] <- oceanic_sim_1

        oceanic_sim_2 <- run_oceanic_sim(
          ml = oceanic_ml,
          sim_pars = sim_pars)

        l_passed_oceanic_sims_2 <- length(passed_oceanic_sims_2)
        passed_oceanic_sims_2[[l_passed_oceanic_sims_2 + 1]] <- oceanic_sim_2

        baseline_error <- calc_error(
          sim_1 = oceanic_sim_1,
          sim_2 = oceanic_sim_2,
          replicates = replicates,
          distance_method = distance_method)

        spec_nltt_error <- append(
          spec_nltt_error,
          error$spec_nltt_error)
        num_spec_error <- append(
          num_spec_error,
          error$num_spec_error)
        num_col_error <- append(
          num_col_error,
          error$num_col_error)
        endemic_nltt_error <- append(
          endemic_nltt_error,
          error$endemic_nltt_error)
        nonendemic_nltt_error <- append(
          nonendemic_nltt_error,
          error$nonendemic_nltt_error)
        spec_baseline_nltt_error <- append(
          spec_baseline_nltt_error,
          baseline_error$spec_nltt_error)
        num_spec_baseline_error <- append(
          num_spec_baseline_error,
          baseline_error$num_spec_error)
        num_col_baseline_error <- append(
          num_col_baseline_error,
          baseline_error$num_col_error)
        endemic_baseline_nltt_error <- append(
          endemic_baseline_nltt_error,
          baseline_error$endemic_nltt_error)
        nonendemic_baseline_nltt_error <- append(
          nonendemic_baseline_nltt_error,
          baseline_error$nonendemic_nltt_error)

      } else {
        failed_oceanic_mls[[length(failed_oceanic_mls) + 1]] <- oceanic_ml
        failed_oceanic_sims[[length(failed_oceanic_sims) + 1]] <- oceanic_sim_1
      }
    } else {
      failed_novel_mls[[length(failed_novel_mls) + 1]] <- novel_ml
      failed_novel_sims[[length(failed_novel_sims) + 1]] <- novel_sim
    }
    message(paste0("Number of results: ", length(passed_novel_mls)))
  }
  error_metrics <- calc_error_metrics(
    spec_nltt_error = spec_nltt_error,
    num_spec_error = num_spec_error,
    num_col_error = num_col_error,
    endemic_nltt_error = endemic_nltt_error,
    nonendemic_nltt_error = nonendemic_nltt_error,
    spec_baseline_nltt_error = spec_baseline_nltt_error,
    num_spec_baseline_error = num_spec_baseline_error,
    num_col_baseline_error = num_col_baseline_error,
    endemic_baseline_nltt_error = endemic_baseline_nltt_error,
    nonendemic_baseline_nltt_error = nonendemic_baseline_nltt_error)

  output <- list(
    spec_nltt_error = spec_nltt_error,
    num_spec_error = num_spec_error,
    num_col_error = num_col_error,
    endemic_nltt_error = endemic_nltt_error,
    nonendemic_nltt_error = nonendemic_nltt_error,
    spec_baseline_nltt_error = spec_baseline_nltt_error,
    num_spec_baseline_error = num_spec_baseline_error,
    num_col_baseline_error = num_col_baseline_error,
    endemic_baseline_nltt_error = endemic_baseline_nltt_error,
    nonendemic_baseline_nltt_error = nonendemic_baseline_nltt_error,
    error_metrics = error_metrics,
    passed_novel_mls = passed_novel_mls,
    failed_novel_mls = failed_novel_mls,
    passed_oceanic_mls = passed_oceanic_mls,
    failed_oceanic_mls = failed_oceanic_mls,
    passed_novel_sims = passed_novel_sims,
    failed_novel_sims = failed_novel_sims,
    passed_oceanic_sims_1 = passed_oceanic_sims_1,
    passed_oceanic_sims_2 = passed_oceanic_sims_2,
    failed_oceanic_sims = failed_oceanic_sims
  )

  if (save_output == TRUE) {
    save_output(
      output = output,
      param_space_name = param_space_name,
      param_set = param_set
    )
  } else {
    return(output)
  }
}

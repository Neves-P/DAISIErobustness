# Script to test whether windows and mac produce different output
# All references values are made with a windows running R v4.0

remotes::install_github("Neves-P/DAISIErobustness")

library(testthat)

param_space_name <- "nonoceanic"
param_set <- 1
replicates <- 2
pipeline = "full"
distance_method = "abs"
novel_sim = NULL
save_output = FALSE
replicate_range = NULL
load_from_file = FALSE

param_space <- DAISIErobustness:::load_param_space(
  param_space_name = param_space_name)

testit::assert(param_space_name %in% c("oceanic_ontogeny",
                                       "oceanic_sea_level",
                                       "oceanic_ontogeny_sea_level",
                                       "nonoceanic",
                                       "nonoceanic_sea_level",
                                       "nonoceanic_land_bridge",
                                       "trait"))
testit::assert(param_set >= 1)
testit::assert(param_set <= nrow(param_space))
testit::assert(replicates > 1)

set.seed(
  1,
  kind = "Mersenne-Twister",
  normal.kind = "Inversion",
  sample.kind = "Rejection"
)

sim_pars <- DAISIErobustness:::extract_param_set(
  param_space_name = param_space_name,
  param_space = param_space,
  param_set = param_set)

novel_sim <- DAISIErobustness:::run_novel_sim(
  param_space_name = param_space_name,
  sim_pars = sim_pars,
  replicates = replicates
)

expect_length(novel_sim, 2)
expect_length(novel_sim[[1]][[1]], 33)
expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 968)
expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 161)
expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
             c(2.55, 2.55))
expect_equal(novel_sim[[1]][[1]][[2]]$stac, 2)
expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
expect_length(novel_sim[[2]][[1]], 37)
expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 964)
expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 190)
expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
             c(2.55, 2.55))
expect_equal(novel_sim[[2]][[1]][[2]]$stac, 2)
expect_equal(novel_sim[[2]][[1]][[2]]$missing_species, 0)

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

sim_constraints <- DAISIErobustness:::sim_constraints(
  sim = novel_sim,
  replicates = replicates
)

if (sim_constraints == TRUE) {

  if (!is.null(replicate_range)) {
    novel_sim <- novel_sim[replicate_range[1]:replicate_range[2]]
  }

  k_approx <- calc_max_spec(novel_sim)
  k_vector_1 <- k_approx$max_spec_clade + 1
  k_vector_2 <- k_approx$num_island_spec

  initial_parameters_1_list <- vector("list", length = length(novel_sim))
  initial_parameters_2_list <- vector("list", length = length(novel_sim))

  for (i in seq_along(novel_sim)) {
    initial_parameters_1_list[[i]] <- c(
      0.05,
      0.05,
      k_vector_1[i],
      0.0001,
      0.05
    )
    initial_parameters_2_list[[i]] <- c(0.9, 1.5, k_vector_2[i] + 20, 0.01, 2)
  }

  novel_ml_1 <- DAISIErobustness:::calc_ml(
    sim = novel_sim,
    initial_parameters = initial_parameters_1_list
  )

  expect_length(novel_ml_1, 2)
  expect_equal(novel_ml_1[[1]]$lambda_c, 0.304679685136544)
  expect_equal(novel_ml_1[[1]]$mu, 1.58701262346276e-08)
  expect_equal(novel_ml_1[[1]]$K, 2.05582862414053)
  expect_equal(novel_ml_1[[1]]$gamma, 0.012550179235284)
  expect_equal(novel_ml_1[[1]]$lambda_a, 1.17323148851604)
  expect_equal(novel_ml_1[[1]]$loglik, -229.705456341053)
  expect_equal(novel_ml_1[[1]]$df, 5)
  expect_equal(novel_ml_1[[1]]$conv, 0)
  expect_equal(novel_ml_1[[2]]$lambda_c, 0.302213327306392)
  expect_equal(novel_ml_1[[2]]$mu, 1.87995413815392e-13)
  expect_equal(novel_ml_1[[2]]$K, 4.88195280859026)
  expect_equal(novel_ml_1[[2]]$gamma, 0.0141185637961691)
  expect_equal(novel_ml_1[[2]]$lambda_a, 1.23771716365966)
  expect_equal(novel_ml_1[[2]]$loglik, -260.140463548168)
  expect_equal(novel_ml_1[[2]]$df, 5)
  expect_equal(novel_ml_1[[2]]$conv, 0)

  novel_ml_2 <- DAISIErobustness:::calc_ml(
    sim = novel_sim,
    initial_parameters = initial_parameters_2_list
  )

  expect_equal()

  novel_ml_constraints_1 <- DAISIErobustness:::ml_constraints(
    ml = novel_ml_1)

  novel_ml_constraints_2 <- DAISIErobustness:::ml_constraints(
    ml = novel_ml_2)

  if (novel_ml_constraints_1 == TRUE &&
      novel_ml_constraints_2 == TRUE) {
    # TODO: save also ml_pars onto output
    best_pars <- DAISIErobustness:::decide_best_pars(
      ml_res_initpars_1 = novel_ml_1,
      ml_res_initpars_2 = novel_ml_2
    )

    novel_ml <- lapply(best_pars, `[[`, 1) # rearrange

    if (param_space_name == "trait") {
      sim_pars$M <- sim_pars$M + sim_pars$trait_pars$M2 # nolint
    }

    oceanic_sim_1 <- DAISIErobustness:::oceanic_sim(
      ml = novel_ml,
      sim_pars = sim_pars)

    error <- DAISIErobustness:::calc_error(
      sim_1 = novel_sim,
      sim_2 = oceanic_sim_1,
      replicates = replicates,
      distance_method = distance_method)

    spec_error <- error$spec_error
    endemic_error <- error$endemic_error
    nonendemic_error <- error$nonendemic_error

    oceanic_ml <- DAISIErobustness:::calc_ml(
      sim = oceanic_sim_1,
      initial_parameters = novel_ml)

    ml_constraints <- DAISIErobustness:::ml_constraints(
      ml = oceanic_ml)

    if (ml_constraints == TRUE) {
      oceanic_sim_2 <- DAISIErobustness:::oceanic_sim(
        ml = oceanic_ml,
        sim_pars = sim_pars)

      baseline_error <- DAISIErobustness:::calc_error(
        sim_1 = oceanic_sim_1,
        sim_2 = oceanic_sim_2,
        replicates = replicates,
        distance_method = distance_method)

      spec_baseline_error <- baseline_error$spec_error
      endemic_baseline_error <- baseline_error$endemic_error
      nonendemic_baseline_error <- baseline_error$nonendemic_error

      error_metrics <- DAISIErobustness:::calc_error_metrics(
        spec_error = spec_error,
        endemic_error = endemic_error,
        nonendemic_error = nonendemic_error,
        spec_baseline_error = spec_baseline_error,
        endemic_baseline_error = endemic_baseline_error,
        nonendemic_baseline_error = nonendemic_baseline_error)


    }
  }
}



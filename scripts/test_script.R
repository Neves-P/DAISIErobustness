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
  DAISIErobustness:::is_novel_sim_outputs(novel_sim)
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

  k_approx <- DAISIErobustness:::calc_max_spec(novel_sim)
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

  expect_length(novel_ml_2, 2)
  expect_equal(novel_ml_2[[1]]$lambda_c, 0.30468092798256052)
  expect_equal(novel_ml_2[[1]]$mu, 2.0771648004509252e-06)
  expect_equal(novel_ml_2[[1]]$K, 4.6388351836189887)
  expect_equal(novel_ml_2[[1]]$gamma, 0.012548303195778474)
  expect_equal(novel_ml_2[[1]]$lambda_a, 1.1734610502482943)
  expect_equal(novel_ml_2[[1]]$loglik, -229.70546847900584)
  expect_equal(novel_ml_2[[1]]$df, 5)
  expect_equal(novel_ml_2[[1]]$conv, 0)
  expect_equal(novel_ml_2[[2]]$lambda_c, 0.30216820320472576)
  expect_equal(novel_ml_2[[2]]$mu, 2.7837401930387158e-09)
  expect_equal(novel_ml_2[[2]]$K, 4.0687820694945591)
  expect_equal(novel_ml_2[[2]]$gamma, 0.014102842150933081)
  expect_equal(novel_ml_2[[2]]$lambda_a, 1.2377389210517089)
  expect_equal(novel_ml_2[[2]]$loglik, -260.14048298560579)
  expect_equal(novel_ml_2[[2]]$df, 5)
  expect_equal(novel_ml_2[[2]]$conv, 0)

  novel_ml_constraints_1 <- DAISIErobustness:::ml_constraints(
    ml = novel_ml_1)

  novel_ml_constraints_2 <- DAISIErobustness:::ml_constraints(
    ml = novel_ml_2)

  if (novel_ml_constraints_1 == TRUE &&
      novel_ml_constraints_2 == TRUE) {

    best_pars <- DAISIErobustness:::decide_best_pars(
      ml_res_initpars_1 = novel_ml_1,
      ml_res_initpars_2 = novel_ml_2
    )

    expect_equal(best_pars[[2]]$pars_to_use, data.frame(
      "lambda_c" = 0.30221332730639178,
      "mu" = 1.8799541381539199e-13,
      "K" = 4.8819528085902606,
      "gamma" = 0.014118563796169084,
      "lambda_a" = 1.2377171636596618,
      "loglik" = -260.14046354816753,
      "df" = 5,
      "conv" = 0
    ))
    expect_equal(best_pars[[1]]$pars_to_use, data.frame(
      "lambda_c" = 0.30467968513654364,
      "mu" = 1.587012623462757e-08,
      "K" = 2.0558286241405321,
      "gamma" = 0.012550179235284032,
      "lambda_a" = 1.1732314885160364,
      "loglik" = -229.70545634105272,
      "df" = 5,
      "conv" = 0
    ))

    novel_ml <- lapply(best_pars, `[[`, 1) # rearrange

    if (param_space_name == "trait") {
      sim_pars$M <- sim_pars$M + sim_pars$trait_pars$M2 # nolint
    }

    oceanic_sim_1 <- DAISIErobustness:::oceanic_sim(
      ml = novel_ml,
      sim_pars = sim_pars)

    expect_length(oceanic_sim_1, 2)
    expect_length(oceanic_sim_1[[1]][[1]], 44)
    expect_equal(oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(oceanic_sim_1[[1]][[1]][[1]]$not_present, 957)
    expect_equal(nrow(oceanic_sim_1[[1]][[1]][[1]]$stt_all), 79)
    expect_equal(ncol(oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.80630571338363999))
    expect_equal(oceanic_sim_1[[1]][[1]][[2]]$stac, 2)
    expect_equal(oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(oceanic_sim_1[[2]][[1]], 36)
    expect_equal(oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(oceanic_sim_1[[2]][[1]][[1]]$not_present, 965)
    expect_equal(nrow(oceanic_sim_1[[2]][[1]][[1]]$stt_all), 69)
    expect_equal(ncol(oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55, 1.6565071333656700, 0.4167453537909600))
    expect_equal(oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)

    error <- DAISIErobustness:::calc_error(
      sim_1 = novel_sim,
      sim_2 = oceanic_sim_1,
      replicates = replicates,
      distance_method = distance_method)


    spec_error <- error$spec_error
    endemic_error <- error$endemic_error
    nonendemic_error <- error$nonendemic_error

    expect_length(error, 3)
    expect_equal(spec_error, list(nltt = c(75.820953723255116,
                                           101.641314655604546),
                                  num_spec_error = c(7, 18),
                                  num_col_error = c(11, 1)))
    expect_equal(endemic_error, list(nltt = c(87.713442202572807,
                                              113.057244920496245)))
    expect_equal(nonendemic_error, list(nltt = c(12.992621478362462,
                                                 14.810104302481248)))

    oceanic_ml <- DAISIErobustness:::calc_ml(
      sim = oceanic_sim_1,
      initial_parameters = novel_ml)

    expect_length(oceanic_ml, 2)
    expect_equal(oceanic_ml[[1]]$lambda_c, 0.10241478839275986)
    expect_equal(oceanic_ml[[1]]$mu, 0.010529672794745766)
    expect_equal(oceanic_ml[[1]]$K, 2.3067550643009889)
    expect_equal(oceanic_ml[[1]]$gamma, 0.017071307077516227)
    expect_equal(oceanic_ml[[1]]$lambda_a, 1.1343435075645032)
    expect_equal(oceanic_ml[[1]]$loglik, -256.01908642960228)
    expect_equal(oceanic_ml[[1]]$df, 5)
    expect_equal(oceanic_ml[[1]]$conv, 0)
    expect_equal(oceanic_ml[[2]]$lambda_c, 0.18449704024608876)
    expect_equal(oceanic_ml[[2]]$mu, 9.851072589189782e-06)
    expect_equal(oceanic_ml[[2]]$K, 3.0489893421678889)
    expect_equal(oceanic_ml[[2]]$gamma, 0.014120857032474912)
    expect_equal(oceanic_ml[[2]]$lambda_a, 0.91315837428926361)
    expect_equal(oceanic_ml[[2]]$loglik, -228.7963285807098)
    expect_equal(oceanic_ml[[2]]$df, 5)
    expect_equal(oceanic_ml[[2]]$conv, 0)

    ml_constraints <- DAISIErobustness:::ml_constraints(
      ml = oceanic_ml)

    if (ml_constraints == TRUE) {
      oceanic_sim_2 <- DAISIErobustness:::oceanic_sim(
        ml = oceanic_ml,
        sim_pars = sim_pars)

      expect_length(oceanic_sim_2, 2)
      expect_length(oceanic_sim_2[[1]][[1]], 44)
      expect_equal(oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(oceanic_sim_2[[1]][[1]][[1]]$not_present, 957)
      expect_equal(nrow(oceanic_sim_2[[1]][[1]][[1]]$stt_all), 80)
      expect_equal(ncol(oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                   c(2.55, 2.3679608727440602))
      expect_equal(oceanic_sim_2[[1]][[1]][[2]]$stac, 2)
      expect_equal(oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
      expect_length(oceanic_sim_2[[2]][[1]], 47)
      expect_equal(oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(oceanic_sim_2[[2]][[1]][[1]]$not_present, 954)
      expect_equal(nrow(oceanic_sim_2[[2]][[1]][[1]]$stt_all), 75)
      expect_equal(ncol(oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                   c(2.55, 1.8930800476411700))
      expect_equal(oceanic_sim_2[[2]][[1]][[2]]$stac, 2)
      expect_equal(oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)

      baseline_error <- DAISIErobustness:::calc_error(
        sim_1 = oceanic_sim_1,
        sim_2 = oceanic_sim_2,
        replicates = replicates,
        distance_method = distance_method
      )

      spec_baseline_error <- baseline_error$spec_error
      endemic_baseline_error <- baseline_error$endemic_error
      nonendemic_baseline_error <- baseline_error$nonendemic_error

      expect_length(baseline_error, 3)
      expect_equal(spec_baseline_error, list(nltt = c(6.6871935760451153,
                                                      7.9324498375027988),
                                             num_spec_error = c(3, 6),
                                             num_col_error = c(0, 11)))
      expect_equal(endemic_baseline_error, list(nltt = c(6.0303417137707926,
                                                         3.2955637287629389)))
      expect_equal(nonendemic_baseline_error, list(nltt = c(8.4604383475926994,
                                                          7.0612577672453387)))

      error_metrics <- DAISIErobustness:::calc_error_metrics(
        spec_error = spec_error,
        endemic_error = endemic_error,
        nonendemic_error = nonendemic_error,
        spec_baseline_error = spec_baseline_error,
        endemic_baseline_error = endemic_baseline_error,
        nonendemic_baseline_error = nonendemic_baseline_error)

      expect_equal(error_metrics$num_spec_mean_diff, 8)
      expect_equal(error_metrics$num_spec_sd_diff, 5.6568542494923797)
      expect_equal(error_metrics$num_col_mean_diff, 0.5)
      expect_equal(error_metrics$num_col_sd_diff, 0.70710678118654702)
      expect_equal(error_metrics$spec_nltt_mean_diff, 81.421312482655878)
      expect_equal(error_metrics$endemic_nltt_mean_diff, 95.722390840267664)
      expect_equal(error_metrics$nonendemic_nltt_mean_diff, 6.1405148330028352)
      expect_equal(error_metrics$spec_nltt_sd_diff, 17.377223161156753)
      expect_equal(error_metrics$endemic_nltt_sd_diff, 15.986994704658983)
      expect_equal(error_metrics$nonendemic_nltt_sd_diff, 0.29578435315632279)
      expect_equal(error_metrics$spec_nltt_ks_dist, 0.030160413299745448)
      expect_equal(error_metrics$endemic_nltt_ks_dist, 0.20973894467876592)
      expect_equal(error_metrics$nonendemic_nltt_ks_dist, 0.077757103468281963)
    }
  }
}

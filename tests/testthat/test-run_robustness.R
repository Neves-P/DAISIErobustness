test_that("run_robustness output is correct when save_output = FALSE", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  errors <- run_robustness(
    param_space_name = "continental_cs",
    param_set = 2,
    replicates = 2,
    save_output = FALSE,
    test = TRUE)

  expect_length(errors, 20)
  expect_equal(errors$spec_nltt_error,
               c(15.20640404504, 9.20290764428)
  )
  expect_equal(errors$num_spec_error, c(6, 5))
  expect_equal(errors$num_col_error, c(4, 7))
  expect_equal(errors$endemic_nltt_error,
               c(16.9745722475, 11.9580766413))
  expect_equal(errors$nonendemic_nltt_error,
               c(7.09776569615, 7.74723404531))
  expect_equal(errors$spec_baseline_nltt_error,
               c(4.95265176125, 12.01732207604))
  expect_equal(errors$num_spec_baseline_error, c(1, 14))
  expect_equal(errors$num_col_baseline_error, c(3, 8))
  expect_equal(errors$endemic_baseline_nltt_error,
               c(7.64053528564, 7.47090819811))
  expect_equal(errors$nonendemic_baseline_nltt_error,
               c(4.66825760637, 8.40139702678))
  expect_equal(errors$error_metrics,
               list(num_spec_mean_diff = 2,
                    num_spec_sd_diff = 8.48528137424,
                    num_col_mean_diff = 0,
                    num_col_sd_diff = 1.414213562372,
                    spec_nltt_mean_diff = 3.71966892601,
                    endemic_nltt_mean_diff = 6.9106027025,
                    nonendemic_nltt_mean_diff = 0.887672554154,
                    spec_nltt_sd_diff = 0.75036327063,
                    endemic_nltt_sd_diff = 3.42725359708,
                    nonendemic_nltt_sd_diff = 2.18048472543))
  expect_length(errors$passed_novel_sims, 2)
  expect_length(errors$passed_novel_sims[[1]][[1]], 29)
  expect_equal(errors$passed_novel_sims[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(errors$passed_novel_sims[[1]][[1]][[1]]$not_present, 972)
  expect_equal(nrow(errors$passed_novel_sims[[1]][[1]][[1]]$stt_all), 58)
  expect_equal(ncol(errors$passed_novel_sims[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(errors$passed_novel_sims[[1]][[1]][[2]]$branching_times,
               c(2.55, 1.02163553349674))
  expect_equal(errors$passed_novel_sims[[1]][[1]][[2]]$stac, 4)
  expect_equal(errors$passed_novel_sims[[1]][[1]][[2]]$missing_species, 0)
  expect_length(errors$passed_novel_sims[[2]][[1]], 32)
  expect_equal(errors$passed_novel_sims[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(errors$passed_novel_sims[[2]][[1]][[1]]$not_present, 969)
  expect_equal(nrow(errors$passed_novel_sims[[2]][[1]][[1]]$stt_all), 83)
  expect_equal(ncol(errors$passed_novel_sims[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(errors$passed_novel_sims[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.71058548167348))
  expect_equal(errors$passed_novel_sims[[2]][[1]][[2]]$stac, 2)
  expect_equal(errors$passed_novel_sims[[2]][[1]][[2]]$missing_species, 0)
  expect_length(errors$failed_novel_sims, 0)
  expect_equal(errors$passed_novel_mls,
               list(data.frame("lambda_c" = 0.484681661005,
                               "mu" = 3.61631526775e-08,
                               "K" = 3.79064806089,
                               "gamma" = 0.0111117316464,
                               "lambda_a" = 0.209910699298,
                               "loglik" = -191.764071724,
                               "df" = 5,
                               "conv" = 0),
                    data.frame("lambda_c" = 0.483800415735,
                               "mu" = 3.18178218136e-07,
                               "K" = 4.00001361111,
                               "gamma" = 0.0122953888931,
                               "lambda_a" = 0.518625626466,
                               "loglik" = -216.006383602,
                               "df" = 5,
                               "conv" = 0)))
  # passed_oceanic_sims_1 reference
  expect_length(errors$passed_oceanic_sims_1, 2)
  expect_length(errors$passed_oceanic_sims_1[[1]][[1]], 33)
  expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$not_present, 968)
  expect_equal(
    nrow(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$stt_all), 59
  )
  expect_equal(ncol(errors$passed_oceanic_sims_1[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(
    errors$passed_oceanic_sims_1[[1]][[1]][[2]]$branching_times,
    c(2.550000000000, 0.307554076945)
  )
  expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[2]]$stac, 4)
  expect_equal(errors$passed_oceanic_sims_1[[1]][[1]][[2]]$missing_species,
               0)
  expect_length(errors$passed_oceanic_sims_1[[2]][[1]], 39)
  expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$not_present, 962)
  expect_equal(nrow(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$stt_all),
               66)
  expect_equal(ncol(errors$passed_oceanic_sims_1[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(
    errors$passed_oceanic_sims_1[[2]][[1]][[2]]$branching_times,
    c(2.55000000000, 1.40993122746)
  )
  expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[2]]$stac, 4)
  expect_equal(errors$passed_oceanic_sims_1[[2]][[1]][[2]]$missing_species,
               0)

  # passed_oceanic_sims_2 reference
  expect_length(errors$passed_oceanic_sims_2, 2)
  expect_length(errors$passed_oceanic_sims_2[[1]][[1]], 36)
  expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$not_present, 965)
  expect_equal(
    nrow(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$stt_all), 58
  )
  expect_equal(ncol(errors$passed_oceanic_sims_2[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(
    errors$passed_oceanic_sims_2[[1]][[1]][[2]]$branching_times,
    c(2.550000000000, 0.182670616574)
  )
  expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[2]]$stac, 4)
  expect_equal(errors$passed_oceanic_sims_2[[1]][[1]][[2]]$missing_species,
               0)
  expect_length(errors$passed_oceanic_sims_2[[2]][[1]], 47)
  expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$not_present, 954)
  expect_equal(nrow(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$stt_all), 79)
  expect_equal(ncol(errors$passed_oceanic_sims_2[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(
    errors$passed_oceanic_sims_2[[2]][[1]][[2]]$branching_times,
    c(2.550000000000, 0.387257835805)
  )
  expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[2]]$stac, 4)
  expect_equal(errors$passed_oceanic_sims_2[[2]][[1]][[2]]$missing_species,
               0)

  # Failed oceanic_sims
  expect_length(errors$failed_oceanic_sims, 0)

  # Reference passed_oceanic_ml
  expect_length(errors$passed_oceanic_ml, 2)
  expect_equal(errors$passed_oceanic_ml,
               list(data.frame("lambda_c" = 0.609310224378,
                               "mu" = 1.87167037107e-05,
                               "K" = 3.00000002036,
                               "gamma" = 0.0131207154685,
                               "lambda_a" = 0.405187894064,
                               "loglik" = -221.863767922,
                               "df" = 5,
                               "conv" = 0),
                    data.frame("lambda_c" = 0.473573558518,
                               "mu" = 4.43719941799e-08,
                               "K" = 2.9999938918,
                               "gamma" = 0.015149905586,
                               "lambda_a" = 0.392253866138,
                               "loglik" = -244.592298904,
                               "df" = 5,
                               "conv" = 0)))
  expect_length(errors$failed_oceanic_mls, 0)

})

test_that("abuse param_set", {
  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_cs",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_cs",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level_cs",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level_cs",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level_cs",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level_cs",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "continental_cs",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "continental_cs",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "continental_land_bridge_cs",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "continental_land_bridge_cs",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "trait_CES",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "trait_CES",
    param_set = 1000000,
    replicates = 2))
})

test_that("abuse replicates", {
  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "continental_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "continental_sea_level_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "continental_land_bridge_cs",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "trait_CES",
    param_set = 1,
    replicates = 0))
})


test_that("expose #63", {
  skip("Loop never finishes")
  run_robustness(
    "oceanic_sea_level_cs",
    param_set = 7,
    replicates = 2,
    distance_method = "abs",
    save_output = FALSE,
    test = TRUE
  )
})

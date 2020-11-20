context("run_robustness")

test_that("run_robustness output is correct when save_output = FALSE", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

      errors <- run_robustness(
        param_space_name = "nonoceanic",
        param_set = 2,
        replicates = 2,
        save_output = FALSE)

      expect_length(errors, 19)
      expect_equal(errors$spec_error, list(nltt = c(15.50389052354415,
                                                    20.6280375792080),
                                           num_spec_error = c(8, 2),
                                           num_col_error = c(7, 4)))
      expect_equal(errors$endemic_error, list(nltt = c(22.50127216642516,
                                                       27.15731277537603)))
      expect_equal(errors$nonendemic_error, list(nltt = c(10.436651741467948,
                                                          6.986535669285867)))
      expect_equal(errors$spec_baseline_error, list(
        nltt = c(21.679928114903571,
                 3.983657812841726),
        num_spec_error = c(5, 2),
        num_col_error = c(1, 7))
      )
      expect_equal(errors$endemic_baseline_error,
                   list(nltt = c(18.924168383749826, 4.665069272644651)))
      expect_equal(errors$nonendemic_baseline_error,
                   list(nltt = c(6.099704844915999, 3.648023528135512)))
      expect_equal(errors$error_metrics,
                   list(num_spec_mean_diff = 1.5,
                        num_spec_sd_diff = 2.12132034355964,
                        num_col_mean_diff = 1.5,
                        num_col_sd_diff = 2.12132034355964,
                        spec_nltt_mean_diff = 5.23417108750344,
                        endemic_nltt_mean_diff = 13.0346736427034,
                        nonendemic_nltt_mean_diff = 3.83772951885115,
                        spec_nltt_sd_diff = 8.88983360144104,
                        endemic_nltt_sd_diff = 6.79038778700444,
                        nonendemic_nltt_sd_diff = 0.705999986116799))
      expect_length(errors$novel_sim, 2)
      expect_length(errors$novel_sim[[1]][[1]], 25)
      expect_equal(errors$novel_sim[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$novel_sim[[1]][[1]][[1]]$not_present, 976)
      expect_equal(nrow(errors$novel_sim[[1]][[1]][[1]]$stt_all), 120)
      expect_equal(ncol(errors$novel_sim[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$novel_sim[[1]][[1]][[2]]$branching_times,
                   c(2.55,
                     1.02163553349673997,
                     0.37188819214780000,
                     0.18270240256150000,
                     0.11913435616494999))
      expect_equal(errors$novel_sim[[1]][[1]][[2]]$stac, 2)
      expect_equal(errors$novel_sim[[1]][[1]][[2]]$missing_species, 0)
      expect_length(errors$novel_sim[[2]][[1]], 26)
      expect_equal(errors$novel_sim[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$novel_sim[[2]][[1]][[1]]$not_present, 975)
      expect_equal(nrow(errors$novel_sim[[2]][[1]][[1]]$stt_all), 142)
      expect_equal(ncol(errors$novel_sim[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$novel_sim[[2]][[1]][[2]]$branching_times,
                   c(2.55, 0.59116788792787001))
      expect_equal(errors$novel_sim[[2]][[1]][[2]]$stac, 4)
      expect_equal(errors$novel_sim[[2]][[1]][[2]]$missing_species, 0)
      expect_equal(errors$novel_ml,
                   list(data.frame("lambda_c" = 0.8824454895921542,
                                   "mu" = 0.3113755051386142,
                                   "K" = 13.82877297309126,
                                   "gamma" = 0.01186426339331943,
                                   "lambda_a" = 0.7015325993640438,
                                   "loglik" = -192.1211089141583,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 0.803466328939126,
                                   "mu" = 2.001682354626096e-07,
                                   "K" = 9.091822417681556,
                                   "gamma" = 0.009827314785672257,
                                   "lambda_a" = 0.9568454404341787,
                                   "loglik" = -200.1698472949494,
                                   "df" = 5,
                                   "conv" = 0)))
      # oceanic_sim_1 reference
      expect_length(errors$oceanic_sim_1, 2)
      expect_length(errors$oceanic_sim_1[[1]][[1]], 32)
      expect_equal(errors$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$oceanic_sim_1[[1]][[1]][[1]]$not_present, 969)
      expect_equal(nrow(errors$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 118)
      expect_equal(ncol(errors$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                   c(2.55, 0.041908179742209797))
      expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
      expect_equal(errors$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
      expect_length(errors$oceanic_sim_1[[2]][[1]], 30)
      expect_equal(errors$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$oceanic_sim_1[[2]][[1]][[1]]$not_present, 971)
      expect_equal(nrow(errors$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 78)
      expect_equal(ncol(errors$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                   c(2.55, 0.82320728572358004))
      expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
      expect_equal(errors$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
      # oceanic_sim_2 reference
      expect_length(errors$oceanic_sim_2, 2)
      expect_length(errors$oceanic_sim_2[[1]][[1]], 31)
      expect_equal(errors$oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$oceanic_sim_2[[1]][[1]][[1]]$not_present, 970)
      expect_equal(nrow(errors$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 139)
      expect_equal(ncol(errors$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                   c(2.55, 0.229137735142440013, 0.056686987265089701))
      expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$stac, 2)
      expect_equal(errors$oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
      expect_length(errors$oceanic_sim_2[[2]][[1]], 37)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[1]]$not_present, 964)
      expect_equal(nrow(errors$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 83)
      expect_equal(ncol(errors$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                   c(2.549999999999999822,
                     0.432405070355510013,
                     0.261396415512720026,
                     0.065332249010409807))
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$stac, 2)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
      expect_equal(errors$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
      expect_equal(errors$ml_constraints, TRUE)

  })

test_that("abuse param_set", {
  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_sea_level",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_sea_level",
    param_set = 1000000,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_land_bridge",
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

  expect_error(run_robustness(
    param_space_name = "trait_trans",
    param_set = 0,
    replicates = 2))

  expect_error(run_robustness(
    param_space_name = "trait_trans",
    param_set = 1000000,
    replicates = 2))
})

test_that("abuse replicates", {
  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "oceanic_sea_level",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "nonoceanic",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_sea_level",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "nonoceanic_land_bridge",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "trait_CES",
    param_set = 1,
    replicates = 0))

  expect_error(run_robustness(
    param_space_name = "trait_trans",
    param_set = 1,
    replicates = 0))
})

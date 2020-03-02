context("oceanic_simulations")

test_that("test oceanic simulation output is correct for
          oceanic_ontogeny", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  #ML output from oceanic_ontogeny param_set 1
  geodynamic_ml <- list()
  geodynamic_ml[[1]] <- c(0.4270512648004822,
                          0.1928106725300651,
                          1.009117716659776,
                          0.004681193017565683,
                          2.260911182830638,
                          -78.50919503883652,
                          5,
                          0)
  names(geodynamic_ml[[1]]) <- c("lambda_c",
                                 "mu",
                                 "K",
                                 "gamma",
                                 "lambda_a",
                                 "loglik",
                                 "df",
                                 "conv")
  geodynamic_ml[[2]] <- c(0.7116563392201466,
                          1.153914558890585,
                          1.570145195746095,
                          0.01642353253875526,
                          1.2997677018568698,
                          -119.270335187471,
                          5,
                          0)
  names(geodynamic_ml[[2]]) <- c("lambda_c",
                                 "mu",
                                 "K",
                                 "gamma",
                                 "lambda_a",
                                 "loglik",
                                 "df",
                                 "conv")
  simulation_pars <- list()
  simulation_pars$time <- 2.55
  simulation_pars$M <- 1000
  set.seed(1)
  oceanic_simulations <- oceanic_simulations(
    ml = geodynamic_ml,
    simulation_pars = simulation_pars,
    verbose = FALSE)

  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]][[1]], 9)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$not_present, 992)
  expect_equal(nrow(oceanic_simulations[[1]][[1]][[1]]$stt_all), 30)
  expect_equal(ncol(oceanic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.9158820591328))
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]][[1]], 21)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$not_present, 980)
  expect_equal(nrow(oceanic_simulations[[2]][[1]][[1]]$stt_all), 98)
  expect_equal(ncol(oceanic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.79436892889236))
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$stac, 4)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test oceanic simulation output is correct for
          oceanic_sea_level", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "oceanic_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  ml <- #make ml from a run
  oceanic_simulations <- oceanic_simulations(
    ml = ml,
    simulation_pars = simulation_pars)

  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]], 100)
  expect_equal(oceanic_simulations[[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]]$not_present, 900)
  expect_matrix(oceanic_simulations[[1]][[1]]$stt_all)
  expect_equal(nrow(oceanic_simulations[[1]][[1]]$stt_all), 600)
  expect_equal(ncol(oceanic_simulations[[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[2]]$branching_times,
               c(2.55, 0.5))
  expect_equal(oceanic_simulations[[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]], 100)
  expect_equal(oceanic_simulations[[2]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]]$not_present, 900)
  expect_matrix(oceanic_simulations[[2]][[1]]$stt_all)
  expect_equal(nrow(oceanic_simulations[[2]][[1]]$stt_all), 600)
  expect_equal(ncol(oceanic_simulations[[2]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[2]]$branching_times,
               c(2.55, 0.5))
  expect_equal(oceanic_simulations[[2]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[2]]$missing_species, 0)
})

test_that("test oceanic simulation output is correct for
          oceanic_ontogeny_sea_level", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_space = param_space,
    param_set = 1)
  ml <- #make ml from a run
  oceanic_simulations <- oceanic_simulations(
    ml = ml,
    simulation_pars = simulation_pars)

  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]], 100)
  expect_equal(oceanic_simulations[[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]]$not_present, 900)
  expect_matrix(oceanic_simulations[[1]][[1]]$stt_all)
  expect_equal(nrow(oceanic_simulations[[1]][[1]]$stt_all), 600)
  expect_equal(ncol(oceanic_simulations[[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[2]]$branching_times,
               c(2.55, 0.5))
  expect_equal(oceanic_simulations[[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]], 100)
  expect_equal(oceanic_simulations[[2]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]]$not_present, 900)
  expect_matrix(oceanic_simulations[[2]][[1]]$stt_all)
  expect_equal(nrow(oceanic_simulations[[2]][[1]]$stt_all), 600)
  expect_equal(ncol(oceanic_simulations[[2]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[2]]$branching_times,
               c(2.55, 0.5))
  expect_equal(oceanic_simulations[[2]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[2]]$missing_species, 0)
})

test_that("test oceanic simulation output is correct for
          nonoceanic", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "nonoceanic")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic",
    param_space = param_space,
    param_set = 1)
  ml <- #make ml from a run
  oceanic_simulations <- oceanic_simulations(
    ml = ml,
    simulation_pars = simulation_pars)

  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]], 100)
  expect_equal(oceanic_simulations[[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]]$not_present, 900)
  expect_matrix(oceanic_simulations[[1]][[1]]$stt_all)
  expect_equal(nrow(oceanic_simulations[[1]][[1]]$stt_all), 600)
  expect_equal(ncol(oceanic_simulations[[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[2]]$branching_times,
               c(2.55, 0.5))
  expect_equal(oceanic_simulations[[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]], 100)
  expect_equal(oceanic_simulations[[2]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]]$not_present, 900)
  expect_matrix(oceanic_simulations[[2]][[1]]$stt_all)
  expect_equal(nrow(oceanic_simulations[[2]][[1]]$stt_all), 600)
  expect_equal(ncol(oceanic_simulations[[2]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[2]]$branching_times,
               c(2.55, 0.5))
  expect_equal(oceanic_simulations[[2]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[2]]$missing_species, 0)
})

test_that("test oceanic simulation output is correct for
          nonoceanic_sea_level", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "nonoceanic_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  ml <- #make ml from a run
  oceanic_simulations <- oceanic_simulations(
    ml = ml,
    simulation_pars = simulation_pars)

  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]], 100)
  expect_equal(oceanic_simulations[[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]]$not_present, 900)
  expect_matrix(oceanic_simulations[[1]][[1]]$stt_all)
  expect_equal(nrow(oceanic_simulations[[1]][[1]]$stt_all), 600)
  expect_equal(ncol(oceanic_simulations[[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[2]]$branching_times,
               c(2.55, 0.5))
  expect_equal(oceanic_simulations[[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]], 100)
  expect_equal(oceanic_simulations[[2]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]]$not_present, 900)
  expect_matrix(oceanic_simulations[[2]][[1]]$stt_all)
  expect_equal(nrow(oceanic_simulations[[2]][[1]]$stt_all), 600)
  expect_equal(ncol(oceanic_simulations[[2]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[2]]$branching_times,
               c(2.55, 0.5))
  expect_equal(oceanic_simulations[[2]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[2]]$missing_species, 0)
})

test_that("test oceanic simulation output is correct for
          nonoceanic_land_bridge", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "nonoceanic_land_bridge")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic_land_bridge",
    param_space = param_space,
    param_set = 1)
  ml <- #make ml from a run
  oceanic_simulation <- oceanic_simulations(
    ml = ml,
    simulation_pars = simulation_pars)

  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]], 100)
  expect_equal(oceanic_simulations[[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]]$not_present, 900)
  expect_matrix(oceanic_simulations[[1]][[1]]$stt_all)
  expect_equal(nrow(oceanic_simulations[[1]][[1]]$stt_all), 600)
  expect_equal(ncol(oceanic_simulations[[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[2]]$branching_times,
               c(2.55, 0.5))
  expect_equal(oceanic_simulations[[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]], 100)
  expect_equal(oceanic_simulations[[2]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]]$not_present, 900)
  expect_matrix(oceanic_simulations[[2]][[1]]$stt_all)
  expect_equal(nrow(oceanic_simulations[[2]][[1]]$stt_all), 600)
  expect_equal(ncol(oceanic_simulations[[2]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[2]]$branching_times,
               c(2.55, 0.5))
  expect_equal(oceanic_simulations[[2]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[2]]$missing_species, 0)
})

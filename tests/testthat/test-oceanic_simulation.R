context("oceanic_simulations")

test_that("test oceanic simulation output is correct for
          oceanic_ontogeny", {
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
  simulation_pars <- list(time = 2.55,
                          M = 1000)
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
})

test_that("test oceanic simulation output is correct for
          oceanic_sea_level", {
  skip("cannot find param_set that passes conditioning")
})

test_that("test oceanic simulation output is correct for
          oceanic_ontogeny_sea_level", {
  skip("cannot find param_set that passes conditioning")
})

test_that("test oceanic simulation output is correct for nonoceanic", {
  #ML output from nonoceanic param_set 1
  geodynamic_ml <- list()
  geodynamic_ml[[1]] <- c(0.3030426715001062,
                          3.167720708419692e-06,
                          0.8868934733085727,
                          0.01254949434634543,
                          1.1731975619011,
                          -229.8376194753926,
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
  geodynamic_ml[[2]] <- c(0.2989712202780352,
                          9.24203250049033e-16,
                          17.77625736819867,
                          0.01411715487111965,
                          1.237744438415452,
                          -260.4378128793282,
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
  simulation_pars <- list(time = 2.55,
                          M = 1000)
  set.seed(1)
  oceanic_simulations <- oceanic_simulations(
    ml = geodynamic_ml,
    simulation_pars = simulation_pars,
    verbose = FALSE)
  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]][[1]], 32)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$not_present, 969)
  expect_equal(nrow(oceanic_simulations[[1]][[1]][[1]]$stt_all), 54)
  expect_equal(ncol(oceanic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.93635625131273))
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]][[1]], 34)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$not_present, 967)
  expect_equal(nrow(oceanic_simulations[[2]][[1]][[1]]$stt_all), 66)
  expect_equal(ncol(oceanic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 1.93367633684196, 1.47889540263715))
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$missing_species, 0)
})

test_that("test oceanic simulation output is correct for
          nonoceanic_sea_level", {
  skip("cannot find param_set that passes conditioning")
})

test_that("test oceanic simulation output is correct for
          nonoceanic_land_bridge", {
  skip("cannot find param_set that passes conditioning")
})

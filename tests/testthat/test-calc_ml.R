context("calc_ml")

test_that("test calc_ml output is correct for oceanic_ontogeny", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_ontogeny",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)
  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)
  if (simulation_constraints == TRUE) {
    geodynamic_ml <- calc_ml(
      param_space_name = "oceanic_ontogeny",
      simulation_pars = simulation_pars,
      simulations = geodynamic_simulations)
  }
  expect_length(geodynamic_ml, 2)
  expect_equal(geodynamic_ml[[1]]$lambda_c, 0.4270512648004822)
  expect_equal(geodynamic_ml[[1]]$mu, 0.1928106725300651)
  expect_equal(geodynamic_ml[[1]]$K, 1.009117716659776)
  expect_equal(geodynamic_ml[[1]]$gamma, 0.004681193017565683)
  expect_equal(geodynamic_ml[[1]]$lambda_a, 2.260911182830638)
  expect_equal(geodynamic_ml[[1]]$loglik, -78.50919503883652)
  expect_equal(geodynamic_ml[[1]]$df, 5)
  expect_equal(geodynamic_ml[[1]]$conv, 0)
  expect_equal(geodynamic_ml[[2]]$lambda_c, 0.7116563392201466)
  expect_equal(geodynamic_ml[[2]]$mu, 1.153914558890585)
  expect_equal(geodynamic_ml[[2]]$K, 1.570145195746095)
  expect_equal(geodynamic_ml[[2]]$gamma, 0.01642353253875526)
  expect_equal(geodynamic_ml[[2]]$lambda_a, 1.299767701856869)
  expect_equal(geodynamic_ml[[2]]$loglik, -119.270335187471)
  expect_equal(geodynamic_ml[[2]]$df, 5)
  expect_equal(geodynamic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_ml output is correct for oceanic_sea_level", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_ontogeny",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)
  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)
  if (simulation_constraints == TRUE) {
    geodynamic_ml <- calc_ml(
      param_space_name = "oceanic_ontogeny",
      simulation_pars = simulation_pars,
      simulations = geodynamic_simulations)
  }
  expect_length(geodynamic_ml, 2)
  expect_equal(geodynamic_ml[[1]]$lambda_c, 0.4270512648004822)
  expect_equal(geodynamic_ml[[1]]$mu, 0.1928106725300651)
  expect_equal(geodynamic_ml[[1]]$K, 1.009117716659776)
  expect_equal(geodynamic_ml[[1]]$gamma, 0.004681193017565683)
  expect_equal(geodynamic_ml[[1]]$lambda_a, 2.260911182830638)
  expect_equal(geodynamic_ml[[1]]$loglik, -78.50919503883652)
  expect_equal(geodynamic_ml[[1]]$df, 5)
  expect_equal(geodynamic_ml[[1]]$conv, 0)
  expect_equal(geodynamic_ml[[2]]$lambda_c, 0.7116563392201466)
  expect_equal(geodynamic_ml[[2]]$mu, 1.153914558890585)
  expect_equal(geodynamic_ml[[2]]$K, 1.570145195746095)
  expect_equal(geodynamic_ml[[2]]$gamma, 0.01642353253875526)
  expect_equal(geodynamic_ml[[2]]$lambda_a, 1.299767701856869)
  expect_equal(geodynamic_ml[[2]]$loglik, -119.270335187471)
  expect_equal(geodynamic_ml[[2]]$df, 5)
  expect_equal(geodynamic_ml[[2]]$conv, 0)
})

test_that("test calc_ml output is correct for oceanic_ontogeny_sea_level", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_ontogeny",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)
  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)
  if (simulation_constraints == TRUE) {
    geodynamic_ml <- calc_ml(
      param_space_name = "oceanic_ontogeny",
      simulation_pars = simulation_pars,
      simulations = geodynamic_simulations)
  }
  expect_length(geodynamic_ml, 2)
  expect_equal(geodynamic_ml[[1]]$lambda_c, 0.4270512648004822)
  expect_equal(geodynamic_ml[[1]]$mu, 0.1928106725300651)
  expect_equal(geodynamic_ml[[1]]$K, 1.009117716659776)
  expect_equal(geodynamic_ml[[1]]$gamma, 0.004681193017565683)
  expect_equal(geodynamic_ml[[1]]$lambda_a, 2.260911182830638)
  expect_equal(geodynamic_ml[[1]]$loglik, -78.50919503883652)
  expect_equal(geodynamic_ml[[1]]$df, 5)
  expect_equal(geodynamic_ml[[1]]$conv, 0)
  expect_equal(geodynamic_ml[[2]]$lambda_c, 0.7116563392201466)
  expect_equal(geodynamic_ml[[2]]$mu, 1.153914558890585)
  expect_equal(geodynamic_ml[[2]]$K, 1.570145195746095)
  expect_equal(geodynamic_ml[[2]]$gamma, 0.01642353253875526)
  expect_equal(geodynamic_ml[[2]]$lambda_a, 1.299767701856869)
  expect_equal(geodynamic_ml[[2]]$loglik, -119.270335187471)
  expect_equal(geodynamic_ml[[2]]$df, 5)
  expect_equal(geodynamic_ml[[2]]$conv, 0)
})

test_that("test calc_ml output is correct for nonoceanic", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)
  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)
  if (simulation_constraints == TRUE) {
    geodynamic_ml <- calc_ml(
      param_space_name = "nonoceanic",
      simulation_pars = simulation_pars,
      simulations = geodynamic_simulations)
  }
  expect_length(geodynamic_ml, 2)
  expect_equal(geodynamic_ml[[1]]$lambda_c, 0.3030426715001062)
  expect_equal(geodynamic_ml[[1]]$mu, 3.167720708419692e-06)
  expect_equal(geodynamic_ml[[1]]$K, 0.8868934733085727)
  expect_equal(geodynamic_ml[[1]]$gamma, 0.01254949434634543)
  expect_equal(geodynamic_ml[[1]]$lambda_a, 1.1731975619011)
  expect_equal(geodynamic_ml[[1]]$loglik, -229.8376194753926)
  expect_equal(geodynamic_ml[[1]]$df, 5)
  expect_equal(geodynamic_ml[[1]]$conv, 0)
  expect_equal(geodynamic_ml[[2]]$lambda_c, 0.2989712202780352)
  expect_equal(geodynamic_ml[[2]]$mu, 9.24203250049033e-16)
  expect_equal(geodynamic_ml[[2]]$K, 17.77625736819867)
  expect_equal(geodynamic_ml[[2]]$gamma, 0.01411715487111965)
  expect_equal(geodynamic_ml[[2]]$lambda_a, 1.237744438415452)
  expect_equal(geodynamic_ml[[2]]$loglik, -260.4378128793282)
  expect_equal(geodynamic_ml[[2]]$df, 5)
  expect_equal(geodynamic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("test calc_ml output is correct for nonoceanic_sea_level", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "nonoceanic_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)
  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)
  if (simulation_constraints == TRUE) {
    geodynamic_ml <- calc_ml(
      param_space_name = "nonoceanic_sea_level",
      simulation_pars = simulation_pars,
      simulations = geodynamic_simulations)
  }
  expect_length(geodynamic_ml, 2)
  expect_equal(geodynamic_ml[[1]]$lambda_c, 0.4270512648004822)
  expect_equal(geodynamic_ml[[1]]$mu, 0.1928106725300651)
  expect_equal(geodynamic_ml[[1]]$K, 1.009117716659776)
  expect_equal(geodynamic_ml[[1]]$gamma, 0.004681193017565683)
  expect_equal(geodynamic_ml[[1]]$lambda_a, 2.260911182830638)
  expect_equal(geodynamic_ml[[1]]$loglik, -78.50919503883652)
  expect_equal(geodynamic_ml[[1]]$df, 5)
  expect_equal(geodynamic_ml[[1]]$conv, 0)
  expect_equal(geodynamic_ml[[2]]$lambda_c, 0.7116563392201466)
  expect_equal(geodynamic_ml[[2]]$mu, 1.153914558890585)
  expect_equal(geodynamic_ml[[2]]$K, 1.570145195746095)
  expect_equal(geodynamic_ml[[2]]$gamma, 0.01642353253875526)
  expect_equal(geodynamic_ml[[2]]$lambda_a, 1.299767701856869)
  expect_equal(geodynamic_ml[[2]]$loglik, -119.270335187471)
  expect_equal(geodynamic_ml[[2]]$df, 5)
  expect_equal(geodynamic_ml[[2]]$conv, 0)
})

test_that("test calc_ml output is correct for nonoceanic_land_bridge", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "nonoceanic_land_bridge")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic_land_bridge",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic_land_bridge",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)
  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)
  if (simulation_constraints == TRUE) {
    geodynamic_ml <- calc_ml(
      param_space_name = "nonoceanic_land_bridge",
      simulation_pars = simulation_pars,
      simulations = geodynamic_simulations)
  }
  expect_length(geodynamic_ml, 2)
  expect_equal(geodynamic_ml[[1]]$lambda_c, 0.4270512648004822)
  expect_equal(geodynamic_ml[[1]]$mu, 0.1928106725300651)
  expect_equal(geodynamic_ml[[1]]$K, 1.009117716659776)
  expect_equal(geodynamic_ml[[1]]$gamma, 0.004681193017565683)
  expect_equal(geodynamic_ml[[1]]$lambda_a, 2.260911182830638)
  expect_equal(geodynamic_ml[[1]]$loglik, -78.50919503883652)
  expect_equal(geodynamic_ml[[1]]$df, 5)
  expect_equal(geodynamic_ml[[1]]$conv, 0)
  expect_equal(geodynamic_ml[[2]]$lambda_c, 0.7116563392201466)
  expect_equal(geodynamic_ml[[2]]$mu, 1.153914558890585)
  expect_equal(geodynamic_ml[[2]]$K, 1.570145195746095)
  expect_equal(geodynamic_ml[[2]]$gamma, 0.01642353253875526)
  expect_equal(geodynamic_ml[[2]]$lambda_a, 1.299767701856869)
  expect_equal(geodynamic_ml[[2]]$loglik, -119.270335187471)
  expect_equal(geodynamic_ml[[2]]$df, 5)
  expect_equal(geodynamic_ml[[2]]$conv, 0)
})

test_that("test calc_ml output is correct for failed convergence", {
  skip("Need to fail convergence")
  simulation_pars <- "stub"
  geodynamic_simulations <- "stub"
  geodynamic_ml <- calc_ml(
      param_space_name = "nonoceanic_land_bridge",
      simulation_pars = simulation_pars,
      simulations = geodynamic_simulations)
  expect_length(geodynamic_ml, 2)
  expect_equal(geodynamic_ml[[1]], "No convergence")
  expect_equal(geodynamic_ml[[2]], "No convergence")
})

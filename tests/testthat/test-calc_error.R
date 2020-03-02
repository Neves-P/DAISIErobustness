context("calc_error")

test_that("test calc_error outout is correct for oceanic_ontogeny", {
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
  geodynamic_ml <- calc_ml(
    param_space_name = "oceanic_ontogeny",
    simulation_pars = simulation_pars,
    simulations = geodynamic_simulations)
  oceanic_simulations_1 <- oceanic_simulations(
    ml = geodynamic_ml,
    simulation_pars = simulation_pars,
    verbose = FALSE)

  error <- calc_error(
    simulation_pars = simulation_pars,
    ml = geodynamic_ml,
    simulations_1 = geodynamic_simulations,
    simulations_2 = oceanic_simulations_1,
    replicates = 2)

  expect_length(error, 4)
  expect_equal(error$rates_error, list(clado_error = c(0.4269513, 0.7115563),
                                       ext_error = c(0.8071893, 0.1539146),
                                       K_error = c(1.008118, 1.569145),
                                       immig_error = c(0.005318807, 0.006423533),
                                       ana_error = c(1.2609112, 0.2997677)))
  expect_equal(error$species_error, list(nltt = c(9.620198, 11.868106),
                                         num_spec_error = c(0, 3),
                                         num_colonists_error = c(0, 0)))
  expect_equal(error$endemic_error, list(nltt = c(6.028886, 7.425692)))
  expect_equal(error$nonendemic_error, list(c(15.89321, 16.96369)))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test calc_error outout is correct for oceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "oceanic_sea_level")
    set.seed(1)
    simulation_pars <- extract_param_set(
      param_space_name = "oceanic_sea_level",
      param_space = param_space,
      param_set = 1)
    geodynamic_simulations <- geodynamic_simulations(
      param_space_name = "oceanic_sea_level",
      simulation_pars = simulation_pars,
      replicates = 2,
      verbose = FALSE)
    geodynamic_ml <- calc_ml(
      param_space_name = "oceanic_sea_level",
      simulation_pars = simulation_pars,
      simulations = geodynamic_simulations)
    oceanic_simulations_1 <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = FALSE)

    error <- calc_error(
      simulation_pars = simulation_pars,
      ml = geodynamic_ml,
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations_1,
      replicates = 2)

    expect_length(error, 4)
    expect_equal(error$rates_error, list(clado_error = c(0.4269513, 0.7115563),
                                         ext_error = c(0.8071893, 0.1539146),
                                         K_error = c(1.008118, 1.569145),
                                         immig_error = c(0.005318807, 0.006423533),
                                         ana_error = c(1.2609112, 0.2997677)))
    expect_equal(error$species_error, list(nltt = c(9.620198, 11.868106),
                                           num_spec_error = c(0, 3),
                                           num_colonists_error = c(0, 0)))
    expect_equal(error$endemic_error, list(nltt = c(6.028886, 7.425692)))
    expect_equal(error$nonendemic_error, list(c(15.89321, 16.96369)))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

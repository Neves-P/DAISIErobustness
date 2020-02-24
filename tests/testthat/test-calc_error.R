context("calc_error")

test_that("test calc_error outout is correct for oceanic_ontogeny", {
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
    replicates = 2)
  geodynamic_ml <- #take ml from run
  oceanic_simulations_1 <- oceanic_simulations(
    ml = geodynamic_ml,
    simulation_pars = simulation_pars)

  error <- calc_error(
    simulation_pars = simulation_pars,
    geodynamic_ml = geodynamic_ml,
    geodynamic_simulations = geodynamic_simulations,
    oceanic_simulations_1 = oceanic_simulations_1,
    replicates = replicates)

  expect_length(error, 4)
  expect_equal(error$rates_error, c())
  expect_equal(error$species_error, c())
  expect_equal(error$endemic_error, c())
  expect_equal(error$nonendemic_error, c())
})

test_that("test calc_error outout is correct for oceanic_sea_level", {
  skip("WIP")
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
    replicates = 2)
  geodynamic_ml <- #take ml from run
    oceanic_simulations_1 <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars)

  error <- calc_error(
    simulation_pars = simulation_pars,
    geodynamic_ml = geodynamic_ml,
    geodynamic_simulations = geodynamic_simulations,
    oceanic_simulations_1 = oceanic_simulations_1,
    replicates = replicates)

  expect_length(error, 4)
  expect_equal(error$rates_error, c())
  expect_equal(error$species_error, c())
  expect_equal(error$endemic_error, c())
  expect_equal(error$nonendemic_error, c())
})


test_that("test calc_error outout is correct for
          oceanic_ontogeny_sea_level", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_ontogeny_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2)
  geodynamic_ml <- #take ml from run
    oceanic_simulations_1 <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars)

  error <- calc_error(
    simulation_pars = simulation_pars,
    geodynamic_ml = geodynamic_ml,
    geodynamic_simulations = geodynamic_simulations,
    oceanic_simulations_1 = oceanic_simulations_1,
    replicates = replicates)

  expect_length(error, 4)
  expect_equal(error$rates_error, c())
  expect_equal(error$species_error, c())
  expect_equal(error$endemic_error, c())
  expect_equal(error$nonendemic_error, c())
})


test_that("test calc_error outout is correct for nonoceanic", {
  skip("WIP")
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
    replicates = 2)
  geodynamic_ml <- #take ml from run
    oceanic_simulations_1 <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars)

  error <- calc_error(
    simulation_pars = simulation_pars,
    geodynamic_ml = geodynamic_ml,
    geodynamic_simulations = geodynamic_simulations,
    oceanic_simulations_1 = oceanic_simulations_1,
    replicates = replicates)

  expect_length(error, 4)
  expect_equal(error$rates_error, c())
  expect_equal(error$species_error, c())
  expect_equal(error$endemic_error, c())
  expect_equal(error$nonendemic_error, c())
})


test_that("test calc_error outout is correct for
          nonoceanic_sea_level", {
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
    replicates = 2)
  geodynamic_ml <- #take ml from run
    oceanic_simulations_1 <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars)

  error <- calc_error(
    simulation_pars = simulation_pars,
    geodynamic_ml = geodynamic_ml,
    geodynamic_simulations = geodynamic_simulations,
    oceanic_simulations_1 = oceanic_simulations_1,
    replicates = replicates)

  expect_length(error, 4)
  expect_equal(error$rates_error, c())
  expect_equal(error$species_error, c())
  expect_equal(error$endemic_error, c())
  expect_equal(error$nonendemic_error, c())
})

test_that("test calc_error outout is correct for
          nonoceanic_land_bridge", {
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
    replicates = 2)
  geodynamic_ml <- #take ml from run
    oceanic_simulations_1 <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars)

  error <- calc_error(
    simulation_pars = simulation_pars,
    geodynamic_ml = geodynamic_ml,
    geodynamic_simulations = geodynamic_simulations,
    oceanic_simulations_1 = oceanic_simulations_1,
    replicates = replicates)

  expect_length(error, 4)
  expect_equal(error$rates_error, c())
  expect_equal(error$species_error, c())
  expect_equal(error$endemic_error, c())
  expect_equal(error$nonendemic_error, c())
})

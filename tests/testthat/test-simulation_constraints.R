context("simulation_contraints")

test_that("test simulation_constraints returns TRUE when simulation
          meets contraints for oceanic_ontogeny", {
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
    geodynamic_simulations,
    replicates = 2)

  expect_true(simulation_constraints)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet contraints for oceanic_ontogeny", {
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

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations)
  expect_false(simulation_constraints)
  expect_equal(simulation_constraints, FALSE)
})

test_that("test simulation_constraints returns TRUE when simulation
          meets contraints for oceanic_sea_level", {
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

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations)
  expect_true(simulation_constraints)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet contraints for oceanic_sea_level", {
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

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations)
  expect_false(simulation_constraints)
  expect_equal(simulation_constraints, FALSE)
})

test_that("test simulation_constraints returns TRUE when simulation
          meets contraints for oceanic_ontogeny_sea_level", {
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

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations)
  expect_true(simulation_constraints)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet contraints for oceanic_ontogeny_sea_level", {
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

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations)
  expect_false(simulation_constraints)
  expect_equal(simulation_constraints, FALSE)
})

test_that("test simulation_constraints returns TRUE when simulation
          meets contraints for nonoceanic", {
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

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations)
  expect_true(simulation_constraints)
  expect_equal(simulation_constraints, TRUE)
})


test_that("test simulation_constraints returns FALSE when simulation
          does not meet contraints for nonoceanic", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "nonoceanic")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic",
    param_space = param_space,
    param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_ontogeny",
    simulation_pars = simulation_pars,
    replicates = 2)

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations)
  expect_false(simulation_constraints)
  expect_equal(simulation_constraints, FALSE)
})

test_that("test simulation_constraints returns TRUE when simulation
          meets contraints for nonoceanic_sea_level", {
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

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations)
  expect_true(simulation_constraints)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet contraints for nonoceanic_sea_level", {
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

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations)
  expect_false(simulation_constraints)
  expect_equal(simulation_constraints, FALSE)
})

test_that("test simulation_constraints returns TRUE when simulation meets
          contraints for oceanic_ontogeny", {
  skip("WIP")
  param_space <- load_param_space(param_space_name = "oceanic_ontogeny")
  set.seed(1)
  simulation_pars <- extract_param_set(param_space_name = "oceanic_ontogeny",
                                       param_space = param_space,
                                       param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(param_space_name = "oceanic_ontogeny",
                                                   simulation_pars = simulation_pars,
                                                   replicates = 2)

  simulation_constraints <- simulation_constraints(geodynamic_simulations)
  expect_true(simulation_constraints)
  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns TRUE when simulation meets contraints for oceanic_ontogeny", {
  skip("WIP")
  param_space <- load_param_space(param_space_name = "oceanic_ontogeny")
  set.seed(1)
  simulation_pars <- extract_param_set(param_space_name = "oceanic_ontogeny",
                                       param_space = param_space,
                                       param_set = 1)
  geodynamic_simulations <- geodynamic_simulations(param_space_name = "oceanic_ontogeny",
                                                   simulation_pars = simulation_pars,
                                                   replicates = 2)

  simulation_constraints <- simulation_constraints(geodynamic_simulations)
  expect_true(simulation_constraints)
  expect_equal(simulation_constraints, TRUE)
})

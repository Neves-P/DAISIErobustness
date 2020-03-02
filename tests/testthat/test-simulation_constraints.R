context("simulation_constraints")

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for oceanic_ontogeny", {
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
    geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for oceanic_ontogeny", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny",
    param_space = param_space,
    param_set = 4)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_ontogeny",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVseyor")
  }
})

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for oceanic_sea_level", {
  skip("cannot find param_set that passes conditioning")
  param_space <- load_param_space(
    param_space_name = "oceanic_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_sea_level",
    param_space = param_space,
    param_set = 17)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for oceanic_sea_level", {
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

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for oceanic_ontogeny_sea_level", {
  skip("cannot find param_set that passes keep looking")
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_space = param_space,
    param_set = 25)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "oceanic_ontogeny_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for oceanic_ontogeny_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
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
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for nonoceanic", {
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

  expect_equal(simulation_constraints, TRUE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})


test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for nonoceanic", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic",
    param_space = param_space,
    param_set = 2)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns TRUE when simulation
          meets constraints for nonoceanic_sea_level", {
  skip("Cannot find param_set that passes keep looking")
  param_space <- load_param_space(
    param_space_name = "nonoceanic_sea_level")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic_sea_level",
    param_space = param_space,
    param_set = 10)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic_sea_level",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
})

test_that("test simulation_constraints returns FALSE when simulation
          does not meet constraints for nonoceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
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

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns TRUE when simulation meets
          constraints for nonoceanic_land_bridge", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic_land_bridge")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "nonoceanic_land_bridge",
    param_space = param_space,
    param_set = 4)
  geodynamic_simulations <- geodynamic_simulations(
    param_space_name = "nonoceanic_land_bridge",
    simulation_pars = simulation_pars,
    replicates = 2,
    verbose = FALSE)

  simulation_constraints <- simulation_constraints(
    simulations = geodynamic_simulations,
    replicates = 2)

  expect_equal(simulation_constraints, TRUE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test simulation_constraints returns FALSE when simulation meets
          constraints for nonoceanic_land_bridge", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
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

  expect_equal(simulation_constraints, FALSE)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

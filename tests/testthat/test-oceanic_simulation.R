context("oceanic_simulations")

test_that("test oceanic simulation output is correct for
          oceanic_ontogeny", {
  skip("WIP")
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny")
  set.seed(1)
  simulation_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny",
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

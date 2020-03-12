context("geodynamic_simulations")

test_that("test geodynamic_simulation output is correct for
          oceanic_ontogeny", {
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
  expect_length(geodynamic_simulations, 2)
  expect_length(geodynamic_simulations[[1]][[1]], 11)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$not_present, 990)
  expect_equal(nrow(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 92)
  expect_equal(ncol(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.16583840374981))
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_simulations[[2]][[1]], 19)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$not_present, 982)
  expect_equal(nrow(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 132)
  expect_equal(ncol(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55,
                 0.85594841486772,
                 0.80903212943811,
                 0.31633454531757))
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_simulation output is correct for
          oceanic_sea_level", {
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
  expect_length(geodynamic_simulations, 2)
  expect_length(geodynamic_simulations[[1]][[1]], 6)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$not_present, 995)
  expect_equal(nrow(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 81)
  expect_equal(ncol(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55,
                 0.52495868988335004,
                 0.07975814914718971))
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_simulations[[2]][[1]], 8)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$not_present, 993)
  expect_equal(nrow(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 67)
  expect_equal(ncol(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.0311246188310297))
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_simulation output is correct for
          oceanic_ontogeny_sea_level", {
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
  expect_length(geodynamic_simulations, 2)
  expect_length(geodynamic_simulations[[1]][[1]], 4)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$not_present, 997)
  expect_equal(nrow(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 73)
  expect_equal(ncol(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.35243774875998))
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_simulations[[2]][[1]], 4)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$not_present, 997)
  expect_equal(nrow(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 129)
  expect_equal(ncol(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.0240935084438596))
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_simulation output is correct for
          nonoceanic", {
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
  expect_length(geodynamic_simulations, 2)
  expect_length(geodynamic_simulations[[1]][[1]], 33)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$not_present, 968)
  expect_equal(nrow(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 161)
  expect_equal(ncol(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 2.55))
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_simulations[[2]][[1]], 37)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$not_present, 964)
  expect_equal(nrow(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 190)
  expect_equal(ncol(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 2.55))
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_simulation output is correct for
          nonoceanic_sea_level", {
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
  expect_length(geodynamic_simulations, 2)
  expect_length(geodynamic_simulations[[1]][[1]], 8)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$not_present, 993)
  expect_equal(nrow(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 277)
  expect_equal(ncol(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 2.55))
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_simulations[[2]][[1]], 10)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$not_present, 991)
  expect_equal(nrow(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 268)
  expect_equal(ncol(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.34621111229062))
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_simulation output is correct for
          nonoceanic_land_bridge", {
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
  expect_length(geodynamic_simulations, 2)
  expect_length(geodynamic_simulations[[1]][[1]], 48)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[1]][[1]][[1]]$not_present, 953)
  expect_equal(nrow(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 222)
  expect_equal(ncol(geodynamic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 2.46180547513068))
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_simulations[[2]][[1]], 55)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_simulations[[2]][[1]][[1]]$not_present, 946)
  expect_equal(nrow(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 245)
  expect_equal(ncol(geodynamic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 1.72434686891246, 1.34727356898184, 0.03352916965332))
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_simulations[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

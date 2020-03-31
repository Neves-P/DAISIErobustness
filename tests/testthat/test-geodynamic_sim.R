context("geodynamic_sim")

test_that("test geodynamic_sim output is correct for
          oceanic_ontogeny", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny",
    param_space = param_space,
    param_set = 1)
  geodynamic_sim <- geodynamic_sim(
    param_space_name = "oceanic_ontogeny",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(geodynamic_sim, 2)
  expect_length(geodynamic_sim[[1]][[1]], 30)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$not_present, 971)
  expect_equal(nrow(geodynamic_sim[[1]][[1]][[1]]$stt_all), 268)
  expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.17243358418345))
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_sim[[2]][[1]], 24)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 977)
  expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 256)
  expect_equal(ncol(geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 1.52998334839940, 0.96837497253262, 0.81089291279412))
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_sim output is correct for
          oceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_sea_level")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  geodynamic_sim <- geodynamic_sim(
    param_space_name = "oceanic_sea_level",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(geodynamic_sim, 2)
  expect_length(geodynamic_sim[[1]][[1]], 17)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$not_present, 984)
  expect_equal(nrow(geodynamic_sim[[1]][[1]][[1]]$stt_all), 215)
  expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.1795517757535))
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_sim[[2]][[1]], 11)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 990)
  expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 227)
  expect_equal(ncol(geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 1.85245280964108))
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_sim output is correct for
          oceanic_ontogeny_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_sea_level")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_space = param_space,
    param_set = 1)
  geodynamic_sim <- geodynamic_sim(
    param_space_name = "oceanic_ontogeny_sea_level",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(geodynamic_sim, 2)
  expect_length(geodynamic_sim[[1]][[1]], 6)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$not_present, 995)
  expect_equal(nrow(geodynamic_sim[[1]][[1]][[1]]$stt_all), 231)
  expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.14312750771642))
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_sim[[2]][[1]], 5)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 996)
  expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 161)
  expect_equal(ncol(geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.67183406610468, 0.44215862926012))
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_sim output is correct for
          nonoceanic", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "nonoceanic",
    param_space = param_space,
    param_set = 1)
  geodynamic_sim <- geodynamic_sim(
    param_space_name = "nonoceanic",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(geodynamic_sim, 2)
  expect_length(geodynamic_sim[[1]][[1]], 33)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$not_present, 968)
  expect_equal(nrow(geodynamic_sim[[1]][[1]][[1]]$stt_all), 161)
  expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 2.55))
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_sim[[2]][[1]], 37)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 964)
  expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 190)
  expect_equal(ncol(geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 2.55))
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_sim output is correct for
          nonoceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic_sea_level")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "nonoceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  geodynamic_sim <- geodynamic_sim(
    param_space_name = "nonoceanic_sea_level",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(geodynamic_sim, 2)
  expect_length(geodynamic_sim[[1]][[1]], 8)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$not_present, 993)
  expect_equal(nrow(geodynamic_sim[[1]][[1]][[1]]$stt_all), 277)
  expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 2.55))
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_sim[[2]][[1]], 10)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 991)
  expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 268)
  expect_equal(ncol(geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.34621111229062))
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_sim output is correct for
          nonoceanic_land_bridge", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic_land_bridge")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "nonoceanic_land_bridge",
    param_space = param_space,
    param_set = 1)
  geodynamic_sim <- geodynamic_sim(
    param_space_name = "nonoceanic_land_bridge",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(geodynamic_sim, 2)
  expect_length(geodynamic_sim[[1]][[1]], 52)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$not_present, 949)
  expect_equal(nrow(geodynamic_sim[[1]][[1]][[1]]$stt_all), 217)
  expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 1.23995127324015))
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_sim[[2]][[1]], 42)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 959)
  expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 211)
  expect_equal(ncol(geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 2.55, 1.87402017166709, 1.16075873682785,
                 1.07049906606893, 0.99999511323588, 0.75816229384226,
                 0.70258413745740, 0.67650683563606, 0.37848436451160,
                 0.32033159209147, 0.10696364569155))
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

context("geodynamic_sim")

test_that("test geodynamic_sim output is correct for
          oceanic_ontogeny", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
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
  expect_length(geodynamic_sim[[1]][[1]], 64)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$not_present, 937)
  expect_equal(nrow(geodynamic_sim[[1]][[1]][[1]]$stt_all), 145)
  expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.56869465348621))
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_sim[[2]][[1]], 59)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 942)
  expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 143)
  expect_equal(ncol(geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 2.27175578586757))
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_sim output is correct for
          oceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
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
  expect_length(geodynamic_sim[[1]][[1]], 53)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$not_present, 948)
  expect_equal(nrow(geodynamic_sim[[1]][[1]][[1]]$stt_all), 127)
  expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.56869465348621))
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_sim[[2]][[1]], 67)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 934)
  expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 154)
  expect_equal(ncol(geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.58817439824343))
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_sim output is correct for
          oceanic_ontogeny_sea_level", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
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
  expect_length(geodynamic_sim[[1]][[1]], 50)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$not_present, 951)
  expect_equal(nrow(geodynamic_sim[[1]][[1]][[1]]$stt_all), 113)
  expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.56869465348621))
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_sim[[2]][[1]], 59)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 942)
  expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 144)
  expect_equal(ncol(geodynamic_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 1.4510374682645))
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$stac, 2)
  expect_equal(geodynamic_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test geodynamic_sim output is correct for
          nonoceanic", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin"
      || Sys.getenv("APPVEYOR") != "") {
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
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
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
  expect_length(geodynamic_sim[[1]][[1]], 92)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[1]][[1]][[1]]$not_present, 909)
  expect_equal(nrow(geodynamic_sim[[1]][[1]][[1]]$stt_all), 159)
  expect_equal(ncol(geodynamic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 2.55))
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$stac, 3)
  expect_equal(geodynamic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(geodynamic_sim[[2]][[1]], 89)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(geodynamic_sim[[2]][[1]][[1]]$not_present, 912)
  expect_equal(nrow(geodynamic_sim[[2]][[1]][[1]]$stt_all), 154)
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
          nonoceanic_land_bridge", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
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

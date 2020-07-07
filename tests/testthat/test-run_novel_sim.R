context("run_novel_sim")

test_that("test run_novel_sim output is correct for
          oceanic_ontogeny", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_ontogeny",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 55)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 946)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 161)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.78255544467993998))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 46)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 955)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 121)
  expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.84834891210547003))
  expect_equal(novel_sim[[2]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test run_novel_sim output is correct for
          oceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_sea_level")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_sea_level",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 41)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 960)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 114)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.78784699357233001))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 47)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 954)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 138)
  expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test run_novel_sim output is correct for
          oceanic_ontogeny_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_sea_level")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_ontogeny_sea_level",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 50)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 951)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 130)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.78255544467993998))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 49)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 952)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 134)
  expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.61557786186479002))
  expect_equal(novel_sim[[2]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test run_novel_sim output is correct for
          nonoceanic", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "nonoceanic",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "nonoceanic",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 19)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 982)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 83)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.52495868988335004))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 2)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 22)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 979)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 91)
  expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.058254267147279701))
  expect_equal(novel_sim[[2]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test run_novel_sim output is correct for
          nonoceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic_sea_level")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "nonoceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "nonoceanic_sea_level",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 2)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 999)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 380)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.039161719076519698))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 5)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 996)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 417)
  expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.026666833523899799))
  expect_equal(novel_sim[[2]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test run_novel_sim output is correct for
          nonoceanic_land_bridge", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "nonoceanic_land_bridge")
  set.seed(1)
  sim_pars <- extract_param_set(
    param_space_name = "nonoceanic_land_bridge",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "nonoceanic_land_bridge",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 52)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 949)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 217)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 1.23995127324015))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 2)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 42)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 959)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 211)
  expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 2.55, 1.87402017166709, 1.16075873682785,
                 1.07049906606893, 0.99999511323588, 0.75816229384226,
                 0.70258413745740, 0.67650683563606, 0.37848436451160,
                 0.32033159209147, 0.10696364569155))
  expect_equal(novel_sim[[2]][[1]][[2]]$stac, 2)
  expect_equal(novel_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test run_novel_sim output is correct for
          trait", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "trait")
    set.seed(1)
    sim_pars <- extract_param_set(
      param_space_name = "trait",
      param_space = param_space,
      param_set = 1)
    novel_sim <- run_novel_sim(
      param_space_name = "trait",
      sim_pars = sim_pars,
      replicates = 2)
    expect_length(novel_sim, 2)
    expect_length(novel_sim[[1]][[1]], 32)
    expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 969)
    expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 99)
    expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.69238625112921004, 0.26333626828994999))
    expect_equal(novel_sim[[1]][[1]][[2]]$stac, 2)
    expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_sim[[2]][[1]], 39)
    expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 962)
    expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 113)
    expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
                 c(2.55, 2.2018061961978699))
    expect_equal(novel_sim[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_sim[[2]][[1]][[2]]$missing_species, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

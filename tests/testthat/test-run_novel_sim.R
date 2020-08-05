context("run_novel_sim")

test_that("test run_novel_sim output is correct for
          oceanic_ontogeny", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny")
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_ontogeny",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 57)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 944)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 153)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.78255544467993998))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 44)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 957)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 111)
  expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.97250255552968))
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
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_sea_level",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 38)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 963)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 115)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.78784699357233001))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 48)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 953)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 135)
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
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_sea_level",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_ontogeny_sea_level",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 48)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 953)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 121)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.78255544467993998))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 51)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 950)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 134)
  expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.69495367310673))
  expect_equal(novel_sim[[2]][[1]][[2]]$stac, 2)
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
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
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
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "nonoceanic_sea_level",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "nonoceanic_sea_level",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 48)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 953)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 135)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 1.44526390195017))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 2)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 38)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 963)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 140)
  expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.56674837066609))
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
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "nonoceanic_land_bridge",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "nonoceanic_land_bridge",
    sim_pars = sim_pars,
    replicates = 2)
  expect_length(novel_sim, 2)
  expect_length(novel_sim[[1]][[1]], 25)
  expect_equal(novel_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]][[1]]$not_present, 976)
  expect_equal(nrow(novel_sim[[1]][[1]][[1]]$stt_all), 89)
  expect_equal(ncol(novel_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 2.09983694478869, 2.09199464856839))
  expect_equal(novel_sim[[1]][[1]][[2]]$stac, 2)
  expect_equal(novel_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(novel_sim[[2]][[1]], 17)
  expect_equal(novel_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[2]][[1]][[1]]$not_present, 984)
  expect_equal(nrow(novel_sim[[2]][[1]][[1]]$stt_all), 77)
  expect_equal(ncol(novel_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 2.55))
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
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
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

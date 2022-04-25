test_that("test run_novel_sim output is correct for oceanic_ontogeny_cs", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_cs")
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_cs",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_ontogeny_cs",
    sim_pars = sim_pars)
  expect_length(novel_sim, 1)
  expect_length(novel_sim[[1]], 57)
  expect_equal(novel_sim[[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]]$not_present, 944)
  expect_equal(nrow(novel_sim[[1]][[1]]$stt_all), 153)
  expect_equal(ncol(novel_sim[[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[2]]$branching_times,
               c(2.55, 0.78255544467993998))
  expect_equal(novel_sim[[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[2]]$missing_species, 0)
})

test_that("test run_novel_sim output is correct for oceanic_sea_level", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  param_space <- load_param_space(
    param_space_name = "oceanic_sea_level_cs")
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_sea_level_cs",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_sea_level_cs",
    sim_pars = sim_pars)
  expect_length(novel_sim, 1)
  expect_length(novel_sim[[1]], 38)
  expect_equal(novel_sim[[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]]$not_present, 963)
  expect_equal(nrow(novel_sim[[1]][[1]]$stt_all), 115)
  expect_equal(ncol(novel_sim[[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[2]]$branching_times,
               c(2.55, 0.78784699357233))
  expect_equal(novel_sim[[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[2]]$missing_species, 0)
})

test_that("test run_novel_sim output is correct for
          oceanic_ontogeny_sea_level_cs", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_sea_level_cs")
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_sea_level_cs",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_ontogeny_sea_level_cs",
    sim_pars = sim_pars)
  expect_length(novel_sim, 1)
  expect_length(novel_sim[[1]], 48)
  expect_equal(novel_sim[[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]]$not_present, 953)
  expect_equal(nrow(novel_sim[[1]][[1]]$stt_all), 121)
  expect_equal(ncol(novel_sim[[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[2]]$branching_times,
               c(2.55, 0.78255544467993998))
  expect_equal(novel_sim[[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[2]]$missing_species, 0)
})

test_that("test run_novel_sim output is correct for continental_cs", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  param_space <- load_param_space(
    param_space_name = "continental_cs")
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "continental_cs",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "continental_cs",
    sim_pars = sim_pars)
  expect_length(novel_sim, 1)
  expect_length(novel_sim[[1]], 25)
  expect_equal(novel_sim[[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]]$not_present, 976)
  expect_equal(nrow(novel_sim[[1]][[1]]$stt_all), 45)
  expect_equal(ncol(novel_sim[[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[2]]$branching_times,
               c(2.55, 2.55))
  expect_equal(novel_sim[[1]][[2]]$stac, 2)
  expect_equal(novel_sim[[1]][[2]]$missing_species, 0)
})

test_that("test run_novel_sim output is correct for
          continental_land_bridge_cs", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  param_space <- load_param_space(
    param_space_name = "continental_land_bridge_cs")
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "continental_land_bridge_cs",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "continental_land_bridge_cs",
    sim_pars = sim_pars)
  expect_length(novel_sim, 1)
  expect_length(novel_sim[[1]], 24)
  expect_equal(novel_sim[[1]][[1]]$island_age, 2.55)
  expect_equal(novel_sim[[1]][[1]]$not_present, 977)
  expect_equal(nrow(novel_sim[[1]][[1]]$stt_all), 81)
  expect_equal(ncol(novel_sim[[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[2]]$branching_times,
               c(2.55, 2.09983694478869, 2.09179048465453))
  expect_equal(novel_sim[[1]][[2]]$stac, 2)
  expect_equal(novel_sim[[1]][[2]]$missing_species, 0)
})

test_that("test run_novel_sim output is correct for trait", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  param_space <- load_param_space(
    param_space_name = "trait_CES")
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "trait_CES",
    param_space = param_space,
    param_set = 1)
  novel_sim <- run_novel_sim(
    param_space_name = "trait_CES",
    sim_pars = sim_pars)
  expect_length(novel_sim, 1)
  expect_length(novel_sim[[1]], 32)
  expect_equal(novel_sim[[1]][[1]]$island_age, 5)
  expect_equal(novel_sim[[1]][[1]]$not_present, 969)
  expect_equal(nrow(novel_sim[[1]][[1]]$stt_all), 94)
  expect_equal(ncol(novel_sim[[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[2]]$branching_times,
               c(5.0, 0.3414342016913))
  expect_equal(novel_sim[[1]][[2]]$stac, 2)
  expect_equal(novel_sim[[1]][[2]]$missing_species, 0)
})

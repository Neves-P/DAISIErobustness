context("novel_sim")

test_that("test run_novel_sim output is correct for
          oceanic_ontogeny", {
            skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

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

test_that("test run_novel_sim output is correct for
          oceanic_sea_level", {
            skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

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
              sim_pars = sim_pars)
            expect_length(novel_sim, 1)
            expect_length(novel_sim[[1]], 38)
            expect_equal(novel_sim[[1]][[1]]$island_age, 2.55)
            expect_equal(novel_sim[[1]][[1]]$not_present, 963)
            expect_equal(nrow(novel_sim[[1]][[1]]$stt_all), 115)
            expect_equal(ncol(novel_sim[[1]][[1]]$stt_all), 5)
            expect_equal(novel_sim[[1]][[2]]$branching_times,
                         c(2.55, 0.78784699357233001))
            expect_equal(novel_sim[[1]][[2]]$stac, 4)
            expect_equal(novel_sim[[1]][[2]]$missing_species, 0)
})

test_that("test run_novel_sim output is correct for
          oceanic_ontogeny_sea_level", {
            skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

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

test_that("test run_novel_sim output is correct for
          nonoceanic", {
            skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

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
              sim_pars = sim_pars)
            expect_length(novel_sim, 1)
            expect_length(novel_sim[[1]], 19)
            expect_equal(novel_sim[[1]][[1]]$island_age, 2.55)
            expect_equal(novel_sim[[1]][[1]]$not_present, 982)
            expect_equal(nrow(novel_sim[[1]][[1]]$stt_all), 83)
            expect_equal(ncol(novel_sim[[1]][[1]]$stt_all), 5)
            expect_equal(novel_sim[[1]][[2]]$branching_times,
                         c(2.55, 0.52495868988335004))
            expect_equal(novel_sim[[1]][[2]]$stac, 2)
            expect_equal(novel_sim[[1]][[2]]$missing_species, 0)
})

test_that("test run_novel_sim output is correct for
          nonoceanic_land_bridge", {
            skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

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
              sim_pars = sim_pars)
            expect_length(novel_sim, 1)
            expect_length(novel_sim[[1]], 23)
            expect_equal(novel_sim[[1]][[1]]$island_age, 2.55)
            expect_equal(novel_sim[[1]][[1]]$not_present, 978)
            expect_equal(nrow(novel_sim[[1]][[1]]$stt_all), 82)
            expect_equal(ncol(novel_sim[[1]][[1]]$stt_all), 5)
            expect_equal(novel_sim[[1]][[2]]$branching_times,
                         c(2.55, 2.09983694478869, 2.09199464856839))
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
  expect_equal(nrow(novel_sim[[1]][[1]]$stt_all), 79)
  expect_equal(ncol(novel_sim[[1]][[1]]$stt_all), 5)
  expect_equal(novel_sim[[1]][[2]]$branching_times,
               c(5.0, 0.94991737976669999))
  expect_equal(novel_sim[[1]][[2]]$stac, 4)
  expect_equal(novel_sim[[1]][[2]]$missing_species, 0)
})

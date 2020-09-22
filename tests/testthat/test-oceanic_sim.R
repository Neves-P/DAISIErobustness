context("oceanic_sim")

test_that("test oceanic sim output is correct", {
  geodynamic_ml <- list(data.frame("lambda_c" = 1,
                                   "mu" = 1,
                                   "K" = 25,
                                   "gamma" = 0.01,
                                   "lambda_a" = 1,
                                   "loglik" = -90,
                                   "df" = 5,
                                   "conv" = 0),
                        data.frame("lambda_c" = 1,
                                   "mu" = 1,
                                   "K" = 25,
                                   "gamma" = 0.01,
                                   "lambda_a" = 1.,
                                   "loglik" = -90,
                                   "df" = 5,
                                   "conv" = 0))
  sim_pars <- list(time = 2.55,
                   M = 1000)
  cond <- 5
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  oceanic_sim <- oceanic_sim(
    ml = geodynamic_ml,
    sim_pars = sim_pars,
    cond = cond)
  expect_length(oceanic_sim, 2)
  expect_length(oceanic_sim[[1]][[1]], 12)
  expect_equal(oceanic_sim[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_sim[[1]][[1]][[1]]$not_present, 989)
  expect_equal(nrow(oceanic_sim[[1]][[1]][[1]]$stt_all), 84)
  expect_equal(ncol(oceanic_sim[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_sim[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.10473153547943))
  expect_equal(oceanic_sim[[1]][[1]][[2]]$stac, 4)
  expect_equal(oceanic_sim[[1]][[1]][[2]]$missing_species, 0)
  expect_length(oceanic_sim[[2]][[1]], 20)
  expect_equal(oceanic_sim[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_sim[[2]][[1]][[1]]$not_present, 981)
  expect_equal(nrow(oceanic_sim[[2]][[1]][[1]]$stt_all), 107)
  expect_equal(ncol(oceanic_sim[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_sim[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.6717947788536500, 0.0734442730747298))
  expect_equal(oceanic_sim[[2]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_sim[[2]][[1]][[2]]$missing_species, 0)
})


test_that("test oceanic sim returns string in failed ML", {
  skip("WIP - Need updated data file from 1.0.1 param spaces")
  load(system.file(
    "extdata",
    "passed_cond_nonoceanic_param_set_244.RData",
    package = "DAISIErobustness"
  ))
  param_space <- load_param_space(param_space_name = "nonoceanic")
  sim_pars <- extract_param_set(
    param_space_name = "nonceanic",
    param_space = param_space,
    param_set = 93
  )
  out <- oceanic_sim(ml = output$novel_ml_2[[93]], sim_pars = sim_pars)
  expect_equal(out, list("ML didn't converge"))
})

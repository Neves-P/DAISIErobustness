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
  set.seed(1)
  oceanic_sim <- oceanic_sim(
    ml = geodynamic_ml,
    sim_pars = sim_pars)
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

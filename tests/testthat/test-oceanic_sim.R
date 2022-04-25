test_that("test oceanic sim output is correct", {
  geodynamic_ml <- data.frame("lambda_c" = 1,
                              "mu" = 1,
                              "K" = 25,
                              "gamma" = 0.01,
                              "lambda_a" = 1,
                              "loglik" = -90,
                              "df" = 5,
                              "conv" = 0)
  sim_pars <- list(time = 2.55,
                   M = 1000,
                   pars = c(0.25, 0.25, 10, 0.01, 0.25),
                   nonoceanic_pars = c(0.01, 0.1),
                   divdepmodel = "CS")
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  oceanic_sim <- run_oceanic_sim(
    ml = geodynamic_ml,
    sim_pars = sim_pars)
  expect_length(oceanic_sim, 1)
  expect_length(oceanic_sim[[1]], 12)
  expect_equal(oceanic_sim[[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_sim[[1]][[1]]$not_present, 989)
  expect_equal(nrow(oceanic_sim[[1]][[1]]$stt_all), 84)
  expect_equal(ncol(oceanic_sim[[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_sim[[1]][[2]]$branching_times,
               c(2.55, 0.10473153547943))
  expect_equal(oceanic_sim[[1]][[2]]$stac, 4)
  expect_equal(oceanic_sim[[1]][[2]]$missing_species, 0)
})

test_that("test oceanic sim output with trait_pars is correct", {
  trait_ml <- data.frame("lambda_c" = 1,
                         "mu" = 1,
                         "K" = 25,
                         "gamma" = 0.01,
                         "lambda_a" = 1,
                         "loglik" = -90,
                         "df" = 5,
                         "conv" = 0)
  trait_pars <- list(trans_rate = 0.5,
                     immig_rate2 = 0.01,
                     ext_rate2 = 1,
                     ana_rate2 = 1,
                     clado_rate2 = 1,
                     trans_rate2 = 0.5,
                     M2 = 500)

  sim_pars <- list(time = 2.55,
                   M = 500,
                   pars = c(0.25, 0.25, 10, 0.01, 0.25),
                   nonoceanic_pars = c(0.01, 0.1),
                   divdepmodel = "CS",
                   trait_pars = trait_pars)
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  oceanic_sim <- run_oceanic_sim(
    ml = trait_ml,
    sim_pars = sim_pars)
  expect_length(oceanic_sim, 1)
  expect_length(oceanic_sim[[1]], 12)
  expect_equal(oceanic_sim[[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_sim[[1]][[1]]$not_present, 989)
  expect_equal(nrow(oceanic_sim[[1]][[1]]$stt_all), 84)
  expect_equal(ncol(oceanic_sim[[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_sim[[1]][[2]]$branching_times,
               c(2.55, 0.10473153547943))
  expect_equal(oceanic_sim[[1]][[2]]$stac, 4)
  expect_equal(oceanic_sim[[1]][[2]]$missing_species, 0)
})

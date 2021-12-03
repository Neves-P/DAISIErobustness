test_that("test calc_ml output is correct with geodynamic sim", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  param_space <- load_param_space(
    param_space_name = "nonoceanic_cs")
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  sim_pars <- extract_param_set(
    param_space_name = "nonoceanic_cs",
    param_space = param_space,
    param_set = 3)
  novel_sim <- run_novel_sim(
    param_space_name = "nonoceanic_cs",
    sim_pars = sim_pars)

  max_spec_number <- calc_max_spec(novel_sim)
  k_approx <- max_spec_number + 1
  initial_parameters <- c(0.05, 0.05, k_approx, 0.0001, 0.05)

  novel_ml <- calc_ml(
    sim = novel_sim,
    initial_parameters = initial_parameters)
  expect_length(novel_ml, 8)
  expect_equal(novel_ml$lambda_c, 0.244413663312908)
  expect_equal(novel_ml$mu, 0.45671352554751)
  expect_equal(novel_ml$K, 3.00000143269716)
  expect_equal(novel_ml$gamma, 0.0128646077369159)
  expect_equal(novel_ml$lambda_a, 0.41542346950456)
  expect_equal(novel_ml$loglik, -129.167974001895)
  expect_equal(novel_ml$df, 5)
  expect_equal(novel_ml$conv, 0)
})

test_that("test calc_ml output is correct with oceanic sim", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_cs")
  novel_ml <- data.frame("lambda_c" = 1,
                         "mu" = 1,
                         "K" = 25,
                         "gamma" = 0.01,
                         "lambda_a" = 1,
                         "loglik" = -90,
                         "df" = 5,
                         "conv" = 0)
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny_cs",
    param_space = param_space,
    param_set = 1)
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )
  oceanic_sim_1 <- run_oceanic_sim(
    ml = novel_ml,
    sim_pars = sim_pars)
  oceanic_ml <- calc_ml(
    sim = oceanic_sim_1,
    initial_parameters = novel_ml)
  expect_length(oceanic_ml, 8)
  expect_equal(oceanic_ml$lambda_c, 1.27408536971302)
  expect_equal(oceanic_ml$mu, 0.128003360531255)
  expect_equal(oceanic_ml$K, 3.00002456076289)
  expect_equal(oceanic_ml$gamma, 0.00468502700356342)
  expect_equal(oceanic_ml$lambda_a, 1.25676620859537)
  expect_equal(oceanic_ml$loglik, -84.1740838545781)
  expect_equal(oceanic_ml$df, 5)
  expect_equal(oceanic_ml$conv, 0)
})

test_that("test calc_ml output is correct for failed convergence", {
  skip("Optimize test - find non converging model")
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
    param_set = 233)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_sea_level_cs",
    sim_pars = sim_pars)
  k_approx <- calc_max_spec(novel_sim) + 1

  novel_ml <- calc_ml(
    sim = novel_sim,
    initial_parameters = c(0.05, 0.05, k_approx, 0.0001, 0.05)
  )
  expect_length(novel_ml, 8)
})

test_that("test calc_ml output is correct with traits sim", {
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

  k_approx <- calc_max_spec(novel_sim) + 1

  novel_ml <- calc_ml(
    sim = novel_sim,
    initial_parameters = c(0.05, 0.05, k_approx, 0.0001, 0.05)
  )

  expect_length(novel_ml, 8)
  expect_equal(novel_ml$lambda_c, 0.164335443299587)
  expect_equal(novel_ml$mu, 0.0258477572512833)
  expect_equal(novel_ml$K, 37.6407087136477)
  expect_equal(novel_ml$gamma, 0.00657111980166912)
  expect_equal(novel_ml$lambda_a, 0.422934669711228)
  expect_equal(novel_ml$loglik, -245.241403782016)
  expect_equal(novel_ml$df, 5)
  expect_equal(novel_ml$conv, 0)
})

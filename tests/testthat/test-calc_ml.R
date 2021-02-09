context("calc_ml")

test_that("test calc_ml output is correct with geodynamic sim", {
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
    param_set = 3)
  novel_sim <- run_novel_sim(
    param_space_name = "nonoceanic",
    sim_pars = sim_pars)

  max_spec_number <- calc_max_spec(novel_sim)
  k_approx <- max_spec_number + 1
  initial_parameters <- c(0.05, 0.05, k_approx, 0.0001, 0.05)

  novel_ml <- calc_ml(
    sim = novel_sim,
    initial_parameters = initial_parameters)
  expect_length(novel_ml, 8)
  expect_equal(novel_ml$lambda_c, 39.362193426797631)
  expect_equal(novel_ml$mu, 1.9717071098034797)
  expect_equal(novel_ml$K, 1.0043605918921454)
  expect_equal(novel_ml$gamma, 0.016565679786946477)
  expect_equal(novel_ml$lambda_a, 1.1393837336264882e-07)
  expect_equal(novel_ml$loglik, -56.860582049322005)
  expect_equal(novel_ml$df, 5)
  expect_equal(novel_ml$conv, 0)
})

test_that("test calc_ml output is correct with oceanic sim", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny")
  novel_ml <- data.frame("lambda_c" = 1,
                         "mu" = 1,
                         "K" = 25,
                         "gamma" = 0.01,
                         "lambda_a" = 1,
                         "loglik" = -90,
                         "df" = 5,
                         "conv" = 0)
  sim_pars <- extract_param_set(
    param_space_name = "oceanic_ontogeny",
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
  expect_equal(oceanic_ml$lambda_c, 1.2846940947105174)
  expect_equal(oceanic_ml$mu, 0.13425989399324822)
  expect_equal(oceanic_ml$K, 2.9999999165575932)
  expect_equal(oceanic_ml$gamma, 0.0047007285643230262)
  expect_equal(oceanic_ml$lambda_a, 1.2552841004635791)
  expect_equal(oceanic_ml$loglik, -84.183754382519453)
  expect_equal(oceanic_ml$df, 5)
  expect_equal(oceanic_ml$conv, 0)
})

test_that("test calc_ml output is correct for failed convergence", {
  skip("Optimize test - find non converging model")
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
    param_set = 233)
  novel_sim <- run_novel_sim(
    param_space_name = "oceanic_sea_level",
    sim_pars = sim_pars)
  k_approx <- calc_max_spec(novel_sim) + 1

  novel_ml <- calc_ml(
    sim = novel_sim,
    initial_parameters = c(0.05, 0.05, k_approx, 0.0001, 0.05)
  )
  expect_length(novel_ml, 1)
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
  expect_equal(novel_ml$lambda_c, 0.32018480744588085)
  expect_equal(novel_ml$mu, 1.4572032225410611e-07)
  expect_equal(novel_ml$K, 9.0883090995187708)
  expect_equal(novel_ml$gamma, 0.0044089899647070229)
  expect_equal(novel_ml$lambda_a, 0.070948089826698965)
  expect_equal(novel_ml$loglik, -197.84665262460129)
  expect_equal(novel_ml$df, 5)
  expect_equal(novel_ml$conv, 0)
})

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
  expect_equal(novel_ml$lambda_c, 0.3418425800515894)
  expect_equal(novel_ml$mu, 1.965277364551003)
  expect_equal(novel_ml$K, 1.999971298972272)
  expect_equal(novel_ml$gamma, 0.0165249284420719)
  expect_equal(novel_ml$lambda_a, 7.375306980969516e-07)
  expect_equal(novel_ml$loglik, -56.85735727503469)
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
  expect_equal(oceanic_ml$lambda_c, 1.297517093551871)
  expect_equal(oceanic_ml$mu, 0.1450440663503512)
  expect_equal(oceanic_ml$K, 2.99996649349435)
  expect_equal(oceanic_ml$gamma, 0.004755808458149999)
  expect_equal(oceanic_ml$lambda_a, 1.241286722152676)
  expect_equal(oceanic_ml$loglik, -84.17024952136853)
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
  expect_equal(novel_ml$lambda_c, 0.1747376474713921)
  expect_equal(novel_ml$mu, 0.0746774736985277)
  expect_equal(novel_ml$K, 234692.0757436767)
  expect_equal(novel_ml$gamma, 0.007694551908237508)
  expect_equal(novel_ml$lambda_a, 0.0889807891493178)
  expect_equal(novel_ml$loglik, -252.4632225702918)
  expect_equal(novel_ml$df, 5)
  expect_equal(novel_ml$conv, 0)
})

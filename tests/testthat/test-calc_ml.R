test_that("test calc_ml output is correct with geodynamic sim", {
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
    param_set = 3)
  novel_sim <- run_novel_sim(
    param_space_name = "continental_cs",
    sim_pars = sim_pars)

  max_spec_number <- calc_max_spec(novel_sim)
  k_approx <- max_spec_number + 1
  initial_parameters <- c(0.05, 0.05, k_approx, 0.0001, 0.05)

  novel_ml <- calc_ml(
    sim = novel_sim,
    initial_parameters = initial_parameters)
  expect_length(novel_ml, 8)
  expect_equal(novel_ml$lambda_c, 0.24486882847)
  expect_equal(novel_ml$mu, 0.458739789182)
  expect_equal(novel_ml$K, 3.00010954709)
  expect_equal(novel_ml$gamma, 0.012887090546)
  expect_equal(novel_ml$lambda_a, 0.414959006126)
  expect_equal(novel_ml$loglik, -129.157412968)
  expect_equal(novel_ml$df, 5)
  expect_equal(novel_ml$conv, 0)
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

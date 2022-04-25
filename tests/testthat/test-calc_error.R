test_that("test calc_error output is correct", {
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
    sim_pars = sim_pars
  )
  novel_ml <- data.frame("lambda_c" = 0.5,
                         "mu" = 0.5,
                         "K" = 20,
                         "gamma" = 0.01,
                         "lambda_a" = 0.5,
                         "loglik" = -125.5,
                         "df" = 5,
                         "conv" = 0)
  oceanic_sim <- run_oceanic_sim(
    ml = novel_ml,
    sim_pars = sim_pars)
  error <- calc_error(
    sim_1 = novel_sim,
    sim_2 = oceanic_sim,
    sim_pars = sim_pars,
    replicates = 2,
    distance_method = "abs"
  )
  expect_length(error, 5)
  expect_equal(error, list(spec_nltt_error = 14.7790182365,
                           num_spec_error = 4,
                           num_col_error = 7,
                           endemic_nltt_error = 14.154769913,
                           nonendemic_nltt_error = 6.201976856))
})

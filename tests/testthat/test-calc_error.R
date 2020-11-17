context("calc_error")

test_that("test calc_error output is correct", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
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
    novel_sim <- novel_sim(
      param_space_name = "nonoceanic",
      sim_pars = sim_pars,
      replicates = 2)
    novel_ml <- data.frame("lambda_c" = 0.5,
                                "mu" = 0.5,
                                "K" = 20,
                                "gamma" = 0.01,
                                "lambda_a" = 0.5,
                                "loglik" = -125.5,
                                "df" = 5,
                                "conv" = 0)
    oceanic_sim <- oceanic_sim(
      ml = novel_ml,
      sim_pars = sim_pars)
    error <- calc_error(
      sim_1 = novel_sim,
      sim_2 = oceanic_sim,
      replicates = 2,
      distance_method = "abs"
    )
    expect_length(error, 3)
    expect_equal(error$spec_error, list(nltt = c(27.6793419737,
                                                 13.6710711632),
                                        num_spec_error = c(7, 5),
                                        num_col_error = c(5, 8)))
    expect_equal(error$endemic_error, list(nltt = c(29.52636388708,
                                                    9.8948020034518116)))
    expect_equal(error$nonendemic_error, list(nltt = c(5.4603507213591591,
                                                       12.00627796269)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_error output is correct when failed convergence", {
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
    param_set = 244)
  novel_sim <- run_novel_sim(
    param_space_name = "nonoceanic",
    sim_pars = sim_pars,
    replicates = 1)
  # Mimic a failed ML run
  novel_ml <- list("ML didn't converge")
  novel_ml <- list(novel_ml)
  oceanic_sim <- oceanic_sim(
    ml = novel_ml[[1]],
    sim_pars = sim_pars)
  error <- calc_error(
    sim_1 = novel_sim,
    sim_2 = oceanic_sim,
    replicates = 2,
    distance_method = "abs"
  )
  expect_length(error, 3)
  expect_equal(error$spec_error, list("ML didn't converge"))
  expect_equal(error$endemic_error, list("ML didn't converge"))
  expect_equal(error$nonendemic_error, list("ML didn't converge"))
})

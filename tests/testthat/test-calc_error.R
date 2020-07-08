context("calc_error")

test_that("test calc_error output is correct", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "oceanic_ontogeny")
    set.seed(1)
    sim_pars <- extract_param_set(
      param_space_name = "oceanic_ontogeny",
      param_space = param_space,
      param_set = 1)
    novel_sim <- run_novel_sim(
      param_space_name = "oceanic_ontogeny",
      sim_pars = sim_pars,
      replicates = 2)
    #ML output from oceanic_ontogeny param_set 1 with seed 1
    novel_ml <- list(data.frame("lambda_c" = 4.93245551463291e-08,
                                     "mu" = 0.2079398955033904,
                                     "K" = 1.096019787831134,
                                     "gamma" = 0.03235948962897911,
                                     "lambda_a" = 1.333597017889932,
                                     "loglik" = -328.671086110396,
                                     "df" = 5,
                                     "conv" = 0),
                          data.frame("lambda_c" = 1.255363296522673e-08,
                                     "mu" = 0.03845159846645289,
                                     "K" = 3.297396105095508,
                                     "gamma" = 0.0242967074651809,
                                     "lambda_a" = 0.7106141463253953,
                                     "loglik" = -315.3743622623609,
                                     "df" = 5,
                                     "conv" = 0))
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
    expect_equal(error$spec_error, list(nltt = c(7.753141634762742,
                                                 11.973944813421863),
                                        num_spec_error = c(6, 3),
                                        num_col_error = c(8, 4)))
    expect_equal(error$endemic_error, list(nltt = c(43.55934832128516,
                                                    22.14770440482302)))
    expect_equal(error$nonendemic_error, list(nltt = c(46.02495065811670,
                                                       31.50089644626357)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_error output is correct when failed convergence", {
    param_space <- load_param_space(
      param_space_name = "nonoceanic")
    set.seed(1)
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

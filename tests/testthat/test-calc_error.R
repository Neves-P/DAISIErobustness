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
      param_set = 3)
    geodynamic_sim <- geodynamic_sim(
      param_space_name = "oceanic_ontogeny",
      sim_pars = sim_pars,
      replicates = 2)
    #ML output from oceanic_ontogeny param_set 3 with seed 1
    geodynamic_ml <- list(data.frame("lambda_c" = 0.9965513396220788,
                                     "mu" = 1.421971833699215,
                                     "K" = 1.718033933878904,
                                     "gamma" = 0.03297340595202831,
                                     "lambda_a" = 0.9244608637322876,
                                     "loglik" = -197.9613141825565,
                                     "df" = 5,
                                     "conv" = 0),
                          data.frame("lambda_c" = 0.92703368284067,
                                     "mu" = 1.338416534733336,
                                     "K" = 1.962886606832068,
                                     "gamma" = 0.02981301608003862,
                                     "lambda_a" = 0.9685350438621138,
                                     "loglik" = -189.5739114064297,
                                     "df" = 5,
                                     "conv" = 0))
    oceanic_sim <- oceanic_sim(
      ml = geodynamic_ml,
      sim_pars = sim_pars)
    error <- calc_error(
      sim_1 = geodynamic_sim,
      sim_2 = oceanic_sim,
      replicates = 2)
    expect_length(error, 3)
    expect_equal(error$spec_error, list(nltt = c(20.010779966924382,
                                                 9.851962524250929),
                                        num_spec_error = c(24, 10),
                                        num_col_error = c(8, 3)))
    expect_equal(error$endemic_error, list(nltt = c(16.47521332476096,
                                                    13.96234899101979)))
    expect_equal(error$nonendemic_error, list(nltt = c(13.41481594816277,
                                                       12.82164223774583)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

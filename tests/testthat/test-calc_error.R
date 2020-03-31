context("calc_error")

test_that("test calc_error output is correct", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "oceanic_ontogeny")
    set.seed(1)
    sim_pars <- extract_param_set(
      param_space_name = "oceanic_ontogeny",
      param_space = param_space,
      param_set = 1)
    geodynamic_sim <- geodynamic_sim(
      param_space_name = "oceanic_ontogeny",
      sim_pars = sim_pars,
      replicates = 2)
    #ML output from oceanic_ontogeny param_set 1 with seed 1
    geodynamic_ml <- list(data.frame("lambda_c" = 0.4754120842702097,
                                     "mu" = 0.76749608831824,
                                     "K" = 1.298834687112594,
                                     "gamma" = 0.02230623257987434,
                                     "lambda_a" = 2.063223214695227,
                                     "loglik" = -186.3109555871224,
                                     "df" = 5,
                                     "conv" = 0),
                          data.frame("lambda_c" = 0.6157465349398199,
                                     "mu" = 0.2567943041812767,
                                     "K" = 2.45525335464161,
                                     "gamma" = 0.01113093869588465,
                                     "lambda_a" = 2.491005394592663,
                                     "loglik" = -169.9210307807769,
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
    expect_equal(error$spec_error, list(nltt = c(49.36892632017155,
                                                 43.61883001698205),
                                        num_spec_error = c(16, 21),
                                        num_col_error = c(5, 6)))
    expect_equal(error$endemic_error, list(nltt = c(39.85151281102291,
                                                    34.58375482442248)))
    expect_equal(error$nonendemic_error, list(nltt = c(11.39455312282962,
                                                       10.29907794886148)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

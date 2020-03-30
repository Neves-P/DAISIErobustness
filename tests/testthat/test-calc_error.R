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
    geodynamic_ml <- list(data.frame("lambda_c" = 0.8103552574735821,
                                     "mu" = 1.179019557448184,
                                     "K" = 4.559325213387417,
                                     "gamma" = 0.02097601972567751,
                                     "lambda_a" = 3.99800806541315,
                                     "loglik" = -146.3844020863663,
                                     "df" = 5,
                                     "conv" = 0),
                          data.frame("lambda_c" = 0.4399176911095075,
                                     "mu" = 0.4712997803199506,
                                     "K" = 1.97450466718444,
                                     "gamma" = 0.01142852060684342,
                                     "lambda_a" = 1.431368454641673,
                                     "loglik" = -136.1543920281646,
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
    expect_equal(error$spec_error, list(nltt = c(20.64989423908643,
                                                 33.61461217135396),
                                        num_spec_error = c(10, 8),
                                        num_col_error = c(4, 2)))
    expect_equal(error$endemic_error, list(nltt = c(17.80586673487224,
                                                    29.83439114305704)))
    expect_equal(error$nonendemic_error, list(nltt = c(4.899971759043112,
                                                       5.003022756232539)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

context("calc_ml")

test_that("test calc_ml output is correct with geodynamic sim", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
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
    geodynamic_ml <- calc_ml(
      sim = geodynamic_sim)
    expect_length(geodynamic_ml, 2)
    expect_equal(geodynamic_ml[[1]]$lambda_c, 0.9965513396220788,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[1]]$mu, 1.421971833699215,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[1]]$K, 1.718033933878904,
                 tolerance = 0.5)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.03297340595202831,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 0.9244608637322876,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[1]]$loglik, -197.9613141825565,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[1]]$df, 5)
    expect_equal(geodynamic_ml[[1]]$conv, 0)
    expect_equal(geodynamic_ml[[2]]$lambda_c, 0.92703368284067,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[2]]$mu, 1.338416534733336,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[2]]$K, 1.962886606832068,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.02981301608003862,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 0.9685350438621138,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[2]]$loglik, -189.5739114064297,
                 tolerance = 0.001)
    expect_equal(geodynamic_ml[[2]]$df, 5)
    expect_equal(geodynamic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("test calc_ml output is correct with oceanic sim", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    param_space <- load_param_space(
      param_space_name = "oceanic_ontogeny")
    geodynamic_ml <- list(data.frame("lambda_c" = 1,
                                     "mu" = 1,
                                     "K" = 25,
                                     "gamma" = 0.01,
                                     "lambda_a" = 1,
                                     "loglik" = -90,
                                     "df" = 5,
                                     "conv" = 0),
                          data.frame("lambda_c" = 1,
                                     "mu" = 1,
                                     "K" = 25,
                                     "gamma" = 0.01,
                                     "lambda_a" = 1,
                                     "loglik" = -90,
                                     "df" = 5,
                                     "conv" = 0))
    sim_pars <- extract_param_set(
      param_space_name = "oceanic_ontogeny",
      param_space = param_space,
      param_set = 1)
    set.seed(1)
    oceanic_sim_1 <- oceanic_sim(
      ml = geodynamic_ml,
      sim_pars = sim_pars)
    oceanic_ml <- calc_ml(
      sim = oceanic_sim_1)
    expect_length(oceanic_ml, 2)
    expect_equal(oceanic_ml[[1]]$lambda_c, 0.4703865020955945,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[1]]$mu, 0.3024123467825012,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[1]]$K, 0.9604172665676682,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[1]]$gamma, 0.005654402886347983,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[1]]$lambda_a, 1.256814199481393,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[1]]$loglik, -86.44387709521121,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[1]]$df, 5)
    expect_equal(oceanic_ml[[1]]$conv, 0)
    expect_equal(oceanic_ml[[2]]$lambda_c, 1.266996227093286,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[2]]$mu, 1.360311534579718,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[2]]$K, 4.29713623613709,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[2]]$gamma, 0.01871138624408656,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[2]]$lambda_a, 7.741644634429056e-08,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[2]]$loglik, -139.8897801706968,
                 tolerance = 0.001)
    expect_equal(oceanic_ml[[2]]$df, 5)
    expect_equal(oceanic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("test calc_ml output is correct for failed convergence", {
  skip("Optimize test")
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    param_space <- load_param_space(
      param_space_name = "oceanic_sea_level")
    set.seed(1)
    sim_pars <- extract_param_set(
      param_space_name = "oceanic_sea_level",
      param_space = param_space,
      param_set = 233)
    geodynamic_sim <- geodynamic_sim(
      param_space_name = "oceanic_sea_level",
      sim_pars = sim_pars,
      replicates = 2)
    sim_constraints <- sim_constraints(
      sim = geodynamic_sim,
      replicates = 2)
    geodynamic_ml <- calc_ml(
      sim = geodynamic_sim)
    expect_length(geodynamic_ml, 2)
    expect_equal(geodynamic_ml[[1]], "ML didn't converge")
  } else {
    skip("Run only on TRAVIS")
  }
})

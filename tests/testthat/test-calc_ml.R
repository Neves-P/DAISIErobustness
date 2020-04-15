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
    expect_equal(geodynamic_ml[[1]]$lambda_c, 3.4219518194255522e-08,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$mu, 0.41174619646485294,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$K, 2.0433005164217035,
                 tolerance = 0.5)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.029142960216055905,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 1.339982351717566,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$loglik, -249.53023401957046,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$df, 5)
    expect_equal(geodynamic_ml[[1]]$conv, 0)
    expect_equal(geodynamic_ml[[2]]$lambda_c, 2.474842185700226e-09,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$mu, 0.50966502672623082,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$K, 0.59915195278159772,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.041335113620582127,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 1.0498594957692096,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$loglik, -316.08747874022492,
                 tolerance = 0.01)
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
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$mu, 0.3024123467825012,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$K, 1.4865288098676843,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$gamma, 0.005654402886347983,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$lambda_a, 1.256814199481393,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$loglik, -86.44387709521121,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$df, 5)
    expect_equal(oceanic_ml[[1]]$conv, 0)
    expect_equal(oceanic_ml[[2]]$lambda_c, 1.266996227093286,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$mu, 1.360311534579718,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$K, 4.3913081864849595,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$gamma, 0.01871138624408656,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$lambda_a, 7.741644634429056e-08,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$loglik, -139.8897801706968,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$df, 5)
    expect_equal(oceanic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("test calc_ml output is correct for failed convergence", {
  skip("Optimize test - find non converging model")
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

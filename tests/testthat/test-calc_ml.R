context("calc_ml")

test_that("test calc_ml output is correct for oceanic_ontogeny that
          meet constraints", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "oceanic_ontogeny")
    set.seed(1)
    simulation_pars <- extract_param_set(
      param_space_name = "oceanic_ontogeny",
      param_space = param_space,
      param_set = 2)
    geodynamic_simulations <- geodynamic_simulations(
      param_space_name = "oceanic_ontogeny",
      simulation_pars = simulation_pars,
      replicates = 2,
      verbose = FALSE)
    geodynamic_ml <- calc_ml(
      simulations = geodynamic_simulations,
      verbose = FALSE)
    expect_length(geodynamic_ml, 2)
    expect_equal(geodynamic_ml[[1]]$lambda_c, 0.7408068959667875,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$mu, 8.065703243093204e-06,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$K, 3.921506604000109,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.00431446351327052,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 2.09840132716742,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$loglik, -95.185418771964,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$df, 5)
    expect_equal(geodynamic_ml[[1]]$conv, 0)
    expect_equal(geodynamic_ml[[2]]$lambda_c, 1.06329380388064,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$mu, 0.7931747920331884,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$K, 2.952451938556902,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.0113674045407624,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 1.054600748059755,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$loglik, -134.5787898739167,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$df, 5)
    expect_equal(geodynamic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_ml output is correct for oceanic_sea_level that
          meet constraints", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "oceanic_sea_level")
    set.seed(1)
    simulation_pars <- extract_param_set(
      param_space_name = "oceanic_sea_level",
      param_space = param_space,
      param_set = 3)
    geodynamic_simulations <- geodynamic_simulations(
      param_space_name = "oceanic_sea_level",
      simulation_pars = simulation_pars,
      replicates = 2,
      verbose = FALSE)
    geodynamic_ml <- calc_ml(
      simulations = geodynamic_simulations,
      verbose = FALSE)
    expect_length(geodynamic_ml, 2)
    expect_equal(geodynamic_ml[[1]]$lambda_c, 2.972072521259935,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$mu, 4.188164725810913,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$K, 15.66965274921225,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.01729470933664255,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 2.351515310470439e-07,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$loglik, -47.69166930027427,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$df, 5)
    expect_equal(geodynamic_ml[[1]]$conv, 0)
    expect_equal(geodynamic_ml[[2]]$lambda_c, 2.836741297420238,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$mu, 2.770627161721033,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$K, 30.88669608579816,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.01429103672065733,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 7.11012890239877,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$loglik, -86.0987646284259,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$df, 5)
    expect_equal(geodynamic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_ml output is correct for oceanic_ontogeny_sea_level
          that meets constraints", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "oceanic_ontogeny_sea_level")
    set.seed(1)
    simulation_pars <- extract_param_set(
      param_space_name = "oceanic_ontogeny_sea_level",
      param_space = param_space,
      param_set = 27)
    geodynamic_simulations <- geodynamic_simulations(
      param_space_name = "oceanic_ontogeny_sea_level",
      simulation_pars = simulation_pars,
      replicates = 2,
      verbose = FALSE)
    geodynamic_ml <- calc_ml(
      simulations = geodynamic_simulations,
      verbose = FALSE)
    expect_length(geodynamic_ml, 2)
    expect_equal(geodynamic_ml[[1]]$lambda_c, 2.198941712892927,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$mu, 1.712274429316733,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$K, 5.751168968796951,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.007058001353378364,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 0.05526635050605113,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$loglik, -66.50132153428572,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$df, 5)
    expect_equal(geodynamic_ml[[1]]$conv, 0)
    expect_equal(geodynamic_ml[[2]]$lambda_c, 2.381815467187852,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$mu, 1.046013027125299,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$K, 2.834566690606739,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.004800398484349702,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 2.407565440033816,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$loglik, -75.74986294679776,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$df, 5)
    expect_equal(geodynamic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_ml output is correct for nonoceanic that meets
          constraints", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "nonoceanic")
    set.seed(1)
    simulation_pars <- extract_param_set(
      param_space_name = "nonoceanic",
      param_space = param_space,
      param_set = 1)
    geodynamic_simulations <- geodynamic_simulations(
      param_space_name = "nonoceanic",
      simulation_pars = simulation_pars,
      replicates = 2,
      verbose = FALSE)
    geodynamic_ml <- calc_ml(
      simulations = geodynamic_simulations,
      verbose = FALSE)
  expect_length(geodynamic_ml, 2)
  expect_equal(geodynamic_ml[[1]]$lambda_c, 0.30300300291092,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$mu, 4.964867330468602e-08,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$K, 1.625692371550108,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$gamma, 0.01254922020468433,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$lambda_a, 1.173556546810398,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$loglik, -229.8375999917219,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$df, 5)
  expect_equal(geodynamic_ml[[1]]$conv, 0)
  expect_equal(geodynamic_ml[[2]]$lambda_c, 0.2989753342789382,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$mu, 1.724254516799549e-09,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$K, 3.569023895535222,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$gamma, 0.01411821591582622,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$lambda_a, 1.238056586235929,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$loglik, -260.4378133143198,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$df, 5)
  expect_equal(geodynamic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("test calc_ml output is correct for nonoceanic_sea_level that
          meets constraints", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "nonoceanic_sea_level")
    set.seed(1)
    simulation_pars <- extract_param_set(
      param_space_name = "nonoceanic_sea_level",
      param_space = param_space,
      param_set = 2)
    geodynamic_simulations <- geodynamic_simulations(
      param_space_name = "nonoceanic_sea_level",
      simulation_pars = simulation_pars,
      replicates = 2,
      verbose = FALSE)
    geodynamic_ml <- calc_ml(
      simulations = geodynamic_simulations,
      verbose = FALSE)
    expect_length(geodynamic_ml, 2)
    expect_equal(geodynamic_ml[[1]]$lambda_c, 1.732894138690761,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$mu, 1.519851052914035,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$K, 3.830052882150426,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.01620148380267938,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 5.525981166292832e-07,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$loglik, -139.2516694128911,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$df, 5)
    expect_equal(geodynamic_ml[[1]]$conv, 0)
    expect_equal(geodynamic_ml[[2]]$lambda_c, 0.786858491805923,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$mu, 0.8038946792807485,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$K, 3.094000903328777,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.007245363385792234,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 0.6667461733647201,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$loglik, -80.13404339756168,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$df, 5)
    expect_equal(geodynamic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("test calc_ml output is correct for nonoceanic_land_bridge that
          meets constraints", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "nonoceanic_land_bridge")
    set.seed(1)
    simulation_pars <- extract_param_set(
      param_space_name = "nonoceanic_land_bridge",
      param_space = param_space,
      param_set = 4)
    geodynamic_simulations <- geodynamic_simulations(
      param_space_name = "nonoceanic_land_bridge",
      simulation_pars = simulation_pars,
      replicates = 2,
      verbose = FALSE)
    geodynamic_ml <- calc_ml(
      simulations = geodynamic_simulations,
      verbose = FALSE)
    expect_length(geodynamic_ml, 2)
    expect_equal(geodynamic_ml[[1]]$lambda_c, 0.1709980563594327,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$mu, 3.136383012029339e-10,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$K, 1.35227706430929,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.01375097503741722,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 1.91763605170363,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$loglik, -227.2531910113857,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$df, 5)
    expect_equal(geodynamic_ml[[1]]$conv, 0)
    expect_equal(geodynamic_ml[[2]]$lambda_c, 0.1255778271583814,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$mu, 5.62716792366903e-08,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$K, 2.170941483246983,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.009413358667484304,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 1.351966027733467,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$loglik, -170.8308435743587,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$df, 5)
    expect_equal(geodynamic_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS")
  }
})

test_that("test calc_ml output is correct for failed convergence", {
  skip("Need to fail convergence")
  simulation_pars <- "stub"
  geodynamic_simulations <- "stub"
  geodynamic_ml <- calc_ml(
      simulations = geodynamic_simulations,
      verbose = verbose)
  expect_length(geodynamic_ml, 2)
  expect_equal(geodynamic_ml[[1]], "No convergence")
  expect_equal(geodynamic_ml[[2]], "No convergence")
})

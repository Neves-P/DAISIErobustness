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
    expect_equal(geodynamic_ml[[1]]$lambda_c, 0.9516893216529831,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$mu, 0.4371724756929532,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$K, 26.45933105611771,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.005832693735317008,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 1.91311658602524,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$loglik, -93.6464134227662,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$df, 5)
    expect_equal(geodynamic_ml[[1]]$conv, 0)
    expect_equal(geodynamic_ml[[2]]$lambda_c, 1.17346081209476,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$mu, 0.9780652536369839,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$K, 1.798109468901113,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.01258190594811776,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 0.8917175650839453,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$loglik, -133.3346436904723,
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
    expect_equal(geodynamic_ml[[2]]$lambda_c, 3.056890321142856,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$mu, 3.041705911125052,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$K, 6.44774902382832,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.01534606797314414,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 6.88566769598733,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$loglik, -84.99771234359366,
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
    expect_equal(geodynamic_ml[[1]]$lambda_c, 1.966041408219724,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$mu, 1.477271249292301,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$K, 11.52960672065235,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.006571062319056279,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 0.3773529354438802,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$loglik, -69.36231376286956,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$df, 5)
    expect_equal(geodynamic_ml[[1]]$conv, 0)
    expect_equal(geodynamic_ml[[2]]$lambda_c, 2.14918107310318,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$mu, 1.03741820400687,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$K, 3.130324308163246,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.004961625821861754,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 2.479993996397024,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$loglik, -83.89207336884942,
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
  expect_equal(geodynamic_ml[[1]]$lambda_c, 0.3046796298398503,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$mu, 2.478742324453904e-07,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$K, 6.208633062634737,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$gamma, 0.01254772160543027,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$lambda_a, 1.173611857782068,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$loglik, -229.7054580820761,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[1]]$df, 5)
  expect_equal(geodynamic_ml[[1]]$conv, 0)
  expect_equal(geodynamic_ml[[2]]$lambda_c, 0.3021716755500783,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$mu, 1.204652295451645e-13,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$K, 11.43734759081412,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$gamma, 0.01411701470946118,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$lambda_a, 1.237721898963076,
               tolerance = 0.01)
  expect_equal(geodynamic_ml[[2]]$loglik, -260.140463184815,
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
    expect_equal(geodynamic_ml[[1]]$lambda_c, 1.704278341160928,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$mu, 1.514106760135826,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$K, 10.85585442336849,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.01627502023082438,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 7.340837158630392e-07,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$loglik, -141.4874129044304,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$df, 5)
    expect_equal(geodynamic_ml[[1]]$conv, 0)
    expect_equal(geodynamic_ml[[2]]$lambda_c, 0.7102512814667641,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$mu, 0.6716103545981235,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$K, 4.261832482683926,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$gamma, 0.006664007547460572,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$lambda_a, 0.7575016621005239,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[2]]$loglik, -80.91808017248952,
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
    expect_equal(geodynamic_ml[[1]]$lambda_c, 0.1694990702779443,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$mu, 1.106177901845797e-09,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$K, 3.063611421428375,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$gamma, 0.013722867822101,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$lambda_a, 1.917378209393626,
                 tolerance = 0.01)
    expect_equal(geodynamic_ml[[1]]$loglik, -227.3587089151978,
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

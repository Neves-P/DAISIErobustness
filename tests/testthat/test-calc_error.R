context("calc_error")

test_that("test calc_error output is correct for oceanic_ontogeny", {
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
    #ML output from oceanic_ontogeny param_set 2 with seed 1
    geodynamic_ml <- list()
    geodynamic_ml[[1]] <- data.frame("lambda_c" = 0.9516893216529831,
                                     "mu" = 0.4371724756929532,
                                     "K" = 26.45933105611771,
                                     "gamma" = 0.005832693735317008,
                                     "lambda_a" = 1.91311658602524,
                                     "loglik" = -93.6464134227662,
                                     "df" = 5,
                                     "conv" = 0)
    geodynamic_ml[[2]] <- data.frame("lambda_c" = 1.17346081209476,
                                     "mu" = 0.9780652536369839,
                                     "K" = 1.798109468901113,
                                     "gamma" = 0.01258190594811776,
                                     "lambda_a" = 0.8917175650839453,
                                     "loglik" = -133.3346436904723,
                                     "df" = 5,
                                     "conv" = 0)
    oceanic_simulations <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = FALSE)
    error <- calc_error(
        simulation_pars = simulation_pars,
        simulations_1 = geodynamic_simulations,
        simulations_2 = oceanic_simulations,
        replicates = 2)
    expect_length(error, 3)
    expect_equal(error$species_error, list(nltt = c(3.466459645659721,
                                                    16.779762104341131),
                                           num_spec_error = c(6, 18),
                                           num_colonists_error = c(1, 2)))
    expect_equal(error$endemic_error, list(nltt = c(4.105857769709307,
                                                    9.843170592071166)))
    expect_equal(error$nonendemic_error, list(nltt = c(12.19399299074907,
                                                       20.13397293941591)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_error output is correct for oceanic_sea_level", {
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
    #ML output from oceanic_sea_level param_set 3 with seed 1
    geodynamic_ml <- list()
    geodynamic_ml[[1]] <- data.frame("lambda_c" = 2.972072521259935,
                                     "mu" = 4.188164725810913,
                                     "K" = 15.66965274921225,
                                     "gamma" = 0.01729470933664255,
                                     "lambda_a" = 2.351515310470439e-07,
                                     "loglik" = -47.69166930027427,
                                     "df" = 5,
                                     "conv" = 0)
    geodynamic_ml[[2]] <- data.frame("lambda_c" = 3.056890321142856,
                                     "mu" = 3.041705911125052,
                                     "K" = 6.44774902382832,
                                     "gamma" = 0.01534606797314414,
                                     "lambda_a" = 6.88566769598733,
                                     "loglik" = -84.99771234359366,
                                     "df" = 5,
                                     "conv" = 0)
    oceanic_simulations <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = FALSE)
    error <- calc_error(
      simulation_pars = simulation_pars,
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations,
      replicates = 2)
    expect_length(error, 3)
    expect_equal(error$species_error, list(nltt = c(12.51245689554037,
                                                    5.248395705769793),
                                           num_spec_error = c(0, 27),
                                           num_colonists_error = c(2, 3)))
    expect_equal(error$endemic_error, list(nltt = c(6.251267253365500,
                                                    2.302925917732638)))
    expect_equal(error$nonendemic_error, list(nltt = c(12.69555403808047,
                                                       21.94389485833001)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_error output is correct for oceanic_ontogeny_sea_level", {
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
    #ML output from oceanic_ontogeny_sea_level param_set 27 with seed 1
    geodynamic_ml <- list()
    geodynamic_ml[[1]] <- data.frame("lambda_c" = 1.966041408219724,
                                     "mu" = 1.477271249292301,
                                     "K" = 11.52960672065235,
                                     "gamma" = 0.006571062319056279,
                                     "lambda_a" = 0.3773529354438802,
                                     "loglik" = -69.36231376286956,
                                     "df" = 5,
                                     "conv" = 0)
    geodynamic_ml[[2]] <- data.frame("lambda_c" = 2.14918107310318,
                                     "mu" = 1.03741820400687,
                                     "K" = 3.130324308163246,
                                     "gamma" = 0.004961625821861754,
                                     "lambda_a" = 2.479993996397024,
                                     "loglik" = -83.89207336884942,
                                     "df" = 5,
                                     "conv" = 0)
    oceanic_simulations <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = FALSE)
    error <- calc_error(
      simulation_pars = simulation_pars,
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations,
      replicates = 2)
    expect_length(error, 3)
    expect_equal(error$species_error, list(nltt = c(10.388902607880278,
                                                    4.371228574431327),
                                           num_spec_error = c(14, 56),
                                           num_colonists_error = c(0, 2)))
    expect_equal(error$endemic_error, list(nltt = c(4.540215746684407,
                                                    2.927160988924299)))
    expect_equal(error$nonendemic_error, list(nltt = c(30.66732210323404,
                                                       94.52056249083593)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_error output is correct for nonoceanic", {
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
    #ML output from nonoceanic param_set 1 with seed 1
    geodynamic_ml <- list()
    geodynamic_ml[[1]] <- data.frame("lambda_c" = 0.3046796298398503,
                                     "mu" = 2.478742324453904e-07,
                                     "K" = 6.208633062634737,
                                     "gamma" = 0.01254772160543027,
                                     "lambda_a" = 1.173611857782068,
                                     "loglik" = -229.7054580820761,
                                     "df" = 5,
                                     "conv" = 0)
    geodynamic_ml[[2]] <- data.frame("lambda_c" = 0.3021716755500783,
                                     "mu" = 1.204652295451645e-13,
                                     "K" = 11.43734759081412,
                                     "gamma" = 0.01411701470946118,
                                     "lambda_a" = 1.237721898963076,
                                     "loglik" = -260.140463184815,
                                     "df" = 5,
                                     "conv" = 0)
    oceanic_simulations <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = FALSE)
    error <- calc_error(
      simulation_pars = simulation_pars,
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations,
      replicates = 2)
    expect_length(error, 3)
    expect_equal(error$species_error, list(nltt = c(49.27599612261292,
                                                    62.57651115290483),
                                           num_spec_error = c(0, 14),
                                           num_colonists_error = c(12, 2)))
    expect_equal(error$endemic_error, list(nltt = c(13.10567859898315,
                                                    13.43629271817640)))
    expect_equal(error$nonendemic_error, list(nltt = c(79.74617727328071,
                                                       109.64757319439911)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_error output is correct for nonoceanic_sea_level", {
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
    #ML output from nonoceanic_sea_level param_set 2 with seed 1
    geodynamic_ml <- list()
    geodynamic_ml[[1]] <- data.frame("lambda_c" = 1.704278341160928,
                                     "mu" = 1.514106760135826,
                                     "K" = 10.85585442336849,
                                     "gamma" = 0.01627502023082438,
                                     "lambda_a" = 7.340837158630392e-07,
                                     "loglik" = -141.4874129044304,
                                     "df" = 5,
                                     "conv" = 0)
    geodynamic_ml[[2]] <- data.frame("lambda_c" = 0.7102512814667641,
                                     "mu" = 0.6716103545981235,
                                     "K" = 4.261832482683926,
                                     "gamma" = 0.006664007547460572,
                                     "lambda_a" = 0.7575016621005239,
                                     "loglik" = -80.91808017248952,
                                     "df" = 5,
                                     "conv" = 0)
    oceanic_simulations <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = FALSE)
    error <- calc_error(
      simulation_pars = simulation_pars,
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations,
      replicates = 2)
    expect_length(error, 3)
    expect_equal(error$species_error, list(nltt = c(38.44269264489838,
                                                    29.07846559300534),
                                           num_spec_error = c(39, 3),
                                           num_colonists_error = c(10, 2)))
    expect_equal(error$endemic_error, list(nltt = c(6.015747501169292,
                                                    4.591280363703355)))
    expect_equal(error$nonendemic_error, list(nltt = c(99.45795613927066,
                                                       80.11462151304394)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

test_that("test calc_error output is correct for nonoceanic_land_bridge", {
  skip("code is currently undergoing repairs")
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
    #ML output from nonoceanic_land_bridge param_set 4 with seed 1
    geodynamic_ml <- list()
    geodynamic_ml[[1]] <- data.frame("lambda_c" = 0.1694990702779443,
                                     "mu" = 1.106177901845797e-09,
                                     "K" = 3.063611421428375,
                                     "gamma" = 0.013722867822101,
                                     "lambda_a" = 1.917378209393626,
                                     "loglik" = -227.3587089151978,
                                     "df" = 5,
                                     "conv" = 0)
    geodynamic_ml[[2]] <- data.frame("lambda_c" = 0.1255778271583814,
                                     "mu" = 5.62716792366903e-08,
                                     "K" = 2.170941483246983,
                                     "gamma" = 0.009413358667484304,
                                     "lambda_a" = 1.351966027733467,
                                     "loglik" = -170.8308435743587,
                                     "df" = 5,
                                     "conv" = 0)
    oceanic_simulations <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = FALSE)
    error <- calc_error(
      simulation_pars = simulation_pars,
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations,
      replicates = 2)
    expect_length(error, 3)
    expect_equal(error$species_error, list(nltt = c(0,
                                                    0),
                                           num_spec_error = c(0, 0),
                                           num_colonists_error = c(0, 0)))
    expect_equal(error$endemic_error, list(nltt = c(0,
                                                    0)))
    expect_equal(error$nonendemic_error, list(nltt = c(0,
                                                       0)))
  } else {
    skip("Run only on TRAVIS or AppVeyor")
  }
})

context("calc_error")

test_that("test calc_error output is correct for oceanic_ontogeny", {
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
  geodynamic_ml[[1]] <- data.frame("lambda_c" = 0.7408068959667875,
                                   "mu" = 8.065703243093204e-06,
                                   "K" = 3.921506604000109,
                                   "gamma" = 0.00431446351327052,
                                   "lambda_a" = 2.09840132716742,
                                   "loglik" = -95.185418771964,
                                   "df" = 5,
                                   "conv" = 0)
  geodynamic_ml[[2]] <- data.frame("lambda_c" = 1.06329380388064,
                                   "mu" = 0.7931747920331884,
                                   "K" = 2.952451938556902,
                                   "gamma" = 0.0113674045407624,
                                   "lambda_a" = 1.054600748059755,
                                   "loglik" = -134.5787898739167,
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
  expect_equal(error$species_error, list(nltt = c(3.141494866515948,
                                                  14.694628666366153),
                                         num_spec_error = c(8, 8),
                                         num_colonists_error = c(3, 5)))
  expect_equal(error$endemic_error, list(nltt = c(3.726658796032580,
                                                  7.487621911387501)))
  expect_equal(error$nonendemic_error, list(nltt = c(17.23732010178108,
                                                     14.28972737422861)))
})

test_that("test calc_error output is correct for oceanic_sea_level", {
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
  geodynamic_ml[[2]] <- data.frame("lambda_c" = 2.836741297420238,
                                   "mu" = 2.770627161721033,
                                   "K" = 30.88669608579816,
                                   "gamma" = 0.01429103672065733,
                                   "lambda_a" = 7.11012890239877,
                                   "loglik" = -86.0987646284259,
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
                                                  13.29494266017906),
                                         num_spec_error = c(0, 4),
                                         num_colonists_error = c(2, 5)))
  expect_equal(error$endemic_error, list(nltt = c(6.251267253365500,
                                                  3.222937345190041)))
  expect_equal(error$nonendemic_error, list(nltt = c(12.69555403808047,
                                                     16.56665519081412)))
})

test_that("test calc_error output is correct for oceanic_ontogeny_sea_level", {
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
  geodynamic_ml[[1]] <- data.frame("lambda_c" = 2.198941712892927,
                                   "mu" = 1.712274429316733,
                                   "K" = 5.751168968796951,
                                   "gamma" = 0.007058001353378364,
                                   "lambda_a" = 0.05526635050605113,
                                   "loglik" = -66.50132153428572,
                                   "df" = 5,
                                   "conv" = 0)
  geodynamic_ml[[2]] <- data.frame("lambda_c" = 2.381815467187852,
                                   "mu" = 1.046013027125299,
                                   "K" = 2.834566690606739,
                                   "gamma" = 0.004800398484349702,
                                   "lambda_a" = 2.407565440033816,
                                   "loglik" = -75.74986294679776,
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
  expect_equal(error$species_error, list(nltt = c(8.016755630413288,
                                                  3.826442146267494),
                                         num_spec_error = c(16, 56),
                                         num_colonists_error = c(0, 2)))
  expect_equal(error$endemic_error, list(nltt = c(4.823369621440063,
                                                  2.616596340881805)))
  expect_equal(error$nonendemic_error, list(nltt = c(29.88960922645806,
                                                     95.68731873541401)))
})

test_that("test calc_error output is correct for nonoceanic", {
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
  geodynamic_ml[[1]] <- data.frame("lambda_c" = 0.30300300291092,
                                   "mu" = 4.964867330468602e-08,
                                   "K" = 1.625692371550108,
                                   "gamma" = 0.01254922020468433,
                                   "lambda_a" = 1.173556546810398,
                                   "loglik" = -229.8375999917219,
                                   "df" = 5,
                                   "conv" = 0)
  geodynamic_ml[[2]] <- data.frame("lambda_c" = 0.2989753342789382,
                                   "mu" = 1.724254516799549e-09,
                                   "K" = 3.569023895535222,
                                   "gamma" = 0.01411821591582622,
                                   "lambda_a" = 1.238056586235929,
                                   "loglik" = -260.4378133143198,
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
  expect_equal(error$species_error, list(nltt = c(49.80634192731014,
                                                  62.55704626591506),
                                         num_spec_error = c(7, 22),
                                         num_colonists_error = c(11, 2)))
  expect_equal(error$endemic_error, list(nltt = c(13.38309566798700,
                                                  14.46004128715671)))
  expect_equal(error$nonendemic_error, list(nltt = c(88.67239914131849,
                                                     117.62432704194313)))
})

test_that("test calc_error output is correct for nonoceanic_sea_level", {
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
  geodynamic_ml[[1]] <- data.frame("lambda_c" = 1.732894138690761,
                                   "mu" = 1.519851052914035,
                                   "K" = 3.830052882150426,
                                   "gamma" = 0.01620148380267938,
                                   "lambda_a" = 5.525981166292832e-07,
                                   "loglik" = -139.2516694128911,
                                   "df" = 5,
                                   "conv" = 0)
  geodynamic_ml[[2]] <- data.frame("lambda_c" = 0.786858491805923,
                                   "mu" = 0.8038946792807485,
                                   "K" = 3.094000903328777,
                                   "gamma" = 0.007245363385792234,
                                   "lambda_a" = 0.6667461733647201,
                                   "loglik" = -80.13404339756168,
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
  expect_equal(error$species_error, list(nltt = c(40.07439269576058,
                                                  28.78168434200272),
                                         num_spec_error = c(43, 2),
                                         num_colonists_error = c(8, 3)))
  expect_equal(error$endemic_error, list(nltt = c(5.455512759786554,
                                                  5.625527894404391)))
  expect_equal(error$nonendemic_error, list(nltt = c(109.37123084523417,
                                                     84.21460775077388)))
})

test_that("test calc_error output is correct for nonoceanic_land_bridge", {
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
  geodynamic_ml[[1]] <- data.frame("lambda_c" = 0.1709980563594327,
                                   "mu" = 3.136383012029339e-10,
                                   "K" = 1.35227706430929,
                                   "gamma" = 0.01375097503741722,
                                   "lambda_a" = 1.91763605170363,
                                   "loglik" = -227.2531910113857,
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
})

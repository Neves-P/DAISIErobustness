context("oceanic_simulations")

test_that("test oceanic simulation output is correct for oceanic_ontogeny", {
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
  simulation_pars <- list(time = 2.55,
                          M = 1000)
  set.seed(1)
  oceanic_simulations <- oceanic_simulations(
    ml = geodynamic_ml,
    simulation_pars = simulation_pars)
  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]][[1]], 13)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$not_present, 988)
  expect_equal(nrow(oceanic_simulations[[1]][[1]][[1]]$stt_all), 35)
  expect_equal(ncol(oceanic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 2.15575062694003, 1.54615286277701))
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]][[1]], 21)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$not_present, 980)
  expect_equal(nrow(oceanic_simulations[[2]][[1]][[1]]$stt_all), 84)
  expect_equal(ncol(oceanic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.0134786754538898))
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$stac, 4)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$missing_species, 0)
})

test_that("test oceanic simulation output is correct for oceanic_sea_level", {
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
  simulation_pars <- list(time = 2.55,
                          M = 1000)
  set.seed(1)
  oceanic_simulations <- oceanic_simulations(
    ml = geodynamic_ml,
    simulation_pars = simulation_pars)
  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]][[1]], 8)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$not_present, 993)
  expect_equal(nrow(oceanic_simulations[[1]][[1]][[1]]$stt_all), 189)
  expect_equal(ncol(oceanic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.40181269865572))
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]][[1]], 15)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$not_present, 986)
  expect_equal(nrow(oceanic_simulations[[2]][[1]][[1]]$stt_all), 280)
  expect_equal(ncol(oceanic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.78744390949049, 0.44024694308660,
                 0.17569647081206, 0.17229469215485))
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$missing_species, 0)
})

test_that("test oceanic simulation output is correct for
          oceanic_ontogeny_sea_level", {
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
  simulation_pars <- list(time = 2.55,
                          M = 1000)
  set.seed(1)
  oceanic_simulations <- oceanic_simulations(
    ml = geodynamic_ml,
    simulation_pars = simulation_pars)
  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]][[1]], 5)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$not_present, 996)
  expect_equal(nrow(oceanic_simulations[[1]][[1]][[1]]$stt_all), 64)
  expect_equal(ncol(oceanic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.89428368320125))
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$stac, 4)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]][[1]], 5)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$not_present, 996)
  expect_equal(nrow(oceanic_simulations[[2]][[1]][[1]]$stt_all), 29)
  expect_equal(ncol(oceanic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 0.26306143521565, 0.10074372151992))
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$missing_species, 0)
})

test_that("test oceanic simulation output is correct for nonoceanic", {
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
  simulation_pars <- list(time = 2.55,
                          M = 1000)
  set.seed(1)
  oceanic_simulations <- oceanic_simulations(
    ml = geodynamic_ml,
    simulation_pars = simulation_pars)
  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]][[1]], 32)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$not_present, 969)
  expect_equal(nrow(oceanic_simulations[[1]][[1]][[1]]$stt_all), 57)
  expect_equal(ncol(oceanic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.93632100075768))
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]][[1]], 35)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$not_present, 966)
  expect_equal(nrow(oceanic_simulations[[2]][[1]][[1]]$stt_all), 62)
  expect_equal(ncol(oceanic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 1.93372265621858, 1.45725182831822))
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$missing_species, 0)
})

test_that("test oceanic simulation output is correct for
          nonoceanic_sea_level", {
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
  simulation_pars <- list(time = 2.55,
                          M = 1000)
  set.seed(1)
  oceanic_simulations <- oceanic_simulations(
    ml = geodynamic_ml,
    simulation_pars = simulation_pars)
  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]][[1]], 15)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$not_present, 986)
  expect_equal(nrow(oceanic_simulations[[1]][[1]][[1]]$stt_all), 106)
  expect_equal(ncol(oceanic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 0.25685972779409000, 0.00133040719212962))
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]][[1]], 9)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$not_present, 992)
  expect_equal(nrow(oceanic_simulations[[2]][[1]][[1]]$stt_all), 52)
  expect_equal(ncol(oceanic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 1.58885068212059, 0.14672784782254))
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$missing_species, 0)
})

test_that("test oceanic simulation output is correct for
          nonoceanic_land_bridge", {
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
  simulation_pars <- list(time = 2.55,
                          M = 1000)
  set.seed(1)
  oceanic_simulations <- oceanic_simulations(
    ml = geodynamic_ml,
    simulation_pars = simulation_pars)
  expect_length(oceanic_simulations, 2)
  expect_length(oceanic_simulations[[1]][[1]], 33)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[1]][[1]][[1]]$not_present, 968)
  expect_equal(nrow(oceanic_simulations[[1]][[1]][[1]]$stt_all), 63)
  expect_equal(ncol(oceanic_simulations[[1]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$branching_times,
               c(2.55, 1.0773471120365))
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[1]][[1]][[2]]$missing_species, 0)
  expect_length(oceanic_simulations[[2]][[1]], 26)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$island_age, 2.55)
  expect_equal(oceanic_simulations[[2]][[1]][[1]]$not_present, 975)
  expect_equal(nrow(oceanic_simulations[[2]][[1]][[1]]$stt_all), 43)
  expect_equal(ncol(oceanic_simulations[[2]][[1]][[1]]$stt_all), 5)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$branching_times,
               c(2.55, 1.62570327330753, 1.13630767529890))
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$stac, 2)
  expect_equal(oceanic_simulations[[2]][[1]][[2]]$missing_species, 0)
})

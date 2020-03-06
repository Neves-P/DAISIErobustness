context("calc_error")

test_that("test calc_error output is correct for oceanic_ontogeny", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "oceanic_ontogeny")
    set.seed(1)
    simulation_pars <- extract_param_set(
      param_space_name = "oceanic_ontogeny",
      param_space = param_space,
      param_set = 1)
    geodynamic_simulations <- geodynamic_simulations(
      param_space_name = "oceanic_ontogeny",
      simulation_pars = simulation_pars,
      replicates = 2,
      verbose = FALSE)
    #ML output from oceanic_ontogeny param_set 1
    geodynamic_ml <- list()
    geodynamic_ml[[1]] <- data.frame("lambda_c" = 0.4270512648004822,
                                     "mu" = 0.1928106725300651,
                                     "K" = 1.009117716659776,
                                     "gamma" = 0.004681193017565683,
                                     "lambda_a" = 2.260911182830638,
                                     "loglik" = -78.50919503883652,
                                     "df" = 5,
                                     "conv" = 0)
    geodynamic_ml[[2]] <- data.frame("lambda_c" = 0.7116563392201466,
                                     "mu" = 1.153914558890585,
                                     "K" = 1.570145195746095,
                                     "gamma" = 0.01642353253875526,
                                     "lambda_a" = 1.2997677018568698,
                                     "loglik" = -119.270335187471,
                                     "df" = 5,
                                     "conv" = 0)
    oceanic_simulations <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = FALSE)

    error <- calc_error(
      simulation_pars = simulation_pars,
      ml = geodynamic_ml,
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations,
      replicates = 2)

    expect_length(error, 3)
    expect_equal(error$species_error, list(nltt = c(9.6201978076527048,
                                                    11.8681059537795903),
                                           num_spec_error = c(6, 11),
                                           num_colonists_error = c(0, 3)))
    expect_equal(error$endemic_error, list(nltt = c(6.0288861180180069,
                                                    7.4256923326169852)))
    expect_equal(error$nonendemic_error, list(nltt = c(15.893208306508456,
                                                       16.963690931252941)))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
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
      param_set = 1154)
    geodynamic_simulations <- geodynamic_simulations(
      param_space_name = "oceanic_sea_level",
      simulation_pars = simulation_pars,
      replicates = 2,
      verbose = FALSE)
    geodynamic_ml <- list()
    geodynamic_ml[[1]] <- data.frame(
      "lambda_c" = 1.5455114896095883,
      "mu" = 1.6317067810700501,
      "K" = 0.23784861859530709,
      "gamma" = 0.009202018949106083,
      "lambda_a" = 4.4776912912874263,
      "loglik" = -72.860485316663642,
      "df" = 5,
      "conv" = 0
    )
    geodynamic_ml[[2]] <- data.frame(
      "lambda_c" = 1.6821726921196349,
      "mu" = 1.4603328048970061,
      "K" = 2.5647182859777526,
      "gamma" = 0.014087749006783336,
      "lambda_a" = 0.094273672655592208,
      "loglik" = -120.58622885658004,
      "df" = 5,
      "conv" = 0
    )
    oceanic_simulations_1 <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = FALSE)

    error <- calc_error(
      simulation_pars = simulation_pars,
      ml = geodynamic_ml,
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations_1,
      replicates = 2)

    expect_length(error, 3)
    expect_equal(error$species_error, list(nltt = c(6.5465252463180175,
                                                    10.9115923333007103),
                                           num_spec_error = c(12, 29),
                                           num_colonists_error = c(0, 3)))
    expect_equal(error$endemic_error, list(nltt = c(3.944406572184274,
                                                    11.569078610548672)))
    expect_equal(error$nonendemic_error, list(nltt = c(12.130134081568940,
                                                       27.741454755758554)))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

context("calc_error")

test_that("test calc_error outout is correct for oceanic_ontogeny", {
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
    geodynamic_ml[[1]] <- c(0.4270512648004822,
                            0.1928106725300651,
                            1.009117716659776,
                            0.004681193017565683,
                            2.260911182830638,
                            -78.50919503883652,
                            5,
                            0)
    names(geodynamic_ml[[1]]) <- c("lambda_c",
                                   "mu",
                                   "K",
                                   "gamma",
                                   "lambda_a",
                                   "loglik",
                                   "df",
                                   "conv")
    geodynamic_ml[[2]] <- c(0.7116563392201466,
                            1.153914558890585,
                            1.570145195746095,
                            0.01642353253875526,
                            1.2997677018568698,
                            -119.270335187471,
                            5,
                            0)
    names(geodynamic_ml[[2]]) <- c("lambda_c",
                                   "mu",
                                   "K",
                                   "gamma",
                                   "lambda_a",
                                   "loglik",
                                   "df",
                                   "conv")
    simulation_pars <- list(time = 2.55,
                            M = 1000)
    oceanic_simulations <- oceanic_simulations(
      ml = geodynamic_ml,
      simulation_pars = simulation_pars,
      verbose = FALSE)

    error <- calc_error(
      simulation_pars = simulation_pars,
      ml = geodynamic_ml,
      simulations_1 = geodynamic_simulations,
      simulations_2 = oceanic_simulations_1,
      replicates = 2)

  expect_length(error, 4)
  expect_equal(error$rates_error, list(clado_error = c(0.42695126480048223,
                                                       0.71155633922014661),
                                       ext_error = c(0.80718932746993488,
                                                     0.15391455889058459),
                                       K_error = c(1.0081177166597759,
                                                   1.5691451957460951),
                                       immig_error = c(0.0053188069824343168,
                                                       0.0064235325387552566),
                                       ana_error = c(1.26091118283063786,
                                                     0.29976770185686852)))
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

test_that("test calc_error outout is correct for oceanic_sea_level", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "oceanic_sea_level")
    set.seed(1)
    simulation_pars <- extract_param_set(
      param_space_name = "oceanic_sea_level",
      param_space = param_space,
      param_set = 1)
    geodynamic_simulations <- geodynamic_simulations(
      param_space_name = "oceanic_sea_level",
      simulation_pars = simulation_pars,
      replicates = 2,
      verbose = FALSE)
    geodynamic_ml <- calc_ml(
      param_space_name = "oceanic_sea_level",
      simulation_pars = simulation_pars,
      simulations = geodynamic_simulations)
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

    expect_length(error, 4)
    expect_equal(error$rates_error, list(clado_error = c(9.8620267746950765e-05,
                                                         9.8620267746950765e-05),
                                         ext_error = c(14097737014.174385,
                                                       14097737014.174385),
                                         K_error = c(3.3045397228414193,
                                                     3.3045397228414193),
                                         immig_error = c(0.0099995233687987205,
                                                         0.0099995233687987205),
                                         ana_error = c(0.92893720125400536,
                                                       0.92893720125400536)))
    expect_equal(error$species_error, list(nltt = c(0.66820829967438833,
                                                    1.04532662549206901),
                                           num_spec_error = c(0, 0),
                                           num_colonists_error = c(0, 0)))
    expect_equal(error$endemic_error, list(nltt = c(0.60478827751811282,
                                                    0.91848277342026852)))
    expect_equal(error$nonendemic_error, list(nltt = c(0.14184836435592674,
                                                       0.21611312090687318)))
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

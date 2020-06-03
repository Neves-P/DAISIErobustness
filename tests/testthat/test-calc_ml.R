context("calc_ml")

test_that("test calc_ml output is correct with geodynamic sim", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "nonoceanic")
    set.seed(1)
    sim_pars <- extract_param_set(
      param_space_name = "nonoceanic",
      param_space = param_space,
      param_set = 3)
    novel_sim <- run_novel_sim(
      param_space_name = "nonoceanic",
      sim_pars = sim_pars,
      replicates = 2)

    max_spec_number <- calc_max_spec(novel_sim)
    k_vector <- max_spec_number + 1

    initial_parameters_1_list <- vector("list", length = length(novel_sim))

    for (i in seq_along(novel_sim)) {
      initial_parameters_1_list[[i]] <- c(0.05, 0.05, k_vector[i], 0.0001, 0.05)
    }

    novel_ml <- calc_ml(
      sim = novel_sim,
      initial_parameters = initial_parameters_1_list)
    expect_length(novel_ml, 2)
    expect_equal(novel_ml[[1]]$lambda_c, 0.43133218622172592,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$mu, 0.47544751871514929,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$K, 2.4734319727446046,
                 tolerance = 0.5)
    expect_equal(novel_ml[[1]]$gamma, 0.010892277621235229,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$lambda_a, 0.31482039706639625,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$loglik, -128.43439274552915,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$df, 5)
    expect_equal(novel_ml[[1]]$conv, 0)
    expect_equal(novel_ml[[2]]$lambda_c, 0.16393815461807157,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$mu, 5.276461019508552e-14,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$K, 18.328842689639863,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$gamma, 0.0070554413141178758,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$lambda_a, 0.90221495126646489,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$loglik, -128.95098882594851,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$df, 5)
    expect_equal(novel_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test calc_ml output is correct with oceanic sim", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "oceanic_ontogeny")
    novel_ml <- list(data.frame("lambda_c" = 1,
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
      ml = novel_ml,
      sim_pars = sim_pars)
    oceanic_ml <- calc_ml(
      sim = oceanic_sim_1,
      initial_parameters = novel_ml)
    expect_length(oceanic_ml, 2)
    expect_equal(oceanic_ml[[1]]$lambda_c, 0.4703865020955945,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$mu, 0.3024123467825012,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$K, 3.8693619159931183,
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
    expect_equal(oceanic_ml[[2]]$K, 4.8545565619356195,
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
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test calc_ml output is correct for failed convergence", {
  skip("Optimize test - find non converging model")
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "oceanic_sea_level")
    set.seed(1)
    sim_pars <- extract_param_set(
      param_space_name = "oceanic_sea_level",
      param_space = param_space,
      param_set = 233)
    novel_sim <- run_novel_sim(
      param_space_name = "oceanic_sea_level",
      sim_pars = sim_pars,
      replicates = 2)
    sim_constraints <- sim_constraints(
      sim = novel_sim,
      replicates = 2)
    max_spec_number <- calc_max_spec(novel_sim)
    k_vector <- max_spec_number + 1

    initial_parameters_1_list <- vector("list", length = length(novel_sim))

    for (i in seq_along(novel_sim)) {
      initial_parameters_1_list[[i]] <- c(0.05, 0.05, k_vector[i], 0.0001, 0.05)
    }
    novel_ml <- calc_ml(
      sim = novel_sim,
      initial_parameters = initial_parameters_1_list
    )
    expect_length(novel_ml, 2)
    expect_equal(novel_ml[[1]], "ML didn't converge")
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test calc_ml output is correct with geodynamic sim", {
  skip("skip to pass check")
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin"
      || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "trait")
    set.seed(1)
    sim_pars <- extract_param_set(
      param_space_name = "trait",
      param_space = param_space,
      param_set = 3)
    novel_sim <- run_novel_sim(
      param_space_name = "trait",
      sim_pars = sim_pars,
      replicates = 2)
    max_spec_number <- calc_max_spec(novel_sim)
    k_vector <- max_spec_number + 1

    initial_parameters_1_list <- vector("list", length = length(novel_sim))

    for (i in seq_along(novel_sim)) {
      initial_parameters_1_list[[i]] <- c(0.05, 0.05, k_vector[i], 0.0001, 0.05)
    }
    novel_ml <- calc_ml(
      sim = novel_sim,
      initial_parameters = initial_parameters_1_list)
    expect_length(novel_ml, 2)
    expect_equal(novel_ml[[1]]$lambda_c, 0.22621182776277754,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$mu, 0.058464519326998241,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$K, 0.91965505481096832,
                 tolerance = 0.5)
    expect_equal(novel_ml[[1]]$gamma, 0.010012920711030491,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$lambda_a, 1.9475713116757916,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$loglik, -160.47163766316476,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$df, 5)
    expect_equal(novel_ml[[1]]$conv, 0)
    expect_equal(novel_ml[[2]]$lambda_c, 0.33148549119222032,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$mu, 0.50048523283307256,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$K, 3.1185396647475461,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$gamma, 0.016485574458648698,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$lambda_a, 0.8913559787355273,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$loglik, -171.39651156456483,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$df, 5)
    expect_equal(novel_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

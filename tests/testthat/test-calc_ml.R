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
    k_vector <- max_spec_number$max_spec_clade + 1

    initial_parameters_1_list <- vector("list", length = length(novel_sim))

    for (i in seq_along(novel_sim)) {
      initial_parameters_1_list[[i]] <- c(0.05, 0.05, k_vector[i], 0.0001, 0.05)
    }

    novel_ml <- calc_ml(
      sim = novel_sim,
      initial_parameters = initial_parameters_1_list)
    expect_length(novel_ml, 2)
    expect_equal(novel_ml[[1]]$lambda_c, 0.15978278356484077,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$mu, 1.970403739051638,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$K, 4.7720297221764669,
                 tolerance = 0.5)
    expect_equal(novel_ml[[1]]$gamma, 0.017148740281477039,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$lambda_a, 1.7722392012891294e-06,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$loglik, -57.047195109432728,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$df, 5)
    expect_equal(novel_ml[[1]]$conv, 0)
    expect_equal(novel_ml[[2]]$lambda_c, 0.18764257459852859,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$mu, 0.67315832908331541,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$K, 1.3962966088757534,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$gamma, 0.0069658226588260709,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$lambda_a, 0.4017258845888837,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$loglik, -65.65199950519667,
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
    k_vector <- max_spec_number$max_spec_clade + 1

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

test_that("test calc_ml output is correct with traits sim", {
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
    k_vector <- max_spec_number$max_spec_clade + 1

    initial_parameters_1_list <- vector("list", length = length(novel_sim))

    for (i in seq_along(novel_sim)) {
      initial_parameters_1_list[[i]] <- c(0.05, 0.05, k_vector[i], 0.0001, 0.05)
    }
    novel_ml <- calc_ml(
      sim = novel_sim,
      initial_parameters = initial_parameters_1_list)
    expect_length(novel_ml, 2)
    expect_equal(novel_ml[[1]]$lambda_c, 0.226250786648358,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$mu, 0.058709082356954,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$K, 4.78803754952229,
                 tolerance = 0.5)
    expect_equal(novel_ml[[1]]$gamma, 0.0100148510973837,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$lambda_a, 1.94726412724714,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$loglik, -160.47163766316476,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$df, 5)
    expect_equal(novel_ml[[1]]$conv, 0)
    expect_equal(novel_ml[[2]]$lambda_c, 0.33166353970785,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$mu, 0.501133057620236,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$K, 1.70795944253087,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$gamma, 0.0164947916716611,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$lambda_a, 0.891163442089483,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$loglik, -171.396512836204,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$df, 5)
    expect_equal(novel_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("test calc_ml output is correct when convergence fails", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin"
      || Sys.getenv("APPVEYOR") != "") {
    skip("WIP - Find failing convergence")
    load(system.file(
      "extdata",
      "inst/extdata/failed_sim_nonoceanic_244_rep_93.RData",
      package = "DAISIErobustness")
    )
    # DAISIErobustness has one extra list (replicate level) which must be
    # added here
    out <- list(out) # nolint

    k_approx <- calc_max_spec(out_1) # nolint
    max_spec_number <- calc_max_spec(out_1)
    k_vector_2 <- k_approx$num_island_spec

    initial_parameters_2_list <- list()
    initial_parameters_2_list[[1]] <- c(0.9, 1.5, k_vector_2 + 20, 0.01, 2)


    novel_ml <- calc_ml(
      sim = out_1,
      initial_parameters = initial_parameters_2_list
    )

  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

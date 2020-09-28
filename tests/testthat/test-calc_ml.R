context("calc_ml")

test_that("test calc_ml output is correct with geodynamic sim", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    param_space <- load_param_space(
      param_space_name = "nonoceanic")
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
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
    expect_equal(novel_ml[[1]]$lambda_c, 4.5993148115327323,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$mu, 1.970403739051638,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$K, 1.0387228526800298,
                 tolerance = 0.5)
    expect_equal(novel_ml[[1]]$gamma, 0.01729060119343398,
                 tolerance = 0.0001)
    expect_equal(novel_ml[[1]]$lambda_a, 2.8713080603994339e-07,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$loglik, -56.92533203744248,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$df, 5)
    expect_equal(novel_ml[[1]]$conv, 0)
    expect_equal(novel_ml[[2]]$lambda_c, 1888.8438278570065,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$mu, 0.73963678697110935,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$K, 1.0001507583214155,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$gamma, 0.0072877734096834807,
                 tolerance = 0.0001)
    expect_equal(novel_ml[[2]]$lambda_a, 0.31198121951530378,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$loglik, -65.37295887036116,
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
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
    oceanic_sim_1 <- oceanic_sim(
      ml = novel_ml,
      sim_pars = sim_pars)
    oceanic_ml <- calc_ml(
      sim = oceanic_sim_1,
      initial_parameters = novel_ml)
    expect_length(oceanic_ml, 2)
    expect_equal(oceanic_ml[[1]]$lambda_c, 1.2903465317959615,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$mu, 0.13861399056888973,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$K, 2.9999966186427014,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$gamma, 0.0047832452358128105,
                 tolerance = 0.0001)
    expect_equal(oceanic_ml[[1]]$lambda_a, 1.2515981969998924,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$loglik, -84.199536938878992,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$df, 5)
    expect_equal(oceanic_ml[[1]]$conv, 0)
    expect_equal(oceanic_ml[[2]]$lambda_c, 2.5333324741066412,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$mu, 1.1012915916638735,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$K, 5.000010221885212,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$gamma, 0.013950362038529816,
                 tolerance = 0.0001)
    expect_equal(oceanic_ml[[2]]$lambda_a, 4.361328419843256e-06,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$loglik, -137.5430474376393,
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
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
    sim_pars <- extract_param_set(
      param_space_name = "oceanic_sea_level",
      param_space = param_space,
      param_set = 233)
    novel_sim <- run_novel_sim(
      param_space_name = "oceanic_sea_level",
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
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
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
    expect_equal(novel_ml[[1]]$lambda_c, 1.2214586632927613,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$mu, 1.1515786807285155,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$K, 2.7188225144668534,
                 tolerance = 0.5)
    expect_equal(novel_ml[[1]]$gamma, 0.024921740504122835,
                 tolerance = 0.0001)
    expect_equal(novel_ml[[1]]$lambda_a, 2.6477272278805117e-07,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$loglik, -157.07466871225336,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$df, 5)
    expect_equal(novel_ml[[1]]$conv, 0)
    expect_equal(novel_ml[[2]]$lambda_c, 857.07123594094742,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$mu, 0.83677777310716506,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$K, 1.0004646779253812,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$gamma, 0.024494615867874377,
                 tolerance = 0.0001)
    expect_equal(novel_ml[[2]]$lambda_a, 0.58816002581759408,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$loglik, -175.97987104229043,
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

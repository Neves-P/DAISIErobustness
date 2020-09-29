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
    expect_equal(novel_ml[[1]]$lambda_c, 39.362193426797631,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$mu, 1.9717071098034797,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$K, 1.0043605918921454,
                 tolerance = 0.5)
    expect_equal(novel_ml[[1]]$gamma, 0.016565679786946477,
                 tolerance = 0.0001)
    expect_equal(novel_ml[[1]]$lambda_a, 1.1393837336264882e-07,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$loglik, -56.860582049322005,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$df, 5)
    expect_equal(novel_ml[[1]]$conv, 0)
    expect_equal(novel_ml[[2]]$lambda_c, 250.89059354462842,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$mu, 0.7400261920835185,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$K, 1.0011371431998193,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$gamma, 0.0069760510368443709,
                 tolerance = 0.0001)
    expect_equal(novel_ml[[2]]$lambda_a, 0.31055972134812626,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$loglik, -65.310648875502451,
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
    expect_equal(oceanic_ml[[1]]$lambda_c, 1.2846940947105174,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$mu, 0.13425989399324822,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$K, 2.9999999165575932,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$gamma, 0.0047007285643230262,
                 tolerance = 0.0001)
    expect_equal(oceanic_ml[[1]]$lambda_a, 1.2552841004635791,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$loglik, -84.183754382519453,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[1]]$df, 5)
    expect_equal(oceanic_ml[[1]]$conv, 0)
    expect_equal(oceanic_ml[[2]]$lambda_c, 2.5331327094458533,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$mu, 1.1012469475633466,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$K, 5.000010221885212,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$gamma, 0.013950362038529816,
                 tolerance = 0.0001)
    expect_equal(oceanic_ml[[2]]$lambda_a, 4.361328419843256e-06,
                 tolerance = 0.01)
    expect_equal(oceanic_ml[[2]]$loglik, -137.54303042188292,
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
    expect_equal(novel_ml[[1]]$lambda_c, 1.2223887472810917,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$mu, 1.1512896404012887,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$K, 2.7168840657527613,
                 tolerance = 0.5)
    expect_equal(novel_ml[[1]]$gamma, 0.024916121197736864,
                 tolerance = 0.0001)
    expect_equal(novel_ml[[1]]$lambda_a, 2.1065500323177081e-08,
                 tolerance = 0.01)
    expect_equal(novel_ml[[1]]$loglik, -157.07466876950016,
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
    expect_equal(novel_ml[[2]]$loglik, -175.97987102745003,
                 tolerance = 0.01)
    expect_equal(novel_ml[[2]]$df, 5)
    expect_equal(novel_ml[[2]]$conv, 0)
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

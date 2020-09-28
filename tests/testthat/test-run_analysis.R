context("run_analysis")

test_that("run full function", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 2
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
    param_space <- load_param_space(
      param_space_name = param_space_name)

    sim_pars <- extract_param_set(
      param_space_name = param_space_name,
      param_space = param_space,
      param_set = param_set)

    novel_sim <- run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )

    novel_ml <- run_analysis(
      novel_sim = novel_sim,
      param_space_name = param_space_name,
      replicates = replicates,
      sim_pars = sim_pars,
      distance_method = "abs"
    )

    expect_length(novel_ml, 15)
    expect_equal(novel_ml$spec_error, list(nltt = c(15.503890523544152,
                                                    20.628037579208026),
                                         num_spec_error = c(8, 2),
                                         num_col_error = c(7, 4)),
                 tolerance = 0.2)
    expect_equal(novel_ml$endemic_error, list(nltt = c(22.501272166425160,
                                                       27.157312775376028)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_error, list(nltt = c(10.4366517414679478,
                                                          6.9865356692858667)),
                 tolerance = 0.2)
    expect_equal(novel_ml$spec_baseline_error, list(
      nltt = c(21.6799281149035714 ,
               3.9836578128417264),
      num_spec_error = c(5, 2),
      num_col_error = c(1, 7)),
      tolerance = 0.2)
    expect_equal(novel_ml$endemic_baseline_error,
                 list(nltt = c(18.9241683837498265, 4.6650692726446508)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_baseline_error,
                 list(nltt = c(6.0997048449159985, 3.6480235281355120)),
                 tolerance = 0.2)
    expect_equal(novel_ml$error_metrics,
                 list(num_spec_mean_diff = 1.5,
                      num_spec_sd_diff = 2.1213203435596424,
                      num_col_mean_diff = 1.5,
                      num_col_sd_diff = 2.1213203435596424,
                      spec_nltt_mean_diff = 5.2341710875034391,
                      endemic_nltt_mean_diff = 13.034673642703355,
                      nonendemic_nltt_mean_diff = 3.8377295188511527,
                      spec_nltt_sd_diff = 8.8898336014410368,
                      endemic_nltt_sd_diff = 6.7903877870044402,
                      nonendemic_nltt_sd_diff = 0.70599998611679937),
                 tolerance = 0.2)
    expect_equal(novel_ml$novel_ml,
                 list(data.frame("lambda_c" = 0.88244548959215419,
                                 "mu" = 0.31137550513861417,
                                 "K" = 13.828772973091263,
                                 "gamma" = 0.011864263393319429,
                                 "lambda_a" = 0.70153259936404377,
                                 "loglik" = -192.12110891415833,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.80346632893912595,
                                 "mu" = 2.0016823546260964e-07,
                                 "K" = 9.0918224176815556,
                                 "gamma" = 0.0098273147856722566,
                                 "lambda_a" = 0.95684544043417874,
                                 "loglik" = -200.16984729494939,
                                 "df" = 5,
                                 "conv" = 0)),
                 tolerance = 0.2)
    # oceanic_sim_1 reference
    expect_length(novel_ml$oceanic_sim_1, 2)
    expect_length(novel_ml$oceanic_sim_1[[1]][[1]], 32)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$not_present, 969)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 118)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.041908179742209797))
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_1[[2]][[1]], 30)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$not_present, 971)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 78)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55000000000000, 0.82320728572358004))
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
    # oceanic_sim_2 reference
    expect_length(novel_ml$oceanic_sim_2, 2)
    expect_length(novel_ml$oceanic_sim_2[[1]][[1]], 31)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$not_present, 970)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 139)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$branching_times,
                 c(2.55, 0.229137735142440013, 0.056686987265089701))
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_2[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_2[[2]][[1]], 37)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$not_present, 964)
    expect_equal(nrow(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 83)
    expect_equal(ncol(novel_ml$oceanic_sim_2[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$branching_times,
                 c(2.55,
                   0.432405070355510013,
                   0.261396415512720026,
                   0.065332249010409807), tolerance = 0.001)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_2[[2]][[1]][[2]]$missing_species, 0)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("abuse", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 1
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )

    param_space <- load_param_space(
      param_space_name = param_space_name)

    sim_pars <- extract_param_set(
      param_space_name = param_space_name,
      param_space = param_space,
      param_set = param_set)

    novel_sim <- run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )

    expect_error(
      novel_ml <- run_analysis(
        novel_sim = "nonsense",
        param_space_name = param_space_name,
        replicates = replicates,
        sim_pars = sim_pars,
        distance_method = "abs"
      )
    )
    expect_error(
      novel_ml <- run_analysis(
        novel_sim = novel_sim,
        param_space_name = 123,
        replicates = replicates,
        sim_pars = sim_pars,
        distance_method = "abs"
      )
    )
    expect_error(
      novel_ml <- run_analysis(
        novel_sim = novel_sim,
        param_space_name = param_space_name,
        replicates = "nonsense",
        sim_pars = sim_pars,
        distance_method = "abs"
      )
    )
    expect_error(
      novel_ml <- run_analysis(
        novel_sim = novel_sim,
        param_space_name = param_space_name,
        replicates = replicates,
        sim_pars = "nonsense",
        distance_method = "abs"
      )
    )
  } else {
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("ml constraints fail", {
  if (Sys.getenv("TRAVIS") != "" && Sys.info()[[1]] != "Darwin" ||
      Sys.getenv("APPVEYOR") != "") {
    replicates <- 2
    param_space_name <- "nonoceanic"
    param_set <- 1
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
    param_space <- load_param_space(
      param_space_name = param_space_name)

    sim_pars <- extract_param_set(
      param_space_name = param_space_name,
      param_space = param_space,
      param_set = param_set)

    novel_sim <- run_novel_sim(
      param_space_name = param_space_name,
      sim_pars = sim_pars,
      replicates = replicates
    )

    novel_ml <- run_analysis(
      novel_sim = novel_sim,
      param_space_name = param_space_name,
      replicates = replicates,
      sim_pars = sim_pars,
      distance_method = "abs"
    )

    expect_length(novel_ml, 10)
    expect_equal(novel_ml$spec_error, list(nltt = c(27.672866899993707,
                                                    13.658638064673603),
                                           num_spec_error = c(7, 4),
                                           num_col_error = c(5, 8)),
                 tolerance = 0.2)
    expect_equal(novel_ml$endemic_error, list(nltt = c(29.5228064145322051,
                                                       9.8975411551966825)),
                 tolerance = 0.2)
    expect_equal(novel_ml$nonendemic_error, list(nltt = c(5.4611491100033316,
                                                          11.9934047964984707)),
                 tolerance = 0.5)
    expect_equal(novel_ml$novel_ml,
                 list(data.frame("lambda_c" = 0.2391080686600785,
                                 "mu" = 0.24376346547628622,
                                 "K" = 1373703.6829030684,
                                 "gamma" = 0.0090861265426438378,
                                 "lambda_a" = 0.73849953019711867,
                                 "loglik" = -125.64128158907532,
                                 "df" = 5,
                                 "conv" = 0),
                      data.frame("lambda_c" = 0.24432201256427705,
                                 "mu" = 0.42565033735003227,
                                 "K" = 5746852.9702726277,
                                 "gamma" = 0.012682615307086051,
                                 "lambda_a" = 0.85982749644033374,
                                 "loglik" = -147.52903937918407,
                                 "df" = 5,
                                 "conv" = 0)),
                 tolerance = 0.2)
    # oceanic_sim_1 reference
    expect_length(novel_ml$oceanic_sim_1, 2)
    expect_length(novel_ml$oceanic_sim_1[[1]][[1]], 14)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$not_present, 987)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 35)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[1]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$branching_times,
                 c(2.55, 1.1352583531453999))
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$stac, 4)
    expect_equal(novel_ml$oceanic_sim_1[[1]][[1]][[2]]$missing_species, 0)
    expect_length(novel_ml$oceanic_sim_1[[2]][[1]], 30)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$island_age, 2.55)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$not_present, 971)
    expect_equal(nrow(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 94)
    expect_equal(ncol(novel_ml$oceanic_sim_1[[2]][[1]][[1]]$stt_all), 5)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$branching_times,
                 c(2.55000000000000, 1.8700821388704600))
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$stac, 2)
    expect_equal(novel_ml$oceanic_sim_1[[2]][[1]][[2]]$missing_species, 0)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})
